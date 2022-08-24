package com.barry.study.tools;

import org.openjdk.jol.info.ClassLayout;

public class JOLTool16 {
    public static void main(String[] args) {
        Object o = new Object();
        System.out.println(parseInstance(o));
    }
    /**
     * 打印对象t头信息
     * @param t 对象
     * @param <T> 泛型
     * @return 对象头信息打印
     */
    public static <T> String parseInstance(T t){
        return ClassLayout.parseInstance(t).toPrintable();
    }
}
