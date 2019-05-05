<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>外卖保险订单修复工具</title>

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
                        <h3>外卖保险订单修复工具</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>查询外卖保险订单</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <br />
                                <div id="demo-form" data-parsley-validate class="form-horizontal form-label-left">
                                    <div class="form-group">
                                        <label for="user_id" class="control-label col-md-3 col-sm-3 col-xs-12">wm_order_view_ids <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="outer_order_view_ids_for_query" name="outer_order_view_ids_for_query"  class="form-control col-md-7 col-xs-12"
												   placeholder="wm_order_view_id" value="${wm_order_view_ids!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button class="btn-search btn btn-primary" style="margin-right:80px" id="order_query">查询保险订单</button>
                                        </div>
                                    </div>
                                </div>
                                <textarea style="width:500px;height:250px;" id="deal-result-query" >
                                      查询返回结果
                                 </textarea>
                            </div>
                        </div>
                    </div>
                </div>


                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="x_panel">
                                            <div class="x_title">
                                                <h2>外卖保险订单投保</h2>
                                                <ul class="nav navbar-right panel_toolbox">
                                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                                </ul>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <br />
                                                <div id="demo-form" data-parsley-validate class="form-horizontal form-label-left">
                                                    <div class="form-group">
                                                        <label for="user_id" class="control-label col-md-3 col-sm-3 col-xs-12">wm_order_view_ids <span class="required">*</span></label>
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                            <input type="text" id="outer_order_view_ids_for_insurance" name="outer_order_view_ids_for_insurance"  class="form-control col-md-7 col-xs-12"
                												   placeholder="wm_order_view_id" value="${wm_order_view_ids!}"/>
                                                        </div>
                                                    </div>
                                                    <div class="ln_solid"></div>
                                                    <div class="form-group">
                                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                            <button class="btn-search btn btn-primary" id="order_insurance" style="margin-right:80px ">提交</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="deal-result" id="deal-result-insurance">投保处理结果</div>
                                            </div>
                                        </div>
                                    </div>
                             </div>

                             <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <div class="x_panel">
                                                        <div class="x_title">
                                                            <h2>外卖保险订单退保</h2>
                                                            <ul class="nav navbar-right panel_toolbox">
                                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                                            </ul>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div class="x_content">
                                                            <br />
                                                            <div id="demo-form" data-parsley-validate class="form-horizontal form-label-left">
                                                                <div class="form-group">
                                                                    <label for="user_id" class="control-label col-md-3 col-sm-3 col-xs-12">wm_order_view_ids <span class="required">*</span></label>
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                        <input type="text" id="outer_order_view_ids_for_cancel" name="outer_order_view_ids_for_cancel"  class="form-control col-md-7 col-xs-12"
                            												   placeholder="wm_order_view_id" value="${wm_order_view_ids!}"/>
                                                                    </div>
                                                                </div>
                                                                <div class="ln_solid"></div>
                                                                <div class="form-group">
                                                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                                        <button class="btn-search btn btn-primary" id="order_cancel" style="margin-right:80px ">提交</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="deal-result" id="deal-result-cancel">退保处理结果</div>
                                                        </div>
                                                    </div>
                                                </div>
                             </div>

                                        <div class="row">
                                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                                <div class="x_panel">
                                                                    <div class="x_title">
                                                                        <h2>外卖保险订单理赔</h2>
                                                                        <ul class="nav navbar-right panel_toolbox">
                                                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                                                        </ul>
                                                                        <div class="clearfix"></div>
                                                                    </div>
                                                                    <div class="x_content">
                                                                        <br />
                                                                        <div id="demo-form" data-parsley-validate class="form-horizontal form-label-left">
                                                                            <div class="form-group">
                                                                                <label for="user_id" class="control-label col-md-3 col-sm-3 col-xs-12">wm_order_view_ids <span class="required">*</span></label>
                                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                    <input type="text" id="outer_order_view_ids_for_claim" name="outer_order_view_ids_for_claim"  class="form-control col-md-7 col-xs-12"
                                        												   placeholder="wm_order_view_id" value="${wm_order_view_ids!}"/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="user_id" class="control-label col-md-3 col-sm-3 col-xs-12">riderArrivalTime <span class="required">*</span></label>
                                                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                                                    <input type="text" id="riderArrivalTime" name="riderArrivalTime"  class="form-control col-md-7 col-xs-12"
                                        												   placeholder="骑手送达时间" value="${riderArrivalTime!}"/>
                                                                                </div>
                                                                            </div>
                                                                            <div class="ln_solid"></div>
                                                                            <div class="form-group">
                                                                                <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                                                    <button class="btn-search btn btn-primary" id="order_claim" style="margin-right:80px ">提交</button>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="deal-result" id="deal-result-claim">理赔处理结果</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                        </div>
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
    .deal-error{
        margin-left: 278px;
        margin-top: 51px;
        color: red;
        font-size: 29px;
        display: none;
    }
    .deal-result{
        margin-left: 100px;
        margin-top: 51px;
        color: green;
        font-size: 15px;
        display: none;
    }
</style>
<script type="text/javascript">
    $(function(){
        $(" #order_query").on("click",function(event){
            $(" .deal-error").html("").hide();
            $(" .deal-result").html("").hide();
            event.preventDefault();
            $(this).addClass("disabled").html("查询中...");
            $.ajax({
                url:"/tools/wm/insurance/getWmApOrderInfo",
                data: {"outer_order_view_id": $("#outer_order_view_ids_for_query").val()},
                type:"json",
                method:"post",
                success:function(result){
                    $(" #order_query").html("查询保险订单").removeClass("disabled");
                    $(" #deal-result-query").html(result).show();
                }
            })

        });

         $(" #order_insurance").on("click",function(event){
                    $(" .deal-error").html("").hide();
                    $(" .deal-result").html("").hide();
                    event.preventDefault();
                    $(this).addClass("disabled").html("处理中...");
                    $.ajax({
                        url:"/tools/wm/insurance/orderInsurance",
                        data: {"outer_order_view_id": $("#outer_order_view_ids_for_insurance").val()},
                        type:"json",
                        method:"post",
                        success:function(result){
                            $(" #order_insurance").html("投保处理结果").removeClass("disabled");
                            $(" #deal-result-insurance").html(result).show();
                        }
                    })

                });

         $(" #order_cancel").on("click",function(event){
                    $(" .deal-error").html("").hide();
                    $(" .deal-result").html("").hide();
                    event.preventDefault();
                    $(this).addClass("disabled").html("处理中...");
                    $.ajax({
                        url:"/tools/wm/insurance/orderApplyCancel",
                        data: {"outer_order_view_id": $("#outer_order_view_ids_for_cancel").val()},
                        type:"json",
                        method:"post",
                        success:function(result){
                            $(" #order_cancel").html("退保处理结果").removeClass("disabled");
                            $(" #deal-result-cancel").html(result).show();
                        }
                    })

                });
         $(" #order_claim").on("click",function(event){
                    $(" .deal-error").html("").hide();
                    $(" .deal-result").html("").hide();
                    event.preventDefault();
                    $(this).addClass("disabled").html("处理中...");
                    $.ajax({
                        url:"/tools/wm/insurance/orderApplyClaim",
                        data: {"outer_order_view_id": $("#outer_order_view_ids_for_claim").val(),"riderArrivalTime":$("#riderArrivalTime").val()},
                        type:"json",
                        method:"post",
                        success:function(result){
                            $(" #order_claim").html("理赔处理结果").removeClass("disabled");
                            $(" #deal-result-claim").html(result).show();
                        }
                    })

                });
    });
</script>

</body>

</html>
