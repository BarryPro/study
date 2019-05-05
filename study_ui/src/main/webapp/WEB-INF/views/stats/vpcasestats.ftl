<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>VP 故障统计</title>

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
                        <h3>VP 故障统计</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>VP 统计工具
                                    <small style="color: red">注意:查询时间跨度限制在<b>6小时</b>以内</small>
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
                                      action="/stats/vpcasestats/vp/sales" method="post">
                                    <div class="form-group">
                                        <label for="st" class="control-label col-md-3 col-sm-3 col-xs-12">开始时间 <span
                                                class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="st_calender" name="st" required="required"
                                                   class="form-control col-md-7 col-xs-12"
                                                   value="${st!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">结束时间
                                            <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="ed_calender" name="ed" required="required"
                                                   class="form-control col-md-7 col-xs-12"
                                                   value="${ed!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3 col-sm-3 col-xs-12">渠道 <span
                                                class="required">*</span></label>
                                        <div class="col-md-3 col-sm-3 col-xs-12">
                                            <select name="channel" class="form-control">
												<#if selected??>
													<#if selected == "1">
														<option selected value="1">All</option>
														<option value="2">美团</option>
														<option value="3">微信-钱包</option>
                                                        <option value="4">配送App</option>
                                                    <#elseif selected == "2">
                                                        <option value="1">All</option>
														<option selected value="2">美团</option>
														<option value="3">微信-钱包</option>
                                                        <option value="4">配送App</option>
                                                    <#elseif selected == "3">
                                                        <option value="1">All</option>
														<option value="2">美团</option>
														<option selected value="3">微信-钱包</option>
                                                        <option value="4">配送App</option>
                                                    <#elseif selected == "4">
                                                        <option value="1">All</option>
														<option value="2">美团</option>
														<option value="3">微信-钱包</option>
                                                        <option selected value="4">配送App</option>
                                                    </#if>
                                                <#else>
                                                    <option selected value="1">All</option>
                                                    <option value="2">美团</option>
                                                    <option value="3">微信-钱包</option>
                                                    <option value="4">配送App</option>
                                                </#if>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>

							<#if result??>
								<div class="x_panel">
                                    <div class="x_title">
                                        <h2>统计结果(事故损失计算模型wiki：<a
                                                href="http://wiki.sankuai.com/pages/viewpage.action?pageId=367072584"
                                                target="_blank">事故损失计算模型</a>)
                                            <small></small>
                                        </h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <th>统计项</th>
                                                <th>有效VP订单数(${channelName})</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <th scope="row">${caseTime}</th>
                                                <td>${caseSale}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">${refTime}</th>
                                                <td>${caseRefSale}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">${cmpTime}</th>
                                                <td>${cmpCaseSale}</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">${cmpRefTime}</th>
                                                <td>${cmpRefSale}</td>
                                            </tr>
                                            <tr>
                                                <td style='color: ${lossTag}'>${lossName}</td>
                                                <td style='color: ${lossTag}'>${lossDesc}</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
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

<script type="text/javascript">
    $(document).ready(function () {
        $('#st_calender').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:00',
            autoclose: true,
            todayBtn: true,
            minuteStep: 10
        });

        $('#ed_calender').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:00',
            autoclose: true,
            todayBtn: true,
            minuteStep: 10
        });
    });
</script>

</body>

</html>