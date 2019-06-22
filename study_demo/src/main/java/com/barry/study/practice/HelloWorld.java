package com.barry.study.practice;

import org.junit.Test;

import java.math.BigDecimal;

/**
 * @author yuchenglong03
 * @since 2019-04-25 21:58
 */
public class HelloWorld {
    public static void main(String[] args) {
        String phone = "12345678934567";
        System.out.println(phone.replaceAll("(\\d{3})\\d{6}(\\d{2})","$1******$2"));
    }

    @Test
    public void test_BigDecimal(){
        String tmp = "3.1234";
        System.out.println(new BigDecimal(tmp).setScale(3,BigDecimal.ROUND_HALF_UP));
    }

    @Test
    public void test_contain(){
        String config = "|yuchenglong03|liuhao42|lijiaye|";
        System.out.println(config.contains("xuyoumei"));
    }

}
