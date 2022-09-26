package com.barry.study.pattern.single;

/**
 * double check volatile synchronized 保证单例
 */
public class SinglePattern5 {
    private volatile static SinglePattern5 instance;
    // 私有构造器，只允许类静态方法去实例化对象
    private SinglePattern5() {

    }

    public static SinglePattern5 getInstance() {
        if(instance == null){
            synchronized (SinglePattern5.class) {
                if(instance == null){
                    instance = new SinglePattern5();
                }
            }
        }
        return instance;
    }
}
