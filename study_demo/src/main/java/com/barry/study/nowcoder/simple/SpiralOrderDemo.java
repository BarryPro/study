package com.barry.study.nowcoder.simple;

import java.util.ArrayList;

/**
 *  给定一个m x n大小的矩阵（m行，n列），按螺旋的顺序返回矩阵中的所有元素。
 *
 * 数据范围：0≤n,m≤100 \le n,m \le 100≤n,m≤10，矩阵中任意元素都满足 ∣val∣≤100|val| \le 100∣val∣≤100
 * 要求：空间复杂度 O(nm)O(nm)O(nm) ，时间复杂度 O(nm)O(nm)O(nm)
 */
public class SpiralOrderDemo {
    public static void main(String[] args) {
        int [][] matrix = new int[][]{{1,2,3},{4,5,6},{7,8,9}};
        System.out.println(spiralOrder(matrix));
    }

    public static ArrayList<Integer> spiralOrder(int[][] matrix) {
        ArrayList<Integer> res = new ArrayList<>();
        // 先排除特殊情况 fast-template
        if(matrix.length == 0){
            return res;
        }
        // 左边界
        int left = 0;
        // 右边界
        int right = matrix[0].length - 1;
        // 上边界
        int up = 0;
        // 下边界
        int down = matrix.length - 1;
        // 直到边界重合
        while (left <= right && up <= down) {
            // 上边界的从左到右
            for(int i = left;i<=right;i++){
                // 横坐标移动
                res.add(matrix[up][i]);
            }
            // 上边界向下
            up++;
            if(up > down){
                break;
            }
            for(int i = up;i<=down;i++){
                // 纵坐标移动
                res.add(matrix[i][right]);
            }
            // 从右边界向左
            right--;
            if(left > right){
                break;
            }
            for(int i = right;i>=left;i--){
                res.add(matrix[down][i]);
            }
            // 下边界向上
            down--;
            if(up > down){
                break;
            }
            for(int i = down;i>=up;i--){
                res.add(matrix[i][left]);
            }
            // 左边界向右
            left++;
            if(left > right){
                break;
            }
        }

        return res;
    }
}
