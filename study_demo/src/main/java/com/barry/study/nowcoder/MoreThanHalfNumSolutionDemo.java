package com.barry.study.nowcoder;

import java.util.HashMap;
import java.util.Map;

public class MoreThanHalfNumSolutionDemo {
    public static void main(String[] args) {
        int[] array = new int[]{1,2,3,2,2,2,5,4,2};
        System.out.println(moreThanHalfNumSolution(array));
    }

    /**
     * 计算超过以上数组
     * @param array 数组
     * @return 超过一半的数值
     */
    public static int moreThanHalfNumSolution(int [] array) {
        if(array == null){
            return -1;
        }
        Map<Integer, Integer> map = new HashMap<>();
        for (int i : array) {
            if(!map.containsKey(i)){
                map.put(i, 1);
            } else {
                map.put(i, map.get(i) + 1);
            }
            // 计算超过一半就返回
            if(map.get(i) > array.length/2){
                return i;
            }
        }
        return -1;
    }
}
