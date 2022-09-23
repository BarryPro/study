package com.barry.study.thread;

/**
 * 死锁案例
 */
public class DeadLockDemo {
    public static final String A = "shareA";
    public static final String B = "shareB";

    public static void main(String[] args) throws InterruptedException {
        deadLock();
    }

    private static void deadLock(){
        new Thread(new Runnable() {
            @Override
            public void run() {
                synchronized (A){
                    try {
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    synchronized (B) {
                        System.out.println("B");
                    }
                }
            }
        }).start();

        new Thread(new Runnable() {
            @Override
            public void run() {
                synchronized (B){
                    synchronized (A) {
                        System.out.println("A");
                    }
                }
            }
        }).start();
    }

}

