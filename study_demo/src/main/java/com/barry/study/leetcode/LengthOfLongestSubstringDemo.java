package com.barry.study.leetcode;

import java.util.HashSet;
import java.util.Set;

public class LengthOfLongestSubstringDemo {
    public static void main(String[] args) {
        String s = "abcabcww";
        // System.out.println(lengthOfLongestSubstring(s));
        System.out.println(lengthOfLongestSubstring4FlowWindow(s));
        // System.out.println(lengthOfLongestSubstring4opt(s));
    }

    /**
     * 滑动窗口解法
     * 根据ASCII范围处理
     */
    public static int lengthOfLongestSubstring4opt(String s) {
        // 记录字符上一次出现的位置
        // 初始化ASCII数组
        int[] last = new int[128];
        for(int i = 0; i < 128; i++) {
            // 默认初始化数字元素值为-1,因为默认0在ASCII里也是有含义的
            last[i] = -1;
        }
        // 获取字符串长度
        int n = s.length();
        // 最长子串长度
        int longestSubLength = 0;
        // 窗口开始位置
        int start = 0;
        for(int i = 0; i < n; i++) {
            // 当前索引位置i的字符是index
            int index = s.charAt(i);
            // 获取当前字符最近出现的位置，赋值为上一次出现的位置+1当前位置，与start比较，更新start为最新出现的位置
            start = Math.max(start, last[index] + 1);

            // 用当前位置i减去当前字符最近出现重复字符的位置+1，就是当前子串的长度
            longestSubLength = Math.max(longestSubLength, i - start + 1);

            // 记录ASCII表数字当前字符最近出现的位置为i，重置之前出现的位置
            last[index] = i;
        }

        return longestSubLength;
    }

    /**
     * 滑动窗口解法
     */
    public static int lengthOfLongestSubstring4FlowWindow(String s) {
        // 处理特殊case
        if(s == null){
            return 0;
        }
        if(s.length() == 1){
            return 1;
        }
        // 用于检查子串窗口是否有重复的字符，
        Set<Character> windowSet = new HashSet<>();
        // 左右下标，用于控制滑动窗口移动left和right组成了窗口的左右两边
        // 控制处理子串中存在重复字符时右移动
        int left = 0;
        // 控制遍历字符串字符移动
        int right = 0;
        // 用于记录最长子串
        int longestSubLength = 0;
        // 遍历子串，因为数组下标是减一的，所以不用写等于号，判断结束循环
        while (right < s.length()) {
            // 如果子串字符集合中不存在重复的，right右移动，否则left右移动
            // 每次遍历获取right位置字符，判断是否在subSet中出现过，如果出现过，通过移动left使窗口向右移动
            if(!windowSet.contains(s.charAt(right))){
                // 记录子串字符
                windowSet.add(s.charAt(right));
                // 移动到下一个位置
                right++;
            } else {
                // left向右移动，删除left经过的字符，直到删除当前重复的字符为止
                windowSet.remove(s.charAt(left));
                left++;
            }
            // 每次计算后统计当前最长的子串，遍历结束longestSubLength就是最长子串
            longestSubLength = Math.max(longestSubLength, windowSet.size());
            // 打印窗口
            // System.out.println(windowSet);
        }
        // 返回最长子串
        return longestSubLength;
    }

    /**
     * 第一版易于理解的解法，但是超长字符串无法算出结果，性能极低O(n3)
     */
    public static int lengthOfLongestSubstring(String s) {
        // 异常检查
        if (s == null) {
            return 0;
        }
        if (s.length() == 1) {
            return 1;
        }
        // 拆分字符串为子串
        char[] chars = s.toCharArray();
        System.out.println("length:" + chars.length);
        int longest_length = 0;
        Set<String> subSet = new HashSet<>();
        for (int i = 0; i < chars.length - 1; i++) {
            // 从第二个开始
            StringBuilder sub = new StringBuilder();
            sub.append(chars[i]);
            if (i == 0) {
                subSet.add(sub.toString());
                longest_length = sub.toString().length();
            }

            for (int j = i + 1; j < chars.length; j++) {
                sub.append(chars[j]);
                // 检查子串长度
                if (sub.length() > s.length()) {
                    continue;
                }
                // 只有在字符串中存在的才是子串
                if (s.contains(sub)) {
                    // 子串中不能有重复字符
                    char[] tmp = sub.toString().toCharArray();
                    Set<Character> characters = new HashSet<>();
                    for (char c : tmp) {
                        if (characters.contains(c)) {
                            break;
                        }
                        characters.add(c);
                    }
                    if (characters.size() != sub.length()) {
                        continue;
                    }
                    if (longest_length < sub.toString().length()) {
                        longest_length = sub.toString().length();
                    }
                    subSet.add(sub.toString());
                }
            }
        }
        // 打印检查，是否符合预期
        System.out.println(subSet.size());
        return longest_length;
    }
}
