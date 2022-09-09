package com.barry.study.algorithm.dp;

import java.util.Arrays;

/**
 *  最小花费爬楼梯
 *  给定一个整数数组 cost cost \ cost  ，其中 cost[i] cost[i]\ cost[i]
 *  是从楼梯第i i \ i 个台阶向上爬需要支付的费用，下标从0开始。
 *  一旦你支付此费用，即可选择向上爬一个或者两个台阶。
 *
 *  你可以选择从下标为 0 或下标为 1 的台阶开始爬楼梯。
 *  请你计算并返回达到楼梯顶部的最低花费。
 *  数据范围：数组长度满足 1≤n≤105 1 \le n \le 10^5 \ 1≤n≤105  ，
 *  数组中的值满足 1≤costi≤104 1 \le cost_i \le 10^4 \ 1≤costi​≤104
 */
public class DpMinCostClimbingStairs_S {
    public static void main(String[] args) {
        int[] cost = {1,100,1,1,1,90,1,1,80,1};
        System.out.println(minCostClimbingStairs(cost));
    }

    /**
     * 计算并返回达到楼梯顶部的最低花费
     * @param cost 楼梯台阶对应的费用数组
     * @return 最低花费
     */
    private static int minCostClimbingStairs(int[] cost) {
        // 确定状态（最后一步，化成子问题）
        // 最后一步：i需要从i-1或者i-2台阶上来，子问题  计算i-1和i-2所需要的费用最小的一个就是到达i层的费用
        // 转换方程：f[i] = f[i-1]+f[i-2]
        // 确认开始和边界条件：f[0]=0,f[1]=0 一次可以选择跳一层也可以跳两层,边界：从第2层开始遍历，小于等于2层不花钱
        if(null == cost){
            return 0;
        }
        if(cost.length <= 2){
            return 0;
        }

        // 动态数组是台阶的长度+1
        int[] f = new int[cost.length+1];
        // 可以使用数组默认值不写
        f[0] = 0;
        f[1] = 0;

        // 遍历台阶层数
        for(int i = 2;i<=cost.length;i++){
            // 上i阶台阶,只需支付上一次台阶的最低价就可以上到当前台阶
            f[i] = Math.min(f[i - 1] + cost[i - 1], f[i - 2] + cost[i - 2]);
        }

        // System.out.println(Arrays.toString(f));
        // 支付倒数第二次台阶钱就可以上到楼顶
        return f[cost.length];
    }
}
