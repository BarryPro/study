package com.barry.study.algorithm.dp;

/**
 * BM66 最长公共子串
 *
 * 给定两个字符串str1和str2,输出两个字符串的最长公共子串
 * 题目保证str1和str2的最长公共子串存在且唯一。
 *
 * 数据范围： 1≤∣str1∣,∣str2∣≤50001 \le |str1|,|str2| \le 5000 1≤∣str1∣,∣str2∣≤5000
 * 要求： 空间复杂度 O(n2)O(n^2)O(n2)，时间复杂度 O(n2)O(n^2)O(n2)
 */
public class DpLongestCommonSubString_M {
    public static void main(String[] args) {
        String str1 = "123455";
        String str2 = "11111";
        System.out.println(LCS(str1, str2));
    }

    private static String LCS(String str1,String str2){
        // 确定状态  子问题 最后一步 最长的长度，和产生最长的字符的当前位置，所以从当前位置向前推max位就是开始位置，然后截取子串
        // 最后一步，如果最长子串是dp[x][y] 表示str1的第x到str2的第y个为止最长的子串长度
        // 递推公式 dp[x][y] = dp[x-1][y-1] + 1
        // 确定开始与边界 dp二维数组默认值为0,表示没有最长子串
        // 边界条件：str1.charAt(x-1) == str2.charAt(y-1) 增加长度
        // 动态规划二维数组
        int[][] dp = new int[str1.length() + 1][str2.length() + 1];
        // 最长子串长度
        int max = 0;
        // 子串结束位置
        int endPos = 0;
        // 遍历两个字符串设置dp的数组内容,x和y分别表示的事位置，不是下标索引，位置=下标+1
        for(int x = 1;x<=str1.length();x++){
            for(int y = 1;y<=str2.length();y++){
                if(str1.charAt(x-1) == str2.charAt(y-1)){
                    // 增加长度
                    dp[x][y] = dp[x-1][y-1] + 1;
                } else {
                    // 开始状态初始化
                    dp[x][y] = 0;
                }
                if(dp[x][y] > max){
                    max = dp[x][y];
                    // 记录结束位置x-1,因为下标是从0开始的，所以x位置的索引是x-1
                    endPos = x - 1;
                }
            }
        }
        // 往前推max长度
        return str1.substring(endPos + 1 - max, endPos + 1);
    }
}
