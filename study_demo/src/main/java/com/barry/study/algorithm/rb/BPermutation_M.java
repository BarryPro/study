package com.barry.study.algorithm.rb;

import java.util.*;

/**
 * 字符串的排列
 * 输入一个长度为 n 字符串，打印出该字符串中字符的所有排列，你可以以任意顺序返回这个字符串数组。
 * 例如输入字符串ABC,则输出由字符A,B,C所能排列出来的所有字符串ABC,ACB,BAC,BCA,CBA和CAB。
 *
 * 数据范围：n<10n < 10n<10
 * 要求：空间复杂度 O(n!)O(n!)O(n!)，时间复杂度 O(n!)O(n!)O(n!)
 */
public class BPermutation_M {
    public static void main(String[] args) {
        String str = "aba";
        System.out.println(permutation(str));
    }

    private static ArrayList<String> permutation(String str){
        ArrayList<String> list = new ArrayList<>();
        if(str == null){
            return list;
        }

        boolean[] vis = new boolean[str.length()];
        char[] chars = str.toCharArray();
        Arrays.sort(chars);
        backTrack(new String(chars),0,vis,new StringBuilder(),list);
        // backTrack(str,0,vis,new StringBuilder(),list);
        // 去重
        // Set<String> set = new HashSet<>(list);
        return list;
        // return new ArrayList<>(set);
    }

    private static void backTrack(String str,int index,boolean[] vis,StringBuilder sub,ArrayList<String> list){
        if(index == str.length()){
            list.add(sub.toString());
            return;
        }

        for(int i = 0;i<str.length();i++){
            if(vis[i]){
                continue;
            }
            // 基于有序的数组才可以判断去重
            if(i>0 && str.charAt(i) == str.charAt(i-1) && vis[i-1]){
                continue;
            }

            sub.append(str.charAt(i));
            vis[i] = true;
            backTrack(str,index+1,vis,sub,list);
            vis[i] = false;
            // 删除最后一个字符
            sub.deleteCharAt(sub.length() - 1);
        }
    }
}
