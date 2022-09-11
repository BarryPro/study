package com.barry.study.algorithm.rb;

import java.util.ArrayList;

/**
 *  括号生成
 * 给出n对括号，请编写一个函数来生成所有的由n对括号组成的合法组合。
 * 例如，给出n=3，解集为：
 * "((()))", "(()())", "(())()", "()()()", "()(())"
 */
public class RGenerateParenthesis_M {
    public static void main(String[] args) {
        System.out.println(generateParenthesis(3));
    }

    private static ArrayList<String> generateParenthesis(int n) {
        ArrayList<String> list = new ArrayList<>();
        if (n <= 0) {
            return list;
        }

        recursion(0, 0, n, "", list);
        return list;
    }

    /**
     * 递归生产括号
     *
     * @param l    左括号数量
     * @param r    右括号数量
     * @param n    预定括号数量
     * @param tmp  临时拼接字符串使用
     * @param list 拼接结果集
     */
    private static void recursion(int l, int r, int n, String tmp, ArrayList<String> list) {
        // 结束条件，左右括号都到达n时括号就生成玩了
        if (l == n && r == n) {
            // 返回结果
            list.add(tmp);
            return;
        }
        // 先拼接左括号
        if (l < n) {
            // 左括号加一个，tmp拼接左括号
            recursion(l + 1, r, n, tmp + "(", list);
        }
        // 如果左边括号比右边的多，填补右边的括号
        if (r < n && l > r) {
            recursion(l, r + 1, n, tmp + ")", list);
        }
    }
}
