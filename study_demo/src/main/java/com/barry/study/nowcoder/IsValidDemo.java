package com.barry.study.nowcoder;

import java.util.Stack;

public class IsValidDemo {
    public static void main(String[] args) {
        String s = ")()[]{}";
        System.out.println(isValid(s));
    }

    /**
     *
     * @param s string字符串
     * @return bool布尔型
     */
    public static boolean isValid (String s) {
        if(s == null){
            return false;
        }
        Stack<Character> stack = new Stack<>();
        for (char c : s.toCharArray()) {
            if('(' == c){
                stack.push(')');
            } else if ('{' == c){
                stack.push('}');
            } else if ('[' == c) {
                stack.push(']');
            // 如果有字符但是没有入栈，说明是反括号违法，返回false；弹栈比较，不相等返回false
            } else if(stack.isEmpty() || stack.pop() != c ){
                return false;
            }
        }
        // 如果栈为空说明都匹配上了
        return stack.isEmpty();
    }
}
