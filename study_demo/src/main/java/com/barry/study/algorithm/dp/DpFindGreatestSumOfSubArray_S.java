package com.barry.study.algorithm.dp;

import java.util.Arrays;

/**
 *  输入一个长度为n的整型数组array，数组中的一个或连续多个整数组成一个子数组，
 *  子数组最小长度为1。求所有子数组的和的最大值。
 *
 *  数据范围:
 *  1<=n<=2×105
 * −100<=a[i]<=100-100 <= a[i] <= 100−100<=a[i]<=100
 *
 *  要求:时间复杂度为 O(n)O(n)O(n)，空间复杂度为 O(n)O(n)O(n)
 *  进阶:时间复杂度为 O(n)O(n)O(n)，空间复杂度为 O(1)O(1)O(1)
 */
public class DpFindGreatestSumOfSubArray_S {
    public static void main(String[] args) {
        int[] array = {1,-2,3,10,-4,7,2,-5};
        System.out.println(findGreatestSumOfSubArray(array));
    }

    /**
     * 求所有子数组和的最大值
     * @param array 子数组
     * @return 最大和
     */
    private static int findGreatestSumOfSubArray(int[] array) {
        // 确定状态（最后一步，化成子问题）
        // 最后一步：f[n-1] ,子问题：f[n]=max{f[n-1]+array[n],array[n]}
        // 前n项和+加上当前值在与当前值比较，获取最大的，如果比当前大说明连续，如果比当前小说明不连续重新计算
        // 确认开始和边界条件 f[0]=array[0],遍历从第二个位置开始遍历
        // 转换方程 f[n]=max{f[n-1]+array[n],array[n]}

        // dp数组 前n项和数组
        int[] f = new int[array.length];

        // 开始
        f[0] = array[0];
        int maxSum = array[0];
        // 边界条件
        for(int n = 1;n<array.length;n++){
            // 子问题
            f[n] = Math.max(f[n-1]+array[n],array[n]);
            maxSum = Math.max(f[n],maxSum);
        }

        // 打印dp数组
        System.out.println(Arrays.toString(f));

        return maxSum;
    }
}
