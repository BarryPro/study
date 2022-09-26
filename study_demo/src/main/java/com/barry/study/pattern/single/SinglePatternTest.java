package com.barry.study.pattern.single;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.*;

public class SinglePatternTest {
    public static void main(String[] args) throws Exception {
        ExecutorService threadPool = Executors.newCachedThreadPool();
        List<Future<Object>> listFuture = new ArrayList<>();
        Set<Integer> set = new HashSet<>();
        for(int i = 0;i<10000;i++){
            Future<Object> submit = threadPool.submit(new Callable<Object>() {
                @Override
                public Object call() throws Exception {
                    return SinglePattern5.getInstance();
                }
            });
            listFuture.add(submit);
        }
        for (Future<Object> objectFuture : listFuture) {
            set.add(objectFuture.get(100,TimeUnit.MILLISECONDS).hashCode());
        }

        System.out.println(set);
        System.exit(0);
    }
}
