<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>首单查询&每日优惠清理</title>

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
                        <h3>首单查询&每日优惠清理</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>查询清理工具 <small>用于查询首单/清理每日优惠次数(仅线下)</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <br />
                                <div id="demo-form" data-parsley-validate class="form-horizontal form-label-left">
                                    <div class="form-group">
                                        <label for="user_id" class="control-label col-md-3 col-sm-3 col-xs-12">user_id <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="user_id" name="user_id"  class="form-control col-md-7 col-xs-12"
												   placeholder="user id" value="${user_id!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="user_id" class="control-label col-md-3 col-sm-3 col-xs-12">recipient_phone <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="recipient_phone" name="recipient_phone"  class="form-control col-md-7 col-xs-12"
                                                   placeholder="recipient phone" value="${recipient_phone!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="uuid" class="control-label col-md-3 col-sm-3 col-xs-12">uuid <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="uuid" name="uuid"  class="form-control col-md-7 col-xs-12"
                                                   placeholder="uuid" value="${uuid!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button class="btn-search btn btn-primary" style="margin-right:80px ">查询首单</button>
                                            <button class="btn-clean btn btn-primary">清理每日优惠</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="deal-error">查询错误信息</div>
                                <div class="deal-result">查询返回结果</div>

							<#if result??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> <span class="result">${result!}</span>
                                </div>
							</#if>
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
        $(" .btn-search").on("click",function(event){
            $(" .deal-error").html("").hide();
            $(" .deal-result").html("").hide();
            event.preventDefault();
            $(this).addClass("disabled").html("查询中...");
            $.ajax({
                url:"/tools/dev/clear/env/useraccout/act/search",
                data: {"user_id": $("#user_id").val(),"recipient_phone": $("#recipient_phone").val(),"uuid":$("#uuid").val()},
                type:"json",
                method:"post",
                success:function(data){
                    $(" .btn-search").html("查询首单").removeClass("disabled");
                    var json = JSON.parse(data);
                    if(json.error){
                        $(" .deal-error").html(json.error).show();
                        return;
                    }
                    $(" .deal-error").html("").hide();
                    $(" .deal-result").html(json.result).show();
                }
            })

        })
    });
</script>
<script type="text/javascript">
    $(function(){
        $(" .btn-clean").on("click",function(event){
            $(" .deal-error").html("").hide();
            $(" .deal-result").html("").hide();
            event.preventDefault();
            $(this).addClass("disabled").html("清理中...");
            $.ajax({
                url:"/tools/dev/clear/env/dailyact",
                data: {"user_id": $("#user_id").val(),"recipient_phone": $("#recipient_phone").val(),"uuid":$("#uuid").val()},
                type:"json",
                method:"post",
                success:function(data){
                    $(" .btn-clean").html("清理每日优惠").removeClass("disabled");
                    var json = JSON.parse(data);
                    if(json.error){
                        $(" .deal-error").html(json.error).show();
                        return;
                    }
                    $(" .deal-error").html("").hide();
                    $(" .deal-result").html(json.result).show();

                }
            })

        })
    });
</script>

</body>

</html>
