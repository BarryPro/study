package com.barry.study.algorithm.dp;

import java.util.Arrays;

/**
 * 买卖股票的最好时机(一)
 *  假设你有一个数组prices，长度为n，其中prices[i]是股票在第i天的价格，请根据这个价格数组，返回买卖股票能获得的最大收益
 * 1.你可以买入一次股票和卖出一次股票，并非每天都可以买入或卖出一次，总共只能买入和卖出一次，且买入必须在卖出的前面的某一天
 * 2.如果不能获取到任何利润，请返回0
 * 3.假设买入卖出均无手续费
 *
 *  数据范围： 0≤n≤105,0≤val≤1040 \le n \le 10^5 , 0 \le val \le 10^40≤n≤105,0≤val≤104
 * 要求：空间复杂度 O(1)O(1)O(1)，时间复杂度 O(n)O(n)O(n)
 */
public class DpMaxProfit_S {
    public static void main(String[] args) {
        int[] prices = {8,9,2,5,4,7,1};
        System.out.println(maxProfit(prices));
    }

    /**
     * 根据股票价格表计算最大收益
     * @param prices 股票价格表
     * @return 最大收益
     */
    private static int maxProfit(int[] prices) {
        // 确定状态 （最后一步，化成子问题）
        // 最后一步：最后一天不持股，到该天的最大收益，
        // 化成子问题：前一天可能持有股票也可能不持有股票 [i-1][0]不持有股票，[i-1][1]持有股票
        // dp[i][0] 表示某一天不持有股到该天为止最大收益 动态数组的值是最大收益
        // dp[i][1] 表示某天持股到该天的最大收益，dp[n-1][0]最后一天不持股到该天的最大收益就是答案
        // 开始 dp[0][0]=0第一天不持股没有收益 dp[0][1]第一天持股收益为买入股票的钱，是负数,边界：从第2天开始才能有收益
        // 转换方程
        // 第i天不持股 dp[i][0] = max{dp[i-1][0],dp[i-1][1]+prices[i]} 一直没有买入，或者当天才卖掉
        // 第i天持有股 dp[i][1] = max{dp[i-1][1],-prices[i]} 可能是一直持有当天没有卖，或者当天刚买入的股
        // 计算步骤
        int[][] dp = new int[prices.length][2];
        // 第一天不持有股，总收益0
        dp[0][0] = 0;
        // 第一天持有股票，总收益 负的当天股价
        dp[0][1] = -prices[0];

        // 遍历后续每一天，计算截止到当前i天的收益
        for(int i = 1;i< prices.length;i++){
            // 第i天不持股 dp[i][0] = max{dp[i-1][0],dp[i-1][1]+prices[i]} 一直没有买入，或者当天才卖掉
            // dp[i - 1][0] 表示一直没有持股，还没有买
            // dp[i - 1][1] + prices[i] 表示当天才卖掉持有股（之前买入后的收益+今天卖出的收益）
            dp[i][0] = Math.max(dp[i - 1][0], dp[i - 1][1] + prices[i]);
            // 第i天持有股 dp[i][1] = max{dp[i-1][1],-prices[i]} 可能是一直持有当天没有卖，或者当天刚买入的股
            // dp[i-1][1] 表示之前买入一直没有卖的收益
            // -prices[i] 表示之前买入，今天刚买入
            dp[i][1] = Math.max(dp[i - 1][1], -prices[i]);
        }

        // for(int i = 0;i< dp.length;i++){
        //     System.out.println(Arrays.toString(dp[i]));
        // }

        // 最后一天为止最大不持有股票就是最大收益，如果最后一天持有股票那就没有收益了，说明一直没有卖出去
        return dp[prices.length -1][0];
    }
}
