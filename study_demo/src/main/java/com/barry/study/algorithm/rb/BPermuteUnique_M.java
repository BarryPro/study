package com.barry.study.algorithm.rb;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;

/**
 * 有重复项数字的全排列
 *
 *  给出一组可能包含重复项的数字，返回该组数字的所有排列。结果以字典序升序排列。
 *
 * 数据范围： 0<n≤80 < n \le 8 0<n≤8 ，数组中的值满足 −1≤val≤5-1 \le val \le 5−1≤val≤5
 * 要求：空间复杂度 O(n!)O(n!)O(n!)，时间复杂度 O(n!)O(n!)O(n!)
 */
public class BPermuteUnique_M {
    public static void main(String[] args) {
        int[] num = {1,1,2};
        System.out.println(permuteUnique(num));
    }

    private static ArrayList<ArrayList<Integer>> permuteUnique(int[] num){
        ArrayList<ArrayList<Integer>> list = new ArrayList<>();
        if(num == null){
            return list;
        }
        boolean[] vis = new boolean[num.length];
        Arrays.sort(num);
        backTrack(num, 0, vis, new LinkedList<>(),list);
        return list;
    }

    private static void backTrack(int[] num, int index, boolean[] vis, LinkedList<Integer> sub,ArrayList<ArrayList<Integer>> list){
        if(index == num.length){
            list.add(new ArrayList<>(sub));
            return;
        }

        // 按先后顺序遍历
        for(int i = 0;i<num.length;i++){
            // 如果i位置已经访问过直接跳过
            if(vis[i]){
                continue;
            }
            // 如果当前位置于前一个位置内容相等，且前一个位置已经访问过来，跳过当前位置,去重
            if(i>0 && num[i-1]==num[i] && vis[i - 1]){
                continue;
            }

            sub.add(num[i]);
            // 标记当前位置访问过
            vis[i] = true;
            backTrack(num,index+1,vis,sub,list);
            // 还原当前位置访问过，回朔后标记未访问过
            vis[i] = false;
            sub.removeLast();
        }
    }
}
