package com.barry.study.nowcoder.simple;

public class FibonacciDemo {
    public static void main(String[] args) {
        System.out.println(fibonacci(2));
    }

    public static int fibonacci(int n) {
        if(n <= 2){
            return 1;
        }

        return fibonacci(n-1)+fibonacci(n-2);
    }
}
