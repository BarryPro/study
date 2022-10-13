package com.barry.study.basic;

import org.junit.Test;

public class TypeBoxTest {

    @Test
    public void test_hello(){
        System.out.println("hello");
    }

    @Test
    public void test_int_great_127(){
        int a = 1000;
        int b = 1000;
        assert a == b;
    }

    @Test
    public void test_int_new_box_great_127(){
        int a = 1000;
        int b = new Integer(1000);
        assert a == b;
    }

    @Test
    public void test_int_less_127(){
        int a = 100;
        int b = 100;
        assert a == b;
    }

    @Test
    public void test_int_box_great_127(){
        int a = 1000;
        Integer b = 1000;
        assert a == b;
    }

    @Test
    public void test_int_box_less_127(){
        int a = 100;
        Integer b = 100;
        assert a == b;
    }

    @Test
    public void test_int_box_new_less_127(){
        int a = 100;
        Integer b = new Integer(100);
        assert a == b;
    }

    @Test
    public void test_int_box_new_great_127(){
        int a = 1000;
        Integer b = new Integer(1000);
        assert a == b;
    }

    @Test
    public void test_int_ref_box_new_great_127(){
        Integer a = 1000;
        Integer b = new Integer(1000);
        assert a != b;
    }

    @Test
    public void test_int_ref_box_new_less_127(){
        Integer a = 100;
        Integer b = new Integer(100);
        assert a != b;
    }

    @Test
    public void test_int_double_ref_box_new_less_127(){
        Integer a = new Integer(100);
        Integer b = new Integer(100);
        assert a != b;
    }

    @Test
    public void test_int_double_ref_box_new_great_127(){
        Integer a = new Integer(1000);
        Integer b = new Integer(1000);
        assert a != b;
    }

    @Test
    public void test_int_double_ref_new_great_127(){
        Integer a = 1000;
        Integer b = 1000;
        assert a != b;
    }

    @Test
    public void test_int_double_ref_new_less_127(){
        Integer a = 100;
        Integer b = 100;
        assert a == b;
    }

    @Test
    public void test_string_constant(){
        String a = "abc";
        String b = new String("abc");
        assert a != b;
    }

    @Test
    public void test_string_constant_equals(){
        String a = "abc";
        String b = new String("abc");
        assert a.equals(b);
    }
}
