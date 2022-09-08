package com.barry.study.nowcoder.simple;

public class BinarySearchDemo {
    public static void main(String[] args) {
        int[] nums = new int[]{-1,0,3,4,6,10,13,14};
        int target = 2;
        System.out.println(search(nums, target));
    }

    public static int search (int[] nums, int target) {
        // write code here
        if(nums == null){
            return -1;
        }
        int r = nums.length -1;
        int l = 0;
        while (l<=r) {
            int mid = (l+r) / 2;
            // 如果相等返回下标索引
            if(nums[mid] == target){
                return mid;
            } else if(nums[mid] > target){
                r = mid - 1;
            } else if(nums[mid] < target){
                l = mid + 1;
            }
        }
        return -1;
    }
}
