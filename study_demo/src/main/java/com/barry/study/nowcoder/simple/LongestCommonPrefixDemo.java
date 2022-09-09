package com.barry.study.nowcoder.simple;

/**
 * 最长公共前缀
 * <p>
 * 给你一个大小为 n 的字符串数组 strs ，其中包含n个字符串,
 * 编写一个函数来查找字符串数组中的最长公共前缀，返回这个公共前缀。
 */
public class LongestCommonPrefixDemo {
    public static void main(String[] args) {
        String[] strs = {"abca", "abc", "abca", "abc", "abcc"};
        System.out.println(longestCommonPrefix(strs));
    }

    /**
     * 返回最长公共子串
     *
     * @param strs 子串数组
     * @return 最长前缀
     */
    private static String longestCommonPrefix(String[] strs) {
        if (null == strs) {
            return "";
        }
        int n = strs.length;
        if (n == 0) {
            return "";
        }

        // 遍历第一个字符串的所有字符，因为是公共串，所以第一个字符串中一定有，如果第一个都没有说明没有公共子串
        for (int i = 0; i < strs[0].length(); i++) {
            //　遍历后续字符串
            for (int j = 1; j < n; j++) {
                // 如果后续的字符串和第一个字符串的子串相等，返回子串，或者后续子串有和第一个字串的字符不等时，返回
                if (i == strs[j].length() || strs[j].charAt(i) != strs[0].charAt(i)) {
                    // 不同则返回子串
                    return strs[0].substring(0, i);
                }
            }
        }
        // 如果没有提前返回，就说明第一个字符串是最长的公共子串
        return strs[0];
    }
}
