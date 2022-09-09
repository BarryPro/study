package com.barry.study.algorithm.dp;

/**
 * 不同路径的数目(一)
 *  一个机器人在m×n大小的地图的左上角（起点）。
 * 机器人每次可以向下或向右移动。机器人要到达地图的右下角（终点）。
 * 可以有多少种不同的路径从起点走到终点？
 *
 * 备注：m和n小于等于100,并保证计算结果在int范围内
 *
 *  数据范围：0<n,m≤1000 < n,m \le 1000<n,m≤100，保证计算结果在32位整型范围内
 * 要求：空间复杂度 O(nm)O(nm)O(nm)，时间复杂度 O(nm)O(nm)O(nm)
 * 进阶：空间复杂度 O(1)O(1)O(1)，时间复杂度 O(min(n,m))O(min(n,m))O(min(n,m))
 */
public class DpUniquePaths_S {
    public static void main(String[] args) {
        int m = 4, n = 8;
        System.out.println(uniquePaths(m, n));
    }

    /**
     * 计算右多少种不同的路径从起点到终点
     * @param m 行数
     * @param n 列数
     * @return 路径数量
     */
    private static int uniquePaths(int m, int n) {
        // 确定状态（最后一步、化成子问题）
        // 最后一步：(m-1,n-1) 最后一步的上一步(m-1,n-2)或者(m-2,n-1)
        // 化成子问题：x条路径到(m-1,n-2)，y条路径到(m-2,n-1)，所以到达(m-1,n-1)就有x+y种路经到达，设f[i][j]为有多少种方式到达(i,j)
        // 确定转化方程 f[i][j]=f[i-1][j]+f[i][j-1]
        // 确定开始和边界条件 f[0][0]=1,i=0和j=0的前一步只能往一个方向走
        // f[0][0]、f[0][1]……f[0][n-1]
        // f[1][0]、f[1][1]……f[1][n-1]
        // ……
        // f[m-1][0]、f[m-1][1]……f[m-1][n-1]
        // 答案是f[m-1][n-1]

        // 初始化动态规划表，二维数组
        int[][] f = new int[m][n];
        // 开始
        f[0][0] = 1;
        // 从上到下走
        for(int i = 0; i < m; i++){
            // 从左向右走
            for(int j = 0; j < n; j++){
                // 边界条件,根据开始值和转化方程确定的
                if(i==0 ||j==0){
                    f[i][j] = 1;
                } else {
                    f[i][j] = f[i - 1][j] + f[i][j - 1];
                }
            }
        }
        // 打印dp的数组内容
        // for(int i=0;i<f.length;i++){
        //     System.out.println(Arrays.toString(f[i]));
        // }

        // 返回右下角的下标就是所有唯一路径
        return f[m-1][n-1];
    }
}
