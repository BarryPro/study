package com.barry.study.algorithm.dp;

import java.util.Arrays;

/**
 *  矩阵最长递增路径
 *   给定一个 n 行 m 列矩阵 matrix ，矩阵内所有数均为非负整数。 你需要在矩阵中找到一条最长路径，使这条路径上的元素是递增的。并输出这条最长路径的长度。
 *  这个路径必须满足以下条件：
 *
 * 1. 对于每个单元格，你可以往上，下，左，右四个方向移动。 你不能在对角线方向上移动或移动到边界外。
 * 2. 你不能走重复的单元格。即每个格子最多只能走一次。
 *
 * 数据范围：1≤n,m≤10001 \le n,m \le 1000 1≤n,m≤1000，0≤matrix[i][j]≤10000 \le matrix[i][j] \le 1000 0≤matrix[i][j]≤1000
 * 进阶：空间复杂度 O(nm)O(nm)O(nm) ，时间复杂度 O(nm)O(nm)O(nm)
 *
 * 例如：当输入为[[1,2,3],[4,5,6],[7,8,9]]时，对应的输出为5，
 * 其中的一条最长递增路径如下图所示：
 */
public class DpRDfsLongestIncrPath_M {
    // 方向数组
    private static final int[][] dirs = {{-1,0},{1,0},{0,-1},{0,1}};
    private static int n;
    private static int m;

    public static void main(String[] args) {
        int[][] matrix = {{1,2,3},{4,5,6},{7,8,9}};
        System.out.println(longestIncrPath(matrix));
    }

    private static int longestIncrPath(int[][] matrix){
        if(matrix == null){
            return 0;
        }

        if(matrix.length == 0 || matrix[0].length == 0){
            return 0;
        }
        n = matrix.length;
        m = matrix[0].length;

        int[][] dp = new int[n][m];
        int maxIncrPath = 0;
        // 遍历每一个节点
        for(int i = 0;i<n;i++){
            for(int j = 0;j<m;j++){
                // 每个节点按深度遍历处理最长递增路径
                maxIncrPath = Math.max(maxIncrPath, dfs(matrix,dp,i,j));
            }
        }

        /*
         打印dp数组
         for (int[] rows : dp) {
             System.out.println(Arrays.toString(rows));
         }
        */

        return maxIncrPath;
    }

    /**
     * 深度遍历处理最长递增路径
     * @param matrix 原始坐标数组
     * @param dp 动态规划表
     * @param i x轴坐标
     * @param j y轴坐标
     * @return i,j 位置对应的最长递增路径
     */
    private static int dfs(int[][] matrix,int[][] dp,int i,int j){
        // 如果动态规划表对应的i,j位置不为0,说明当前位置有最长递增路径，直接返回
        if(dp[i][j] != 0){
            return dp[i][j];
        }
        // 开始状态，如果当前位置为0,则初始化当前位置加1
        dp[i][j] = 1;
        // 遍历4个方向,选取4个方向中最长的路径
        for(int k = 0;k<4;k++){
            int nextI = i + dirs[k][0];
            int nextJ = j + dirs[k][1];
            // 检查坐标边界
            // 如果下一次移动位置比当前位置的大，继续深度遍历
            if(nextI >=0 && nextI < n && nextJ >=0 && nextJ < m && matrix[nextI][nextJ] > matrix[i][j]){
                // 动态规划递推方程（状态转换方程）
                dp[i][j] = Math.max(dp[i][j], dfs(matrix, dp, nextI, nextJ) + 1);
            }
        }
        return dp[i][j];
    }
}
