<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>隐私号redis查询</title>

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
                        <h3>隐私号redis查询</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>ax模式缓存查询</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <br />
                                <div id="demo-form" data-parsley-validate class="form-horizontal form-label-left">
                                    <div class="form-group">
                                        <label for="phone_a" class="control-label col-md-3 col-sm-3 col-xs-12">手机号 <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="phone_a_for_ax" name="phone_a"  class="form-control col-md-7 col-xs-12"
												   placeholder="phone_a" value="${phone_a!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="wm_order_view_id" class="control-label col-md-3 col-sm-3 col-xs-12">订单viewId <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="wm_order_view_id_for_ax" name="wm_order_view_id"  class="form-control col-md-7 col-xs-12"
												   placeholder="wm_order_view_id" value="${wm_order_view_id!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="biz_type" class="control-label col-md-3 col-sm-3 col-xs-12">业务类型 <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select id="biz_type_for_ax" name="biz_type">
                                        <option value="0">请选择</option>
                                        <option value="1" selected>外卖</option>
                                        </select>
                                            <input type="hidden" id="bind_mode_for_ax" name="bind_mode"  class="form-control col-md-7 col-xs-12"
												  value="1"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button class="btn-search btn btn-primary" style="margin-right:80px" id="ax_query">查询</button>
                                        </div>
                                    </div>
                                </div>
                                <textarea style="width:500px;height:250px;" id="deal-result-query_for_ax" >
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
                                                <h2>axb模式缓存查询</h2>
                                                <ul class="nav navbar-right panel_toolbox">
                                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                                </ul>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="x_content">
                                                <br />
                                                <div id="demo-form" data-parsley-validate class="form-horizontal form-label-left">
                                                    <div class="form-group">
                                                        <label for="phone_a" class="control-label col-md-3 col-sm-3 col-xs-12">手机号a <span class="required">*</span></label>
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                            <input type="text" id="phone_a_for_axb" name="phone_a"  class="form-control col-md-7 col-xs-12"
                												   placeholder="phone_a" value="${phone_a!}"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="phone_b" class="control-label col-md-3 col-sm-3 col-xs-12">手机号b <span class="required">*</span></label>
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                            <input type="text" id="phone_b_for_axb" name="phone_b"  class="form-control col-md-7 col-xs-12"
                												   placeholder="phone_b" value="${phone_b!}"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="wm_order_view_id" class="control-label col-md-3 col-sm-3 col-xs-12">订单viewId <span class="required">*</span></label>
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                            <input type="text" id="wm_order_view_id_for_axb" name="wm_order_view_id"  class="form-control col-md-7 col-xs-12"
                												   placeholder="wm_order_view_id" value="${wm_order_view_id!}"/>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="biz_type" class="control-label col-md-3 col-sm-3 col-xs-12">业务类型 <span class="required">*</span></label>
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <select id="biz_type_for_axb" name="biz_type">
                                                        <option value="0">请选择</option>
                                                        <option value="1" selected>外卖</option>
                                                        </select>
                                                            <input type="hidden" id="bind_mode_for_axb" name="bind_mode"  class="form-control col-md-7 col-xs-12"
                												  value="0"/>
                                                        </div>
                                                    </div>
                                                    <div class="ln_solid"></div>
                                                    <div class="form-group">
                                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                            <button class="btn-search btn btn-primary" style="margin-right:80px" id="axb_query">查询</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <textarea style="width:500px;height:250px;" id="deal-result-query_for_axb" >
                                                      查询返回结果
                                                 </textarea>
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
        $(" #ax_query").on("click",function(event){
            $(" .deal-error").html("").hide();
            $(" .deal-result").html("").hide();
            event.preventDefault();
            if($("#phone_a_for_ax").val()==''){
                alert('手机号不能为空');
                return false;
            }
            if($("#wm_order_view_id_for_ax").val()==''){
                alert('订单vewId不能为空');
                return false;
            }
            $(this).addClass("disabled").html("查询中...");
            $.ajax({
                url:"/tools/privatenumber/cache",
                data: {"wm_order_view_id": $("#wm_order_view_id_for_ax").val(),
                "phone_a":$("#phone_a_for_ax").val(),
                "biz_type":$("#biz_type_for_ax").val(),
                "bind_mode":$("#bind_mode_for_ax").val()},
                method:"post",
                success:function(result){
                    $(" #ax_query").html("查询").removeClass("disabled");
                    $(" #deal-result-query_for_ax").html(result).show();
                }
            })

        });
        $(" #axb_query").on("click",function(event){
            $(" .deal-error").html("").hide();
            $(" .deal-result").html("").hide();
             if($("#phone_a_for_axb").val()==''){
                            alert('手机号a不能为空');
                            return false;
                        }
             if($("#phone_b_for_axb").val()==''){
                            alert('手机号b不能为空');
                            return false;
              }
            if($("#wm_order_view_id_for_axb").val()==''){
                alert('订单vewId不能为空');
                return false;
            }
            event.preventDefault();
            $(this).addClass("disabled").html("查询中...");
            $.ajax({
                url:"/tools/privatenumber/cache",
                data: {"wm_order_view_id": $("#wm_order_view_id_for_axb").val(),
                "phone_a":$("#phone_a_for_axb").val(),
                "phone_b":$("#phone_b_for_axb").val(),
                "biz_type":$("#biz_type_for_axb").val(),
                "bind_mode":$("#bind_mode_for_axb").val()},
                method:"post",
                success:function(result){
                    $(" #axb_query").html("查询").removeClass("disabled");
                    $(" #deal-result-query_for_axb").html(result).show();
                }
            })

        });
    });
</script>

</body>

</html>
