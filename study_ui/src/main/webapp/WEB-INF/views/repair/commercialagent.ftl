<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>修复数据</title>

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
                        <h3>代理商数据修复</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>修复工具 <small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        <#if error??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error!}
                            </div>
                        </#if>
                            <div class="x_content">
                                <article style="margin: 0 20%;">
                                    <h3>使用说明</h3>
                                    <p>修复方式分为2种:</p>
                                    <ul>
                                        <li>1.使用订单ids修复,默认是这个方式进行.</li>
                                        <li>2.使用门店id + 时间修复,如果没填订单ids,那么是这个方式进行.</li>
                                    </ul>
                                    <p>两种方式只能选择其中之一,不可用两种进行填写.</p>
                                    <p>勾选了清除代理商标识,那么会把对应订单的代理商标去掉.</p>
                                    <p>没勾选会从cbase查询打到订单上,这样的方式需要的cbase修复数据,或者门店修复数据后进行.</p>
                                </article>

                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/repair/commercial/agent/" method="post">
                                    <div class="form-group">
                                        <label for="wm_order_ids" class="control-label col-md-3 col-sm-3 col-xs-12">订单ids(以,号分割)</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <textarea id="wm_order_ids" name="wm_order_ids" class="form-control" rows="3">${wm_order_ids!}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="wm_poi_id" class="control-label col-md-3 col-sm-3 col-xs-12">门店id </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="wm_poi_id" name="wm_poi_id" class="form-control col-md-7 col-xs-12"
                                                   placeholder="" value="${wm_poi_id!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="clearAgent" class="control-label col-md-3 col-sm-3 col-xs-12">清除代理商标识?</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="checkbox" id="clearAgent" class="form-control col-md-7 col-xs-12">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="beginDate_calender" class="control-label col-md-3 col-sm-3 col-xs-12">开始时间</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="beginDate_calender" name="begintime" class="form-control col-md-7 col-xs-12"
                                                   placeholder="beginDate" value="${beginDate!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="endDate_calender" class="control-label col-md-3 col-sm-3 col-xs-12">结束时间 </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="endDate_calender" name="endtime" class="form-control col-md-7 col-xs-12"
                                                   placeholder="endDate" value="${endDate!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" id="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
                            <#if result??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result!}
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
<#-- /demo-form validation -->
<script type="text/javascript">
    $(document).ready(function() {

        $('#wm_order_ids').focusout(function(){
            if($(this).val().trim().length > 0) {
                $('#wm_poi_id').attr("disabled","disabled");
                $('#wm_poi_id').val("");
                $('#beginDate_calender').attr("disabled","disabled");
                $('#beginDate_calender').val("");
                $('#endDate_calender').attr("disabled","disabled");
                $('#beginDate_calender').val("");
            } else {
                $(this).attr("disabled","disabled");
                $(this).val("");
                $('#wm_poi_id').removeAttr("disabled");
                $('#beginDate_calender').removeAttr("disabled");
                $('#endDate_calender').removeAttr("disabled");
            }
        });

        $('#wm_poi_id').focusout(function(){
            if($(this).val().trim().length > 0) {
                $('#wm_order_ids').attr("disabled","disabled");
            } else {
                $(this).attr("disabled","disabled");
                $(this).val("");
                $('#wm_order_ids').removeAttr("disabled");
                $('#beginDate_calender').attr("disabled","disabled");
                $('#beginDate_calender').val("");
                $('#endDate_calender').attr("disabled","disabled");
                $('#endDate_calender').val("");
            }
        });


//        $('#submit').click(function(){
//            $.post("/repair/commercial/agent",{
//                wm_order_ids: $('#wm_order_ids').val(),
//                wm_poi_id: $('#wm_poi_id').val() == "" ? 0 : $('#wm_poi_id').val(),
//                clearAgent: $('#clearAgent').attr("checked") == 'checked',
//                begintime: $('#beginDate_calender').val(),
//                endtime: $('#endDate_calender').val()
//            },function(result){
//                if(result.success) {
//                    alert("修复成功!");
//                } else {
//                    alert("修复失败:" + result.data);
//                }
//            }, "json");
//        });

        $('#beginDate_calender').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:00',
            autoclose: true,
            todayBtn: true,
            minuteStep: 10
        });

        $('#endDate_calender').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:00',
            autoclose: true,
            todayBtn: true,
            minuteStep: 10
        });

        $('#begintime_calender').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:00',
            autoclose: true,
            todayBtn: true,
            minuteStep: 10
        });

        $('#endtime_calender').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:00',
            autoclose: true,
            todayBtn: true,
            minuteStep: 10
        });
    });
</script>
</body>

</html>