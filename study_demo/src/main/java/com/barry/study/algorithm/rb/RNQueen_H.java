package com.barry.study.algorithm.rb;

import java.util.Arrays;

/**
 * N皇后问题
 * <p>
 * N 皇后问题是指在 n * n 的棋盘上要摆 n 个皇后，
 * 要求：任何两个皇后不同行，不同列也不在同一条斜线上，
 * 求给一个整数 n ，返回 n 皇后的摆法数。
 * <p>
 * 数据范围: 1≤n≤91 \le n \le 91≤n≤9
 * 要求：空间复杂度 O(1)O(1)O(1) ，时间复杂度 O(n!)O(n!)O(n!)
 */
public class RNQueen_H {
    // 皇后的摆法数量
    private static int count;

    public static void main(String[] args) {
        int n = 8;
        System.out.println(nQueen(n));
    }

    /**
     * step 1：对于第一行，皇后可能出现在该行的任意一列，我们用一个数组pos记录皇后出现的位置，下标为行号，元素值为列号。
     * step 2：如果皇后出现在第一列，那么第一行的皇后位置就确定了，接下来递归地在剩余的n−1n-1n−1行中找n−1n-1n−1个皇后的位置。
     * step 3：每个子问题检查是否符合条件，我们可以对比所有已经记录的行，对其记录的列号查看与当前行列号的关系：即是否同行、同列或是同一对角线。
     *
     * @param n nxn棋盘
     * @return 换后的摆法数量
     */
    private static int nQueen(int n) {
        // 条件判断
        if (n < 0) {
            return 0;
        }

        // 摆法初始值
        count = 0;

        // 下标为行号，元素为列号，记录皇后的位置
        int[] pos = new int[n];
        // 递归摆放皇后位置
        recursion(n, 0, pos);

        // 返回摆法数量
        return count;
    }

    /**
     * 递归
     *
     * @param n   nxn棋盘
     * @param row 行号
     * @param pos 位置下标集合
     */
    private static void recursion(int n, int row, int[] pos) {
        // 如果全部行都选择了位子结果加上最后一个位置直接返回，因为最后一行只有一个位置可以选择才是最大的数量
        if (row == n) {
            count++;
            return;
        }
        // 遍历所有列
        for (int i = 0; i < n; i++) {
            // 检查当前位子是否符合条件摆放
            if (isValid(pos, row, i)) {
                // 记录对应的行和列
                pos[row] = i;
                // 打印位置摆放信息
                // System.out.println(Arrays.toString(pos));
                // 递归处理下一行的摆法
                recursion(n, row + 1, pos);
            }
        }
    }

    /**
     * 检查放到（row,col）位置，皇后是否符合规范
     *
     * @param pos 所有已经摆放换后的位子记录
     * @param row 行号
     * @param col 列号
     * @return true：有效，false：无效
     */
    private static boolean isValid(int[] pos, int row, int col) {
        // 遍历所有已经记录的行
        for (int i = 0; i < row; i++) {
            // 1.不能放大同一列
            // 2.不在同一行
            // 3.不在同一条斜线,当前行减i行如果于当前列减上i行的列相等，说明当前位置在对接线上，因为对角线横纵坐标相等
            if (col == pos[i] || Math.abs(row - i) == Math.abs(col - pos[i])) {
                return false;
            }
        }
        return true;
    }
}
