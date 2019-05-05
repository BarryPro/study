<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>接口测试</title>

<#include "../common/headcsslinks.ftl">

</head>


<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- side bar -->
    <#import "../common/sidebar.ftl" as s>
    <@s.sidebar active="" />

        <!-- top navigation -->
    <#include "../common/navbar.ftl">
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>接口测试</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-9 col-sm-12 col-xs-12 select-tab">
                        <div class="form-group select-service">
                            <label class="control-label col-md-9 col-sm-9 col-xs-12">Service:</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <select class="select2_single form-control select2-hidden-accessible" id="select-service" tabindex="-1" aria-hidden="true">
                                    <option></option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group select-method">
                            <label class="control-label col-md-9 col-sm-9 col-xs-12">Method:</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <select class="select2_single form-control select2-hidden-accessible select-method" id="select-method" tabindex="-1" aria-hidden="true">
                                    <option></option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-9 col-sm-9 col-xs-12 text-param">
                        </div>
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                            <button class="btn-search btn btn-primary">查询</button>
                        </div>
                    </div>

                </div>
                <pre id="result">
                </pre>
            </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
    <#include "../common/footer.ftl">
        <!-- /footer content -->
    </div>
</div>

<#include "../common/allscripts.ftl">

<style type="text/css">
    .select-tab{
        margin-top: 51px;
    }
    .select-method{
        margin-top: 100px;
    }
    .text-param{
        margin-top: 50px;
    }
    .param-json{
        width: 495px;
        height: 200px;
    }
    .btn-search{
        margin-left: -15px;
        margin-top: 33px;
    }
</style>
<script type="text/javascript">
    $(function(){
        var paramNums = 0;
        $.ajax({
            url: "/tools/thrift/test/services",
            type: "json",
            method: "get",
            success: function (data) {
                var json = JSON.parse(data);
                var services = json.services;
                var len = services.length;
                for (var i = 0; i < len;i++) {
                    var service = services[i];
                    var x = document.getElementById("select-service");
                    var option = document.createElement("option");
                    option.text = service;
                    x.add(option);
                }
            }
        })
        $(" #select-service").on("change",function(event){
            event.preventDefault();
            removeOptions(document.getElementById("select-method"));
//            $("#select_method").empty();
            $.ajax({
                url:"/tools/thrift/test/methods",
                data: {"service": $("#select-service").val()},
                type:"json",
                method:"post",
                success:function(data){
                    var json = JSON.parse(data);
                    if(json.error){
                        var result = "";
                        try {
                            result = new JSONFormat(JSON.stringify(JSON.parse(json.error)),4).toString()
                        }catch(e){
                            result = json.error;
                        }
                        $('#result').html(result);
                        return;
                    }
                    var methods = json.methods;
                    var len = methods.length;
                    var x = document.getElementById("select-method");
                    for (var i = 0; i < len;i++) {
                        var method = methods[i];
                        var option = document.createElement("option");
                        option.text = method;
                        x.add(option);
                    }


                }
            })

        })
        $(" #select-method").on("change",function(event){
            event.preventDefault();
            $(" .text-param").html("");
            $.ajax({
                url: "/tools/thrift/test/params",
                data: {"service": $("#select-service").val(), "method": $("#select-method").val()},
                type: "json",
                method: "post",
                success: function (data) {
                    var json = JSON.parse(data);
                    if (json.error) {
                        var result = "";
                        try {
                            result = new JSONFormat(JSON.stringify(JSON.parse(json.error)),4).toString()
                        }catch(e){
                            result = json.error;
                        }
                        $('#result').html(result);
                        return;
                    }
                    var params = json.params;
                    var len = params.length;
                    var strTemp="";
                    for (var i = 0; i < len; i++) {
                        strTemp += "<label class=\"control-label col-md-9 col-sm-9 col-xs-12\">param"+i+": "+params[i]+"</label>";
                        strTemp += "<textarea data-parsley-validate class=\"form-control param-json"+i+"\""+"rows=\"3\" placeholder=\"json对象或数组\"></textarea>";
                    }
                    $(" .text-param").html(strTemp);
                    paramNums = len;
                }
            });

        })
        $(" .btn-search").on("click",function(event){
            event.preventDefault();
            $(this).addClass("disabled").html("查询中...");
            var param = []
            if(paramNums>0) {
                for(var i=0;i<paramNums;i++) {
                    var c = " .param-json"+i;
                    param.push($(c).val());
                }
            }
            $.ajax({
                url:"/tools/thrift/test/search",
                data: {"service": $("#select-service").val(),"method": $("#select-method").val(),"param":JSON.stringify(param)},
                type:"json",
                method:"post",
                success:function(data){
                    $(" .btn-search").html("查询").removeClass("disabled");
                    var json = JSON.parse(data);
                    if(json.error){
                        var result = "";
                        try {
                            result = new JSONFormat(JSON.stringify(JSON.parse(json.error)),4).toString()
                        }catch(e){
                            result = json.error;
                        }
                        $('#result').html(result);
                        return;
                    }
                    var result = "";
                    try{
                        result = new JSONFormat(JSON.stringify(JSON.parse(json.result)),4).toString();
                    }catch(e){
                        alert("前端解析返回结果为json异常，展示原始返回结果");
                        result = json.result;
                    }
                    $('#result').html(result);
                }
            })
        })
    });
    function removeOptions(selectbox)
    {
        var i;
        for(i = selectbox.options.length ; i > 0 ; i--)
        {
            selectbox.remove(i);
        }
    }
    //json格式化方法   参数1：json对象，参数2：缩进字符数
    var JSONFormat = (function(){
        var _toString = Object.prototype.toString;

        function format(object, indent_count){
            var html_fragment = '';
            switch(_typeof(object)){
                case 'Null' :0
                    html_fragment = _format_null(object);
                    break;
                case 'Boolean' :
                    html_fragment = _format_boolean(object);
                    break;
                case 'Number' :
                    html_fragment = _format_number(object);
                    break;
                case 'String' :
                    html_fragment = _format_string(object);
                    break;
                case 'Array' :
                    html_fragment = _format_array(object, indent_count);
                    break;
                case 'Object' :
                    html_fragment = _format_object(object, indent_count);
                    break;
            }
            return html_fragment;
        };

        function _format_null(object){
            return '<span class="json_null">null</span>';
        }

        function _format_boolean(object){
            return '<span class="json_boolean">' + object + '</span>';
        }

        function _format_number(object){
            return '<span class="json_number">' + object + '</span>';
        }

        function _format_string(object){
            object = object.replace(/\</g,"<");
            object = object.replace(/\>/g,">");
            if(0 <= object.search(/^http/)){
                object = '<a href="' + object + '" target="_blank" class="json_link">' + object + '</a>'
            }
            return '<span class="json_string">"' + object + '"</span>';
        }

        function _format_array(object, indent_count){
            var tmp_array = [];
            for(var i = 0, size = object.length; i < size; ++i){
                tmp_array.push(indent_tab(indent_count) + format(object[i], indent_count + 1));
            }
            return '<span data-type="array" data-size="' + tmp_array.length + '"><i  style="cursor:pointer;" class="fa fa-minus-square-o" onclick="hide(this)"></i>[<br/>'
                    + tmp_array.join(',<br/>')
                    + '<br/>' + indent_tab(indent_count - 1) + ']</span>';
        }

        function _format_object(object, indent_count){
            var tmp_array = [];
            for(var key in object){
                tmp_array.push( indent_tab(indent_count) + '<span class="json_key">"' + key + '"</span>:' +  format(object[key], indent_count + 1));
            }
            return '<span  data-type="object"><i  style="cursor:pointer;" class="fa fa-minus-square-o" onclick="hide(this)"></i>{<br/>'
                    + tmp_array.join(',<br/>')
                    + '<br/>' + indent_tab(indent_count - 1) + '}</span>';
        }

        function indent_tab(indent_count){
            return (new Array(indent_count + 1)).join('    ');
        }

        function _typeof(object){
            var tf = typeof object,
                    ts = _toString.call(object);
            return null === object ? 'Null' :
                    'undefined' == tf ? 'Undefined'   :
                            'boolean' == tf ? 'Boolean'   :
                                    'number' == tf ? 'Number'   :
                                            'string' == tf ? 'String'   :
                                                    '[object Function]' == ts ? 'Function' :
                                                            '[object Array]' == ts ? 'Array' :
                                                                    '[object Date]' == ts ? 'Date' : 'Object';
        };

        function loadCssString(){
            var style = document.createElement('style');
            style.type = 'text/css';
            var code = Array.prototype.slice.apply(arguments).join('');
            try{
                style.appendChild(document.createTextNode(code));
            }catch(ex){
                style.styleSheet.cssText = code;
            }
            document.getElementsByTagName('head')[0].appendChild(style);
        }

        loadCssString(
                '.json_key{ color: #92278f;font-weight:bold;}',
                '.json_null{color: #f1592a;font-weight:bold;}',
                '.json_string{ color: #3ab54a;font-weight:bold;}',
                '.json_number{ color: #25aae2;font-weight:bold;}',
                '.json_link{ color: #717171;font-weight:bold;}',
                '.json_array_brackets{}');

        var _JSONFormat = function(origin_data){
            this.data = JSON.parse(origin_data);
        };

        _JSONFormat.prototype = {
            constructor : JSONFormat,
            toString : function(){
                return format(this.data, 1);
            }
        }

        return _JSONFormat;
    })();
</script>
</body>

</html>