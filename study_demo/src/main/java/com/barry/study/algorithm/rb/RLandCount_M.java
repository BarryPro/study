package com.barry.study.algorithm.rb;

/**
 * 岛屿数量
 * 给一个01矩阵，1代表是陆地，0代表海洋， 如果两个1相邻，那么这两个1属于同一个岛。我们只考虑上下左右为相邻。
 * 岛屿: 相邻陆地可以组成一个岛屿（相邻:上下左右） 判断岛屿个数。
 *
 *  [
 * [1,1,0,0,0],
 * [0,1,0,1,1],
 * [0,0,0,1,1],
 * [0,0,0,0,0],
 * [0,0,1,1,1]
 * ]
 * 对应的输出为3
 * (注：存储的01数据其实是字符'0','1')
 */
public class RLandCount_M {
    public static void main(String[] args) {
        char[][] grid = {{'1', '1', '0', '0', '0'},{'0','1','0','1','1'},{'0','0','0','1','1'},{'0','0','0','0','0'},{'0','0','1','1','1'}};
        System.out.println(landCount(grid));
    }

    private static int landCount(char[][] grid){
        if(null == grid){
            return 0;
        }
        int n = grid.length;
        int m = grid[0].length;
        // 岛屿数量
        int landCount = 0;
        for(int i = 0;i<n;i++){
            for(int j = 0;j<m;j++){
                if(grid[i][j] == '1'){
                    landCount ++;
                    // 深度递归遍历i,j位置的上下左右方向判断岛屿是否相连
                    recursion(grid,i,j);
                }
            }
        }
        return landCount;
    }

    private static void recursion(char[][] grid,int i,int j) {
        int n = grid.length;
        int m = grid[0].length;
        // 设置当前岛屿访问过，为0，只要能找到相临的1就说明是相连的
        grid[i][j] = '0';
        if(i - 1 >=0 && grid[i-1][j] == '1'){
            // 向左
            recursion(grid,i-1,j);
        }
        if(i + 1 < n && grid[i+1][j] == '1'){
            // 向右
            recursion(grid,i+1,j);
        }
        if(j-1 >=0 && grid[i][j-1] == '1'){
            // 向上
            recursion(grid,i,j-1);
        }
        if(j+1 <m && grid[i][j+1] == '1'){
            // 向下
            recursion(grid,i,j+1);
        }
    }
}
