package com.barry.study.pattern.single;

/**
 * volatile synchronized 保证单例
 * Created by belong on 2016/12/11.
 */
public class SinglePattern4 {
    private volatile static SinglePattern4 instance;
    // 私有构造器，只允许类静态方法去实例化对象
    private SinglePattern4() {

    }

    public static SinglePattern4 getInstance() {
        if(instance == null){
            synchronized (SinglePattern4.class) {
                instance = new SinglePattern4();
            }
        }
        return instance;
    }
}
