package com.barry.study.nowcoder.simple;

public class TransDemo {
    public static void main(String[] args) {
        String s = "Hello World";
        System.out.println(trans(s, s.length()));
    }

    private static String trans(String s, int n) {
        StringBuilder sb = new StringBuilder();
        int index = 0;
        // 倒序遍历字符串实现反转
        for(int i = n -1 ;i>=0;i--){
            char ch = s.charAt(i);
            if(' ' == ch){
                sb.append(" ");
                index = sb.length();
            } else {
                if(ch >= 'A' && ch <= 'Z'){
                    // 字母倒序插入，每次都是从头插入，这样就把倒序的字符给正序插入了
                    sb.insert(index,(char)(ch+32));
                } else {
                    sb.insert(index, (char) (ch - 32));
                }
            }
        }
        return sb.toString();
    }
}
