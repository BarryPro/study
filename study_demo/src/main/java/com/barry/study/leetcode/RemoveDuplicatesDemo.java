package com.barry.study.leetcode;

import java.util.Arrays;

public class RemoveDuplicatesDemo {
    public static void main(String[] args) {
        int[] nums = new int[]{0, 0, 1, 1, 1, 2, 2, 3, 3, 4};
        System.out.println(removeDuplicates(nums));
    }

    public static int removeDuplicates(int[] nums) {
        if (nums == null) {
            return 0;
        }
        if(nums.length < 2){
            return 1;
        }
        System.out.println(Arrays.toString(nums));
        // 初始位置，用于记录当前index索引前的数据都是有序的
        int index = 0;
        for (int i = 1; i < nums.length; i++) {
            // 如果判断相等索引位置不动，如果不等，index位置先加一，因为index所在位置和之前的数据是有序的，
            // 所以要先加一，然后把当前游标i位置的数据给index+1的位置，然后index+1，此时，前index+1就是有序的了
            if (nums[index] != nums[i]) {
                nums[++index] = nums[i];
            }
        }
        System.out.println(Arrays.toString(nums));
        // 由于计算数组的下标，所以返回值先做加一操作
        return index + 1;
    }
}
