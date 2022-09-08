package com.barry.study.nowcoder.middle;

import java.util.ArrayList;
import java.util.List;

/**
 * 输入：“23”
 * 输出：[“ad”, “ae”, “af”, “bd”, “be”, “bf”, “cd”, “ce”, “cf”].
 */
public class LetterCombinationsMaxLengthDemo {
    // 手机按键初始化,键盘数字映射
    private final static String[] digitsMap = {"", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};

    public static void main(String[] args) {
        String digits = "23";
        System.out.println(letterCombinations(digits));
    }

    /**
     * 输入的数字返回可能的字母组合
     * @param digits 例如 23
     * @return [“ad”, “ae”, “af”, “bd”, “be”, “bf”, “cd”, “ce”, “cf”].
     */
    private static List<String> letterCombinations(String digits) {
        // 返回结果
        List<String> result = new ArrayList<>();
        if(digits == null || digits.length() == 0){
            return result;
        }

        // 字符组合拼接串
        StringBuilder sb = new StringBuilder();

        // 递归处理字符串拼接
        backtracking(sb,digits,0,result);
        // 返回结果
        return result;
    }

    /**
     * 递归回溯
     * @param sb 字符串组合串
     * @param digits 输入的数字组合
     * @param index 当前递归的索引
     * @param result 字母组合结果
     */
    private static void backtracking(StringBuilder sb, String digits,int index,List<String> result) {
        // 如果递归深度等于输入数字字符串的长度，说明字符串拼接成功，记录拼接结果
        // 按几个数字，组合的长度就是几个，index就是组合的次数，如果按两个按键，就是2个字母进行组合
        if(digits.length() == index){
            result.add(sb.toString());
            return;
        }
        // 获取第一个数字对应的字母表,数字对应数组的下标就是键盘的映射内容,减去0字符的ASCII就是下标索引
        String letter = digitsMap[digits.charAt(index)-'0'];
        // 遍历字母表
        for(int i = 0;i<letter.length();i++){
            // 获取当前位置的字符进行结果拼接 ,例如当前是a
            sb.append(letter.charAt(i));
            // index+1:表示当前字符和下一个数字对应的字母进行组合，例如 a和3对应的def分别进行组合
            backtracking(sb,digits,index+1,result);
            // System.out.println(sb.toString());
            // 移出当个首字母的情况，例如a，，，回溯
            sb.deleteCharAt(sb.length() - 1);
        }
    }
}