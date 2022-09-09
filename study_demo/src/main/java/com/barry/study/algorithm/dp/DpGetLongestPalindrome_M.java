package com.barry.study.algorithm.dp;

/**
 * 最长回文子串
 *
 * 对于长度为n的一个字符串A（仅包含数字，大小写英文字母），
 * 请设计一个高效算法，计算其中最长回文子串的长度
 *
 * 回文子串定义：就是对称的字符串，例如aba  bab oto
 *
 *  数据范围： 1≤n≤10001 \le n \le 10001≤n≤1000
 * 要求：空间复杂度 O(1)O(1)O(1)，时间复杂度 O(n2)O(n^2)O(n2)
 * 进阶:  空间复杂度 O(n)O(n)O(n)，时间复杂度 O(n)O(n)O(n)
 */
public class DpGetLongestPalindrome_M {
    public static void main(String[] args) {
        String [] array = {"ababc","abbba","b"};
        for (String A : array) {
            System.out.println(getLongestPalindrome(A));
        }
    }

    /**
     * 计算最长回文子串长度
     * @param A 字符串
     * @return 最长回文子串长度
     */
    private static int getLongestPalindrome(String A){
        // 确定状态（化成子问题）
        // 定义二维数组dp[left][right]=true 表示从左到右是回文，dp[left][right]=false,表示重做到右不是回文
        // 化成子问题：如果 dpf[left+1][right-1] 为true,判断s.chatAt(left)和s.charAt(right)是否相等，如果相等也是回文，否则dp[left][right]一定不是回文
        // 最后一步：表示遍历玩当前字符串的最长子串得到dp二维数组如果left==right通过右下标减左下标+1就是回文串长度
        // 转换公式 dp[left][right] = s.charAt(left)==s.charAt(right)&& dp[left+1][right-1]
        // 边界条件(根据递推公式得到边界条件）：长度小于2就是字符串长度，开始从第二个开始，一个字符就是回文字符
        // 边界条件 s.charAt(left)！=s.charAt(right) 说明left到right不是回文串
        // 如果s.charAt(left)==s.charAt(right)  且 right-left <= 2 类似 aa  aba 也是回文
        // 如果s.charAt(left)==s.charAt(right)  且 right-left > 2 需要按递归公式判断 dp[left][right]=dp[left+1][right-1]
        int n = A.length();
        if(A.length() < 2){
            return n;
        }


        int maxSubLength = 1;
        // 初始化动态规划表，默认值是false，表示不是回文
        boolean[][] dp = new boolean[n][n];
        // 组合所有子串
        // 右边从第2个索引开始遍历,右下标控制子串的长度
        for(int right = 1;right < n; right++){
            // 左边从头开始遍历，到右边索引为止
            for(int left = 0;left <= right;left++){
                // 如果字符不对称相等，说明不是回文
                if(A.charAt(left) != A.charAt(right)){
                    continue;
                }

                // 下面是charAt(left) == A.charAt(right)的情况
                if(right - left <= 2){
                    dp[left][right] = true;
                } else {
                    // 递推公式，要判断左右，先判断左右子串是否是回文
                    // right-1 索引一定先被初始化赋值，不会出现为赋值的情况
                    dp[left][right] = A.charAt(left)==A.charAt(right)&& dp[left+1][right-1];
                }
                // 记录最长回文
                if(dp[left][right] && (right - left + 1) > maxSubLength){
                    maxSubLength = right - left + 1;
                }
            }
        }

        return maxSubLength;
    }
}
