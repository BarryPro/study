package com.barry.study.nowcoder.middle;

import java.util.Arrays;

/**
 * 有 n 个活动即将举办，每个活动都有开始时间与活动的结束时间，第 i 个活动的开始时间是 starti ,第 i 个活动的结束时间是 endi ,举办某个活动就需要为该活动准备一个活动主持人。
 *
 * 一位活动主持人在同一时间只能参与一个活动。并且活动主持人需要全程参与活动，换句话说，一个主持人参与了第 i 个活动，那么该主持人在 (starti,endi) 这个时间段不能参与其他任何活动。求为了成功举办这 n 个活动，最少需要多少名主持人。
 *
 * 数据范围: 1≤n≤1051 \le n \le 10^51≤n≤105 ， −232≤starti≤endi≤231−1-2^{32} \le start_i\le end_i \le 2^{31}-1−232≤starti​≤endi​≤231−1
 *
 * 复杂度要求：时间复杂度 O(nlog⁡n)O(n \log n)O(nlogn) ，空间复杂度 O(n)O(n)O(n)
 *
 * 贪心算法
 */
public class MinmumNumberOfHostDemo {
    public static void main(String[] args) {
        int [][] startEnd = new int[][]{{1,3},{2,4}};
        System.out.println(minmumNumberOfHost(2, startEnd));
    }

    /**
     * 计算举办n厂活动至少需要多少个主持人
     * @param n 活动个数
     * @param startEnd 活动的开始和结束时间
     * @return 主持人数量
     */
    public static int minmumNumberOfHost(int n,int [][] startEnd){
        if(startEnd == null){
            return 0;
        }

        // n个活动就有n个开始时间和结束时间
        int [] start = new int[n];
        int[] end = new int[n];
        // 分别记录开始时间和结束时间
        for(int i = 0;i< n;i++){
            start[i] = startEnd[i][0];
            end[i] = startEnd[i][1];
        }

        // 时间排序
        Arrays.sort(start);
        Arrays.sort(end);

        int res = 0;
        int j = 0;
        for(int i = 0;i<n;i++){
            // 新开始的节目大于上一轮结束时间，主持人不变
            if(start[i] >= end[j]){
                j++;
            } else {
                // 主持人增加
                res++;
            }
        }

        // 主持人数量
        return res;
    }
}
