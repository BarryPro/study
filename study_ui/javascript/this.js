var obj_1 = {
    count:0,
    cool:function coolFn(){
        if (this.count < 1) {
            setTimeout(function timer() {
                // this是安全的，因为bind()
                this.count++;
                console.log("obj_1 more awesome");
            }.bind(this), 100);
        }
    }
};

obj_1.cool();

var obj_2 = {
    count:0,
    cool:function coolFn(){
        if (this.count < 1) {
            // => 符号相当于使用了bind()
            setTimeout(() => {
                this.count++;
                console.log("obj_2 more awesome");
            }, 100);
        }
    }
};

obj_2.cool();

