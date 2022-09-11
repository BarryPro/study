package com.barry.study.algorithm.rb;

import java.util.ArrayList;
import java.util.LinkedList;

/**
 * 没有重复项数字的全排列
 *  给出一组数字，返回该组数字的所有排列
 * 例如：
 * [1,2,3]的所有排列如下
 * [1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2], [3,2,1].
 * （以数字在数组中的位置靠前为优先级，按字典序排列输出。）
 *
 *  数据范围：数字个数 0<n≤60 < n \le 60<n≤6
 * 要求：空间复杂度 O(n!)O(n!)O(n!) ，时间复杂度 O(n!）O(n!）O(n!）
 */
public class BPermute_M {
    public static void main(String[] args) {
        int[] num = {1,2,3};
        System.out.println(permute(num));
    }

    private static ArrayList<ArrayList<Integer>> permute(int[] num){
        ArrayList<ArrayList<Integer>> list = new ArrayList<>();
        if(num == null){
            return list;
        }
        backTrack(num,0,new LinkedList<>(),list);
        return list;
    }

    private static void backTrack(int[] num,int index,LinkedList<Integer> sub,ArrayList<ArrayList<Integer>> list){
        if(index == num.length){
            list.add(new ArrayList<>(sub));
            return;
        }

        for(int i = 0;i<num.length;i++){
            if(sub.contains(num[i])){
                continue;
            }
            // 选择当前数数字
            sub.add(num[i]);
            // 递归
            backTrack(num, index + 1, sub, list);
            // 回朔
            sub.removeLast();
        }
    }
}
