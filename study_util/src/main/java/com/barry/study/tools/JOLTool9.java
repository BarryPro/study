package com.barry.study.tools;

import org.openjdk.jol.info.ClassLayout;
import org.openjdk.jol.info.GraphLayout;
import org.openjdk.jol.vm.VM;

import java.nio.ByteOrder;

public class JOLTool9 {
    public static void main(String[] args) {
        Object o = new Object();
        System.out.println(parseInstance(o));
        System.out.println(GraphLayout.parseInstance(o).toPrintable());
        System.out.println(o.hashCode());
        System.out.println(ClassLayout.parseInstance(o));
        System.out.println(VM.current().details());
        System.out.println(ByteOrder.nativeOrder());
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
