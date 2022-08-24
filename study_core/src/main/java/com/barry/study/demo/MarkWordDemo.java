package com.barry.study.demo;

import com.barry.study.tools.JOLTool16;
import com.barry.study.tools.JOLTool9;

/**
 * mark word 学习
 */
public class MarkWordDemo {
    public static void main(String[] args) {
        Object o = new Object();
        System.out.println("hello world");
        System.out.println(JOLTool9.parseInstance(o));
        System.out.println(JOLTool16.parseInstance(o));
    }
}