package com.barry.study.nowcoder.simple;

/**
 * 反转字符串
 * 写出一个程序，接受一个字符串，然后输出该字符串反转后的字符串。（字符串长度不超过1000）
 */
public class SolveDemo {
    public static void main(String[] args) {
        String str = "";
        System.out.println(solve(str));
    }

    private static String solve(String str){
        if(null == str){
            return null;
        }

        StringBuilder sb = new StringBuilder();
        for(int i = str.length() - 1; i>=0; i--){
            sb.append(str.charAt(i));
        }
        return sb.toString();
    }
}
