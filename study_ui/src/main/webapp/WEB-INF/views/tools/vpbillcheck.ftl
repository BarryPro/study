<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>隐私号话单统计检查</title>

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
                        <h3>隐私号话单统计检查</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>隐私号话单统计检查
                                    <small style="color: red">注意:查询时间跨度限制在<b>一个月</b></small>
                                </h2>
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
                                      action="/tools/privatenumber/vpbillcheckmail/billcheck" method="post">
                                    <div class="form-group">
                                        <label for="st" class="control-label col-md-3 col-sm-3 col-xs-12">绑定开始 <span
                                                class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="st_calender" name="st" required="required"
                                                   class="form-control col-md-7 col-xs-12" autocomplete="off"
                                                   value="${st!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">绑定结束
                                            <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="ed_calender" name="ed" required="required"
                                                   class="form-control col-md-7 col-xs-12" autocomplete="off"
                                                   value="${ed!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="st" class="control-label col-md-3 col-sm-3 col-xs-12">dt-开始 <span
                                                class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="dt_st_calender" name="dt_st"
                                                   class="form-control col-md-7 col-xs-12" autocomplete="off"
                                                   value="${dt_st!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">dt-结束
                                            <span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="dt_ed_calender" name="dt_ed"
                                                   class="form-control col-md-7 col-xs-12" autocomplete="off"
                                                   value="${dt_ed!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">report-dt-开始
                                            <span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="report_dt_st_calender" name="report_st_time"
                                                   class="form-control col-md-7 col-xs-12" autocomplete="off"
                                                   value="${report_st_time!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">report-dt-结束
                                            <span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="report_dt_ed_calender" name="report_ed_time"
                                                   class="form-control col-md-7 col-xs-12" autocomplete="off"
                                                   value="${report_ed_time!}"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">供应商 <span
                                                class="required">*</span></label>
                                        <div class="col-md-3 col-sm-3 col-xs-12">
                                            <select name="supplier" class="form-control">
												<#if selected??>
													<#if selected == "1">
														<option selected value="1">中联</option>
														<option value="2">东信</option>
                                                    <#elseif selected == "2">
                                                        <option value="1">中联</option>
														<option selected value="2">东信</option>
                                                    </#if>
                                                <#else>
                                                    <option selected value="1">中联</option>
                                                    <option value="2">东信</option>
                                                </#if>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">发 送</button>
                                        </div>
                                    </div>
                                </form>
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

<script type="text/javascript">
    $(document).ready(function () {
        $('#st_calender').datetimepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayBtn: true,
            minView: "month",
            minuteStep: 10
        });

        $('#ed_calender').datetimepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayBtn: true,
            minView: "month",
            minuteStep: 10
        });

        $('#dt_st_calender').datetimepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayBtn: true,
            minView: "month",
            minuteStep: 10
        });

        $('#dt_ed_calender').datetimepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayBtn: true,
            minView: "month",
            minuteStep: 10
        });

        $('#report_dt_ed_calender').datetimepicker({
            format: 'yyyymmdd',
            autoclose: true,
            todayBtn: true,
            minView: "month",
            minuteStep: 10
        });

        $('#report_dt_st_calender').datetimepicker({
            format: 'yyyymmdd',
            autoclose: true,
            todayBtn: true,
            minView: "month",
            minuteStep: 10
        });
    });
</script>

</body>

</html>