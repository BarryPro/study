package com.barry.study.nowcoder.hard;

/**
 * BM 95 分糖果问题
 * <p>
 * 一群孩子做游戏，现在请你根据游戏得分来发糖果，要求如下：
 * <p>
 * 1. 每个孩子不管得分多少，起码分到一个糖果。
 * 2. 任意两个相邻的孩子之间，得分较多的孩子必须拿多一些糖果。(若相同则无此限制)
 * <p>
 * 给定一个数组 arrarrarr 代表得分数组，请返回最少需要多少糖果。
 * <p>
 * 要求: 时间复杂度为 O(n)O(n)O(n) 空间复杂度为 O(n)O(n)O(n)
 * <p>
 * 数据范围： 1≤n≤1000001 \le n \le 100000 1≤n≤100000 ，1≤ai≤10001 \le a_i \le 1000 1≤ai​≤1000
 * <p>
 * 贪心算法：最少需要多少个
 *
 * @author barry
 * @version 1.0
 * @date 9/8/22 11:01 PM
 */
public class CandyDemo {
    public static void main(String[] args) {
        int[] arr = new int[]{1, 1, 2};
        System.out.println(candy(arr));
    }

    /**
     * @param arr 得分组
     * @return 最少需要多少糖果
     */
    public static int candy(int[] arr) {
        int n = arr.length;
        if (n <= 1) {
            return n;
        }
        int[] nums = new int[n];
        // 初始化数组（得分住），默认每个孩子都要分一个糖果
        for (int i = 0; i < n; i++) {
            nums[i] = 1;
        }
        // 从左到右遍历 fast-template（解决升序递增的问题）
        for (int i = 1; i < arr.length; i++) {
            // 如果当前孩子比前一个孩子得分高，当前孩子的糖果增加一个
            // 如果右边在递增，每次增加一个
            if (arr[i] > arr[i - 1]) {
                nums[i] = nums[i - 1] + 1;
            }
        }
        // 记录总糖果数,初始化为右边第一个数
        int res = nums[arr.length -1];
        // 从右到左遍历，从右边第二个数开始遍历（为了解决降序的问题）
        for(int i = arr.length - 2; i >= 0; i--){
            // 如果左边更大但是糖果数更小
            if(arr[i] > arr[i + 1] && nums[i] <= nums[i + 1]){
                // 在右边小朋友糖果的基础上增加一个糖果
                nums[i] = nums[i + 1] + 1;
            }
            res += nums[i];
        }
        return res;
    }
}
