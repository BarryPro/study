package com.barry.study.nowcoder.simple;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

public class TwoSumDemo {
    public static void main(String[] args) {
        int [] numbers = new int[] {3,2,4};
        int target = 6;
        System.out.println(Arrays.toString(twoSumOpt(numbers, target)));
    }

    /**
     *
     * @param numbers int整型一维数组
     * @param target int整型
     * @return int整型一维数组
     */
    public static int[] twoSumOpt (int[] numbers, int target) {
        int[] res = new int[]{};
        Map<Integer, Integer> map = new HashMap<>();
        for ( int i = 0;i < numbers.length;i++){
            int tmp = target - numbers[i];
            // 如果另外一个值不在map里就一直遍历，最坏的情况全部遍历变，把前n-1个都放到map里，
            // 然后最后一个数和前n-1个比较，如果也没有说明不存在数据，map的value记录了下标，
            // 只要匹配就是首次匹配，直接返回下标就可以了
            if(!map.containsKey(tmp)){
                map.put(numbers[i], i);
            } else {
                // i一定是在map存入的值之后
                return new int[]{map.get(tmp)+1, i+1};
            }
        }
        return res;
    }

    /**
     *
     * @param numbers int整型一维数组
     * @param target int整型
     * @return int整型一维数组
     */
    public static int[] twoSum (int[] numbers, int target) {
        if(numbers == null){
            return null;
        }
        for ( int i = 0;i < numbers.length - 1;i++){
            for (int j = i+1;j<numbers.length;j++){
                if(numbers[i] + numbers[j] == target){
                    return new int[]{i+1, j+1};
                }
            }
        }

        // write code here
        return null;
    }
}
