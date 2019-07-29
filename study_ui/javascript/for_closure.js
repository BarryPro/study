// 1.闭包演示，展示与预期的不一致
for (var i = 1; i <= 5; i++) {
    setTimeout(function timer() {
        console.log(i); // 每秒一次输出6
    }, i * 1000);
}

// 1-解释，相当于如下代码，循环5次执行
{
    var i = 1;
    if (i<=5) {
        //  延迟1秒钟执行，异步，当一秒中过后主线程已经执行完5次了，所以i已经变成了6了，因此在timer中打印的是6
        // timer();
    }
    i++;
}

//  2.还是不符合预期
for (var i = 1; i <= 5; i++) {
    //  定义一个函数
    (function() {
        setTimeout(function timer() {
            console.log(i); // 6
        }, i * 1000);
        // 调用函数
    })();
}

//  3.正常的情况展示闭包
for (var i = 1; i <= 5; i++) {
    //  把词法作用域的i传递给j产生了闭包，可以产生符合预期输出
    (function(j) {
        setTimeout(function timer() {
            console.log(j); // 1,2,3,4,5
        }, j * 1000);
    })(i);
}

//  通过使用let关键字劫持作用域快，每次循环都会重新声明let变量，然后把计算后的值付给let变量
for (let i = 1; i <= 5; i++) {
    setTimeout(function timer() {
        console.log(i);
    }, i * 1000);
}