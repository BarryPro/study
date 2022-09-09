package com.barry.study.nowcoder.simple;

public class PalindromeDemo {
    public static void main(String[] args) {
        String str = "a";
        System.out.println(isPalindrome(str));
    }

    private static boolean isPalindrome(String str){
        if(null == str){
            return false;
        }
        if(str.length() < 2){
            return true;
        }

        int left = 0;
        int right = str.length() - 1;
        while (left <= right) {
            if(str.charAt(left) != str.charAt(right)){
                return false;
            }
            left++;
            right--;
        }

        return true;
    }
}
