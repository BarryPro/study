package com.barry.study.leetcode;

public class IsPrefixOfWordDemo {
    public static void main(String[] args) {
        String sentence = "i am tired";
        String searchWord = "you";
        System.out.println(isPrefixOfWord(sentence,searchWord));
    }

    public static int isPrefixOfWord(String sentence, String searchWord) {
        if(sentence == null || searchWord == null){
            return -1;
        }
        String[] wordArray = sentence.split(" ");

        for (int i = 0;i<wordArray.length;i++) {
            if(wordArray[i].startsWith(searchWord)){
                // 返回下标位置
                return i + 1;
            }
        }
        return -1;
    }
}
