package com.barry.study.sort;

import java.util.Arrays;

public class FastSortDemo {
    public static void main(String[] args) {
        //声明数组
        int[] nums = {49, 38, 65, 97, 76, 13, 27};
        //应用快速排序方法 I
        fastSort(nums, 0, nums.length - 1);
        System.out.println(Arrays.toString(nums));
    }

    public static void fastSort(int[] arr,int left,int right){
        int i = left;
        int j = right;
        if(i>=j){
            return;
        }
        boolean flag = true;

        while(i!=j){
            if(arr[i] > arr[j]){
                swap(arr,i,j);
                flag =!flag;
            }

            if(flag){
                j--;
            } else {
                i++;
            }
        }
        i--;
        j++;
        fastSort(arr,left,i);
        fastSort(arr,j,right);
    }

    private static void swap(int [] arr,int i,int j){
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}
