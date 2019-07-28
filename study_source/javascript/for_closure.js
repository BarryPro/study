// 闭包演示，展示与预期的不一致
for (var i = 1; i <= 5; i++) {
    setTimeout(function timer() {
        console.log(i); // 每秒一次输出6
    }, i * 1000);
}

//  还是不符合预期
for (var i = 1; i <= 5; i++) {
    //  定义一个函数
    (function () {
        setTimeout(function timer() {
            console.log(i);// 6
        }, i * 1000);
        // 调用函数
    })();
}

//  正常的情况展示闭包
for (var i = 1; i <= 5; i++) {
    //  把词法作用域的i传递给j产生了闭包，可以产生符合预期输出
    (function (j) {
        setTimeout(function timer() {
            console.log(j); // 1,2,3,4,5
        }, j * 1000);
    })(i);
}