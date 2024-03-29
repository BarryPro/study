package com.barry.study.algorithm.dp;

/**
 * 最长公共子序列(二)
 * 给定两个字符串str1和str2，输出两个字符串的最长公共子序列。
 * 如果最长公共子序列为空，则返回"-1"。
 * 目前给出的数据，仅仅会存在一个最长的公共子序列
 */
public class DpLongestCommonSubSequence_M {
    private static String x = "";
    private static String y = "";
    public static void main(String[] args) {
        String s1 = "1A2C3D4B56";
        String s2 = "B1D23A456A";
        System.out.println(LCS(s1, s2));
    }

    /**
     * 动态规划做法
     *
     * 思路：题目要求获取最长公共子序列，我们肯定要先知道最长到底是多长，因此肯定要先求最长公共子序列的长度，
     * 然后根据这个长度获取这个子序列。
     * （注意：子序列不是子串，子串要求所有字符必须连续，子序列不要求连续，只要求相对位置不变）
     *
     * step 1：优先检查特殊情况。
     * step 2：获取最长公共子序列的长度可以使用动态规划，我们以dp[i][j]表示在s1中以i结尾，s2中以j结尾的字符串的最长公共子序列长度。
     * step 3：遍历两个字符串的所有位置，开始状态转移：若是i位与j位的字符相等，则该问题可以变成1+dp[i−1][j−1]，
     * 即到此处为止最长公共子序列长度由前面的结果加1。
     * step 4：若是不相等，说明到此处为止的子串，最后一位不可能同时属于最长公共子序列，毕竟它们都不相同，
     * 因此我们考虑换成两个子问题，dp[i][j−1]或者dp[i−1][j]，我们取较大的一个就可以了，由此感觉可以用递归解决。
     * step 5：但是递归的复杂度过高，重复计算了很多低层次的部分，因此可以用动态规划，从前往后加，由此形成一个表，
     * 表从位置1开始往后相加，正好符合动态规划的转移特征。
     * step 6：因为最后要返回该序列，而不是长度，所以在构造表的同时要以另一个二维矩阵记录上面状态转移时选择的方向，
     * 我们用1表示来自左上方，2表示来自左边，3表示来自上边。
     * step 7：获取这个序列的时候，根据从最后一位开始，根据记录的方向，不断递归往前组装字符，只有来自左上的时候才添加本级字符，
     * 因为这种情况是动态规划中两个字符相等的情况，字符相等才可用。
     *
     * @param s1 字符串1
     * @param s2 字符串2
     * @return 最长公共子串
     */
    private static String LCS(String s1,String s2) {
        int len1 = s1.length();
        int len2 = s2.length();
        // 特殊情况
        if(len1 == 0 || len2 == 0){
            return "-1";
        }
        x = s1;
        y = s2;
        // dp[i][j]表示第一个字符串到第i位，第二个字符串到第j位为止的最长公共子序列长度
        int[][] dp = new int[len1 + 1][len2 + 1];
        // 动态规划数组想加的方向
        int[][] f = new int[len1 + 1][len2 + 1];
        // 遍历两个字符串每个位置的最长长度
        for(int i = 1; i<=len1;i++){
            for(int j = 1;j<=len2;j++){
                // 遇到两个字符相等，因为是从1开始遍历的，所以索引要减1才是下标，就是当前位置的索引
                // 为什么选择i-1是因为动态规划推倒子问题时dp[i][j]=1+dp[i−1][j−1]
                // s1.charAt(i-1) == s2.charAt(j-1)表示两个字符串从头开始遍历
                if(s1.charAt(i-1) == s2.charAt(j-1)){
                    // 记录当前位置的最长公共子串
                    dp[i][j] = dp[i-1][j-1]+1;
                    // 来自于左上方
                    f[i][j] = 1;
                // 遇到的两个字符不同
                } else {
                    // 左边的选择更大，即第一个字符串后退一位
                    if(dp[i - 1][j] > dp[i][j - 1]){
                        dp[i][j] = dp[i-1][j];
                        // 来自于左方
                        f[i][j] = 2;
                    // 右边的选择更大，即第二个字符串后退一位
                    } else {
                        dp[i][j] = dp[i][j-1];
                        // 来自于上方
                        f[i][j] = 3;
                    }
                }
            }
        }
        // 获取答案字符串
        String res = ans(len1,len2,f);
        // 检查答案是否为空
        if(res.isEmpty()){
            return "-1";
        } else {
            return res;
        }
    }

    /**
     * 获取最长公共子序列
     * 因为递归底层也是栈存储，所以出栈正好就把字符串变成正序的字符串了
     * @param i
     * @param j
     * @param f
     * @return 递归获取最长子序列
     */
    private static String ans(int i, int j, int[][] f) {
        String res = "";
        // 长度等于0直接返回
        if(i == 0 || j == 0){
            return res;
        }
        // 根据方向，往前递归，然后添加本级字符
        if(f[i][j] == 1){
            res += ans(i - 1, j - 1, f);
            res += x.charAt(i - 1);
        } else if(f[i][j] == 2){
            res += ans(i - 1, j, f);
        } else if(f[i][j] == 3){
            res += ans(i, j - 1, f);
        }
        return res;
    }
}
