<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>C端执行链路跟踪查询</title>

	<#include "../common/headcsslinks.ftl">

    <style>
        /*Now the CSS*/
        * {margin: 0; padding: 0;}

        .tree-scrolls {
            width: 8000px;
        }

        .tree ul {
            padding-top: 20px; position: relative;

            transition: all 0.5s;
            -webkit-transition: all 0.5s;
            -moz-transition: all 0.5s;
        }

        .tree li {
            float: left; text-align: center;
            list-style-type: none;
            position: relative;
            padding: 20px 5px 0 5px;

            transition: all 0.5s;
            -webkit-transition: all 0.5s;
            -moz-transition: all 0.5s;
        }

        /*We will use ::before and ::after to draw the connectors*/
        .tree li::before{
            content: '';
            position: absolute; top: 0; right: 50%;
            border-top: 1px solid #ccc;
            width: 50%; height: 20px;
        }
        .tree li::after{
            content: '';
            position: absolute; top: 0;
            border-top: 1px solid #ccc;
            width: 50%; height: 20px;
            right: auto; left: 50%;
            border-left: 1px solid #ccc;
        }

        /* ======top level /node    ======== */
        .tree li[value*="node"]::before{
            content: '';
            position: absolute; top: 30px; right: 50%;
            width: 50%; height: 0px;
            border-top: 2px solid #ccc;
        }
        .tree li[value*="node"]::after{
            content: '';
            position: absolute; top: 30px;
            border-top: 2px solid #ccc;
            width: 50%; height: 0px;
            right: auto; left: 50%;
            border-left: 1px solid #ccc;
        }

        /*We need to remove left-right connectors from elements without
        any siblings*/
        .tree li:only-child::after, .tree li:only-child::before {
            display: none;
        }

        /*Remove space from the top of single children*/
        .tree li:only-child{ padding-top: 0;}

        /*Remove left connector from first child and
        right connector from last child*/
        .tree li:first-child::before, .tree li:last-child::after{
            border: 0 none;
        }
        /*Adding back the vertical connector to the last nodes*/
        .tree li:last-child::before{
            border-right: 1px solid #ccc;
            border-radius: 0 5px 0 0;
            -webkit-border-radius: 0 5px 0 0;
            -moz-border-radius: 0 5px 0 0;
        }
        .tree li:first-child::after{
            border-radius: 5px 0 0 0;
            -webkit-border-radius: 5px 0 0 0;
            -moz-border-radius: 5px 0 0 0;
        }

        /*Time to add downward connectors from parents*/
        .tree ul ul::before{
            content: '';
            position: absolute; top: 0; left: 50%;
            border-left: 1px solid #ccc;
            width: 0; height: 20px;
        }

        .tree li a{
            border: 1px solid #ccc;
            padding: 5px 10px;
            text-decoration: none;
            color: #666;
            font-family: arial, verdana, tahoma;
            font-size: 11px;
            display: inline-block;

            background-color: white;
            position: relative;
            z-index: 100;

            border-radius: 5px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;

            transition: all 0.5s;
            -webkit-transition: all 0.5s;
            -moz-transition: all 0.5s;
        }

        /*Time for some hover effects*/
        /*We will apply the hover effect the the lineage of the element also*/
        .tree li a:hover, .tree li a:hover+ul li a {
            background: #c8e4f8; color: #000; border: 1px solid #94a0b4;
        }
        /*Connector styles on hover*/
        .tree li a:hover+ul li::after,
        .tree li a:hover+ul li::before,
        .tree li a:hover+ul::before,
        .tree li a:hover+ul ul::before{
            border-color:  #94a0b4;
        }

        .trace_error{
            color:red;
        }
         .trace_success{
             color:green;
           }
           .trace_view:{
           }
           .trace_view_title:{
           }
           .trace_view_item:{
           }

    </style>
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
                        <h3>C端执行链路跟踪查询</h3>
                    </div>
                    <div class="title_right"></div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2><small style="color: red">注意:查询必须带上时间条件(限制在一周内)</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>

                            <div class="x_content">
                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left">
                                <div class="form-group">
                                                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">应用AppKey</label>
                                                                            <input type="text" id="appkey" name="appkey"
                                                                                  style="width:350px" class="form-control col-md-7 col-xs-12"/>
                                                                        </div>

                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <label class="control-label">用户ID</label>
                                            <input type="text" id="userId" name="userId"
                                                   style="width:200px"/>

                                        </div>
                                        <div>
                                            <label class="control-label">门店ID</label>
                                            <input type="text" id="poiId" name="poiId"
                                                  style="width:200px" value=""/>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <label class="control-label">收货人电话</label>
                                            <input type="text" id="recipentPhone" name="recipentPhone"
                                                   style="width:200px"/>
                                        </div>
                                        <div >
                                            <label class="control-label">订单ID</label>
                                            <input type="text" id="orderId" name="orderId"
                                                 style="width:200px"/>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <label class="control-label">订单viewID</label>
                                            <input type="text" id="orderViewId" name="orderViewId"
                                                   style="width:200px"/>
                                        </div>
                                       <div class="col-md-6 col-sm-6 col-xs-12">
                                            <label class="control-label">uuid</label>
                                            <input type="text" id="uuid" name="uuid"
                                                   style="width:200px"/>
                                        </div>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <label class="control-label">pushToken</label>
                                            <input type="text" id="pushToken" name="pushToken"
                                                  style="width:200px"/>
                                        </div>
                                      <div>
                                            <label class="control-label">扩展tag</label>
                                            <input type="text" id="extTag" name="extTag"
                                                   style="width:200px"/>
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">模糊查询条件</label>
                                            <input type="text" id="queryStr" name="queryStr"
                                             style="width:350px" class="form-control col-md-7 col-xs-12"/>
                                            </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start" class="control-label col-md-3 col-sm-3 col-xs-12">开始时间 <span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="start_calender" name="start" class="form-control col-md-7 col-xs-12"
                                                   placeholder="yyyy-MM-dd HH:mm:ss" value="${sTime}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="end" class="control-label col-md-3 col-sm-3 col-xs-12">结束时间 <span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="end_calender" name="end" class="form-control col-md-7 col-xs-12"
                                                   placeholder="yyyy-MM-dd HH:mm:ss" value="${eTime}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="button" class="btn btn-primary btn-submit">搜索</button>
                                        </div>
                                    </div>
                                </form>

                            </div>


                        </div>
                    </div>

                    <div id="trace-result" class="col-md-12 col-sm-12 col-xs-12">

                    </div>

                </div>

                <!-- /page content -->

            </div>
        </div>


        <!-- footer content -->
		<#include "../common/footer.ftl">
        <!-- /footer content -->
    </div>
</div>


<#include "../common/allscripts.ftl">

<!-- self define -->

<script type="text/javascript">
$(function(){

	$('#start_calender').datetimepicker({
		format: 'yyyy-mm-dd hh:ii:00',
		autoclose: true,
		todayBtn: true,
		minuteStep: 10
	});

	$('#end_calender').datetimepicker({
		format: 'yyyy-mm-dd hh:ii:00',
		autoclose: true,
		todayBtn: true,
		minuteStep: 10
	});


    $(".btn-submit").on("click", function(){

        $(this).addClass("disabled").html("搜索中...");
        $.ajax({
            url: "/optrace/search",
            data:{ "userId": $("#userId").val(),
                     "poiId": $("#poiId").val(),
                     "recipentPhone": $("#recipentPhone").val(),
                     "orderId": $("#orderId").val(),
                     "orderViewId": $("#orderViewId").val(),
                     "uuid": $("#uuid").val(),
                     "pushToken": $("#pushToken").val(),
                     "extTag": $("#extTag").val(),
                     "appkey": $("#appkey").val(),
                     "queryStr": $("#queryStr").val(),
                     "start": $("#start_calender").val(),
                     "end":$("#end_calender").val()
                  },
            type: "post",
            dataType:"json",
            success: function (result) {
                $(".btn-submit").html("搜索").removeClass("disabled");

                var msg = result.result;
                if (msg == "failed") {
                    return alert(result.data);
                }

                var optraceView = result.data;
                $('#start_calender').val(optraceView.lastRecord);
                if(optraceView.opTraceViewList.length<=0){
                    return alert('未查询到数据!');
                    return;
                }
                $(".trace_view").remove();
                $.each(optraceView.opTraceViewList,function(i,optrace) {
                   createTraceViw(optrace);
                });
            },
            error: function (err) {
                console.log("請求內容出錯"+err.msg);
                alert("請求內容出錯!"+err.msg);
            }
        });
    })


});


function createTraceViw(optraceView){
       var data = optraceView.flowSet;
    var view =' <div class="x_panel trace_view" id="trace-view-div"  style="overflow: scroll;display: block;">';
    view+='<div class="x_title trace_view_title">';
    view+='<h2><i class="fa fa-share-alt"></i> trace日志(';
    if(optraceView.normal==false){
    view+='<lable class="control-label trace_error">链路执行有异常</lable>';
    }else{
     view+='<lable class="control-label trace_success">链路执行正常</lable>';
    }
    view+=')('+optraceView.requestTime+')';
    view+=' </h2>';
    view+=' <ul class="nav navbar-right panel_toolbox">';
    view+=' <li><a class="collapse-link"><i class="fa fa-chevron-down"></i></a></li>';
    view+='</ul>';
    view+='<div class="clearfix"></div>';
    view+='</div>';
    view+='</div>';
    if($('.trace_view').length>0){
    $('.trace_view:last').after(view);
    }else{
     $('.row').after(view);
    }
    //创建viewItem
     var viewItem='';
    $.each(data, function(i, flowset) {
     if(i>0){
     viewItem+='<div class="x_content content-tree-view-div">';
     viewItem+='<img src="/static/images/down.png" style="display:block;width:20px;height:30px;margin:auto">';
     viewItem+='</div>';
        }

    viewItem+='<div class="x_content content-tree-view-div trace_view_item" style="overflow: scroll;border: 1px solid black;display: block;">';
    viewItem+='<div>';
    viewItem+='<p class="control-label">  <strong>opName:</strong>'+flowset.opName+'</p>';
    viewItem+='<p class="control-label">  <strong>appkey:</strong>'+flowset.appKey+'</p>';
    viewItem+='<p class="control-label">  <strong>hostName:</strong>'+flowset.hostName+'</p>';
    viewItem+='<p class="control-label">  <strong>opTime:</strong>'+flowset.executeTime+'</p>';
    viewItem+='<p class="control-label">  <strong>opType:</strong>'+flowset.opType+'</p>';
    if(flowset.opStatus=='失败'){
        viewItem+='<p class="control-label">  <strong>opStatus:</strong><font color="red">'+flowset.opStatus+'</font></p>';
    }else{
        viewItem+='<p class="control-label">  <strong>opStatus:</strong><font color="green">'+flowset.opStatus+'</font></p>';
    }
    if(flowset.opParam!=null && flowset.opParam!=''){
        viewItem+='<p class="control-label">  <strong>opParam:</strong>'+flowset.opParam+'</p>';
    }
    if(flowset.opResult!=null && flowset.opResult!=''){
        viewItem+='<p class="control-label">  <strong>opResult:</strong>'+flowset.opResult+'</p>';
    }
    if(flowset.extra!=null && flowset.extra!=''){
        viewItem+='<p class="control-label">  <strong>extra:</strong>'+flowset.extra+'</p>';
    }
    if(flowset.exception!=null && flowset.exception!=''){
     viewItem+='<p class="control-label">  <strong>exception:</strong>'+flowset.exception+'</p>';
    }
    viewItem+='</div>';
    viewItem+='</div>';
    });

   $('.trace_view_title:last').after(viewItem);

}
</script>
</body>

</html>