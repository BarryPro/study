package com.barry.study.algorithm.dp;

import java.util.Arrays;

/**
 * 跳台阶
 * 描述
 * 一只青蛙一次可以跳上1级台阶，也可以跳上2级。
 * 求该青蛙跳上一个 n 级的台阶总共有多少种跳法（先后次序不同算不同的结果）。
 *
 *  数据范围：1≤n≤401 \leq n \leq 401≤n≤40
 * 要求：时间复杂度：O(n)O(n)O(n) ，空间复杂度： O(1)O(1)O(1)
 */
public class DpJumpFloor_S {
    public static void main(String[] args) {
        int n = 7;
        System.out.println(jumpFloor(n));
        System.out.println(jumpFloor_O1(n));
    }

    /**
     * 跳上n级台阶有多少种跳法
     * @param target 目标台阶
     * @return 跳法数量
     */
    private static int jumpFloor(int target){
        // 确定状态 最后一步，子问题
        // 最后一步 target台阶可以从target-1级台阶跳，也可以从target-2级台阶跳到
        // 化成子问题 target台阶调法右  target-1和target-2台阶的总和就是target的跳法
        // 确定开始和边界条件 从第3个位子开始跳
        // 开始 f[0]=1,第一个台阶只有一种跳法，f[1]=f[0]+1=2种调法
        // 转换方程 f[target]=f[target-1]+f[target-2]
        if(target <= 1){
            return 1;
        }
        int[] f = new int[target];
        f[0] = 1;
        f[1] = 2;
        for(int i = 2;i<target;i++){
            f[i] = f[i-1] + f[i-2];
        }
        // System.out.println(Arrays.toString(f));
        return f[target - 1];
    }

    /**
     * O(1)算法
     */
    private static int jumpFloor_O1(int target){
        if(target <= 1){
            return 1;
        }
        int res = 0;
        // 递增序列定义
        int a = 1;
        int b = 2;
        for(int i = 2;i<target;i++){
            res = a + b;
            a = b;
            b = res;
        }

        return res;
    }
}
