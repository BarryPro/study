function foo() {
    var a = 2;

    function getA() {
        console.log(a);
    }

    return  getA;
}

var baz = foo();
baz();