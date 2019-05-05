<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>隐私号运营后台</title>

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
                        <h3>隐私号运营后台</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>话单查询</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
							<#if error??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error!}
                            </div>
                            </#if>
                            <div class="x_content">
                                <br/>
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/query/privacyoperation/encodingquery" method="post">
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">查询号码
                                            <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="phone_number_bill" name="phone_number_bill"
                                                   class="form-control col-md-7 col-xs-12" value="${t_phoneNumber!}"
                                                   placeholder="请输入主叫、被叫或虚拟号码"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">开始时间</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="st_calender_bill" name="st_calender_bill"
                                                   class="form-control col-md-7 col-xs-12"
                                                   value="${t_start!}" placeholder="开始时间"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">结束时间</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="ed_calender_bill" name="ed_calender_bill"
                                                   class="form-control col-md-7 col-xs-12"
                                                   value="${t_end!}" placeholder="结束时间"/>
                                            <br>
                                            <small style="color: red">注意:若不输入时间，则默认查询<b>3天</b>日志</small>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">话单查询</button>
                                        </div>
                                    </div>
                                </form>
                            <#if displayCall??>
                                <#if callBillVoMap??>
                                <div class="x_panel" style="overflow: scroll">
                                    <div class="x_title">
                                        <h2>话单信息</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table class="table table-orderById">
                                            <thead>
                                            <tr>
                                                <th>序号</th>
                                                <th>日志时间</th>
                                                <th>真实主叫</th>
                                                <th>虚拟号码</th>
                                                <th>真实被叫</th>
                                                <th>呼叫结果</th>
                                                <th>通话时长</th>
                                                <th>通话录音</th>
                                                <th>供应商</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <#assign i=0>
                                            <#list callBillVoMap?keys as callBillKey>
                                                <#assign i=i+1>
                                            <tr>
                                                <td>${i}</td>
                                                <td>${callBillVoMap[callBillKey].log_time!}</td>
                                                <td>${callBillVoMap[callBillKey].real_calling!}</td>
                                                <td>${callBillVoMap[callBillKey].tel_x!}</td>
                                                <td>${callBillVoMap[callBillKey].real_called!}</td>
                                                <td>${callBillVoMap[callBillKey].call_result!}</td>
                                                <td>${callBillVoMap[callBillKey].call_duration!}</td>
                                                <#if callBillVoMap[callBillKey].mp3_url??>
                                                    <#if callBillVoMap[callBillKey].mp3_url != "">
                                                    <td><a href="${callBillVoMap[callBillKey].mp3_url!}">录音链接</a></td>
                                                    <#else>
                                                    <td>无录音</td>
                                                    </#if>
                                                <#else>
                                                    <td>无录音</td>
                                                </#if>
                                                <td>${callBillVoMap[callBillKey].supplier!}</td>
                                            </tr>
                                            </#list>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <#else>
                            <div class="x_panel" style="overflow: scroll">
                                <div class="x_title">
                                    <h2>话单信息</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                    <div class="x_content"><br><span>查询数据为空</span></div>
                                </div>
                            </div>
                                </#if>
                            </#if>
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

        <script type="text/javascript">
            $(document).ready(function () {
                $('#st_calender_bill').datetimepicker({
                    format: 'yyyy/mm/dd 00:00:00',
                    autoclose: true,
                    todayBtn: true,
                    minView: "month",
                    minuteStep: 10
                });

                $('#ed_calender_bill').datetimepicker({
                    format: 'yyyy/mm/dd 23:59:59',
                    autoclose: true,
                    todayBtn: true,
                    minView: "month",
                    minuteStep: 10
                });
            });
        </script>

</body>

</html>