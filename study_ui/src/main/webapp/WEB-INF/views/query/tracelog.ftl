<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>订单跟踪查询</title>

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
                        <h3>订单跟踪查询</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2><small style="color: red">注意:用phone,user_id,uuid,poi_id查询必须带上时间(限制在一周内)</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>

                            <div class="x_content">
                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left">
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">查询键</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <select class="form-control" id="fieldId" name="fieldId">
                                                <option value="1">order_id</option>
                                                <option value="2">order_token</option>
                                                <option value="3">order_view_id</option>
                                                <option value="4">phone</option>
                                                <option value="5">user_id</option>
                                                <option value="6">uuid</option>
                                                <option value="7">poi_id</option>
                                            </select>
                                            <input type="text" id="value" name="value" class="form-control col-md-7 col-xs-12"
                                                   placeholder="value"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start" class="control-label col-md-3 col-sm-3 col-xs-12">开始时间 <span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="start_calender" name="start" class="form-control col-md-7 col-xs-12"
                                                   placeholder="yyyy-MM-dd HH:mm:ss"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="end" class="control-label col-md-3 col-sm-3 col-xs-12">结束时间 <span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="end_calender" name="end" class="form-control col-md-7 col-xs-12"
                                                   placeholder="yyyy-MM-dd HH:mm:ss"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary btn-submit">查询</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>

                    <div id="trace-result" class="col-md-12 col-sm-12 col-xs-12">

                    </div>

                </div>
            </div>
        </div>
        <!-- /page content -->

        <div class="x_panel" id="trace-view-div" style="overflow: scroll;display: none;">
            <div class="x_title">
                <h2><i class="fa fa-share-alt"></i> 订单操作流
                    <small>(流向<i class="fa fa-long-arrow-right"></i>)</small>
                </h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content content-tree-view-div" style="overflow: scroll">

            </div>
        </div>

        <!-- footer content -->
		<#include "../common/footer.ftl">
        <!-- /footer content -->
    </div>
</div>

<#-- trace 展示方式 -->
<#include "ordertrace/treeview.ftl">

<#include "../common/allscripts.ftl">

<!-- self define -->
<script src="/static/js/admin/ordertrace/order-trace-tree.js"></script>

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

    $(".btn-submit").on("click", function(event){
        event.preventDefault();

        $(this).addClass("disabled").html("查询中...");

        $.ajax({
            url: "/query/tracelog/",
            data: {
                "fieldId": $("#fieldId").val(),
                "value": $("#value").val(),
                "start": $("#start_calender").val(),
                "end":$("#end_calender").val()
            },
            type: "json",
            method: "post",
            success: function (data) {
                $(".btn-submit").html("查询").removeClass("disabled");

                var json = JSON.parse(data);
                var msg = json.result;
                if (msg == "failed") {
                    return alert(json.data);
                }

                var chains = json.data;

                $("#trace-result").empty();
                chains.forEach(function(chain, i) {
                    var traceViewDiv = $('#trace-view-div').clone();
                    traceViewDiv.removeAttr('id');
                    traceViewDiv.show();

                    var treeViewDiv = drawTraceTree(chain);
                    var contentDiv = traceViewDiv.find('.content-tree-view-div');
                    contentDiv.empty();
                    contentDiv.append(treeViewDiv);

                    $("#trace-result").append(traceViewDiv);
                });



            },
            error: function (err) {
                console.log("請求內容出錯"+err.msg);
                alert("請求內容出錯!"+err.msg);
            }
        });
    })


});
</script>
</body>

</html>