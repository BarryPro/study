package com.barry.study_demo;

import java.util.ArrayList;
import java.util.List;

/**
 * @author yuchenglong03
 * @since 2019-04-18 15:13
 */
public class DemoTest {
    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.add("false");
        setVar(list);
        System.out.println(list);
    }

    private static void setVar(List<String> list){
        list.add("true");
    }
}
