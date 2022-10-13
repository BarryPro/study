package com.barry.study.basic;

public class ReflectTest {
    public static void main(String[] args) throws ClassNotFoundException {
        Class<ReflectTest> reflectTestClass = ReflectTest.class;

        Class<? extends ReflectTest> aClass = new ReflectTest().getClass();

        Class<?> aClass1 = Class.forName("com.barry.study.basic.ReflectTest");
    }
}
