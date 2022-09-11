package com.barry.study.nowcoder.hard;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

/**
 * 最长的括号子串
 *  给出一个长度为 n 的，仅包含字符 '(' 和 ')' 的字符串，计算最长的格式正确的括号子串的长度。
 *
 * 例1: 对于字符串 "(()" 来说，最长的格式正确的子串是 "()" ，长度为 2 .
 * 例2：对于字符串 ")()())" , 来说, 最长的格式正确的子串是 "()()" ，长度为 4 .
 */
public class LongestValidParentHessDemo {
    public static void main(String[] args) {
        String s = "(())()()()";
        System.out.println(longestValidParentHess(s));
    }

    private static int longestValidParentHess(String s){
        if(s == null){
            return 0;
        }

        Stack<Character> stack = new Stack<>();
        StringBuilder sb = new StringBuilder();
        List<String> list = new ArrayList<>();
        for(int i = 0;i<s.length();i++){
            if('(' == s.charAt(i)){
                stack.push(s.charAt(i));
                continue;
            }
            if(')' == s.charAt(i) && !stack.isEmpty()){
                if('(' == stack.pop()){
                    sb.append('(').append(s.charAt(i));
                }
            }
            if(stack.isEmpty()){
                list.add(sb.toString());
                sb = new StringBuilder();
            }
        }
        System.out.println(list);
        return 0;
    }
}
