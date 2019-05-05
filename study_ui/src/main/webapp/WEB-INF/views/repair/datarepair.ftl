<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>订单纬度数据修复</title>

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
                        <h3>修复数据</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>根据OrderId进行修复 <small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
							<#if error_orderidview??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_orderidview!}
                            </div>
							</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/repair/data/repair/orderidview" method="post">
                                    <div class="form-group">
                                        <label for="wmOrders" class="control-label col-md-3 col-sm-3 col-xs-12">wmOrders <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="wmOrders" name="wmOrders" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="wmOrders" value="${wmOrders!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
								<#if result_orderidview??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result_orderidview!}
                                </div>
								</#if>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>批量(分布式job)修补故障期间订单数据 <small style="color: red">注意:只能修复一个月以内数据,时间跨度限制在半小时以内
                                </small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
							<#if error_timerangeview??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_timerangeview!}
                            </div>
							</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form-timeRange" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/repair/data/repair/timerangeview" method="post">
                                    <div class="form-group">
                                        <label for="beginDate" class="control-label col-md-3 col-sm-3 col-xs-12">beginDate <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="beginDate_calender" name="beginDate" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="beginDate" value="${beginDate!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="endDate" class="control-label col-md-3 col-sm-3 col-xs-12">endDate <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="endDate_calender" name="endDate" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="endDate" value="${endDate!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
								<#if result_timerangeview??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result_timerangeview!}
                                </div>
								</#if>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>根据OrderId修复Tair数据 <small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        <#if error_tair??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_tair!}
                            </div>
                        </#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/repair/data/repair/tair/order" method="post">
                                    <div class="form-group">
                                        <label for="wmOrderId" class="control-label col-md-3 col-sm-3 col-xs-12">wmOrderId <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="wmOrderId" name="wmOrderId" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="wmOrderId" value="${wmOrderId!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
                            <#if result_tair??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result_tair!}
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

<#-- demo-form validation -->
	<script type="text/javascript">
        $(document).ready(function() {
            $.listen('parsley:field:validate', function() {
                validateFront();
            });
            $('#demo-form-timeRange .btn').on('click', function() {
                $('#demo-form-timeRange').parsley().validate();
                validateFront();
            });
            var validateFront = function() {
                if (true === $('#demo-form-timeRange').parsley().isValid()) {
                    $('.bs-callout-info').removeClass('hidden');
                    $('.bs-callout-warning').addClass('hidden');
                } else {
                    $('.bs-callout-info').addClass('hidden');
                    $('.bs-calloudemo-form-bytimet-warning').removeClass('hidden');
                }
            };
        });
        try {
            hljs.initHighlightingOnLoad();
        } catch (err) {}
    </script>
<#-- /demo-form validation -->

<#-- demo-form validation -->
	<script type="text/javascript">
        $(document).ready(function() {
            $.listen('parsley:field:validate', function() {
                validateFront();
            });
            $('#demo-form-bytime .btn').on('click', function() {
                $('#demo-form-bytime').parsley().validate();
                validateFront();
            });
            var validateFront = function() {
                if (true === $('#demo-form-bytime').parsley().isValid()) {
                    $('.bs-callout-info').removeClass('hidden');
                    $('.bs-callout-warning').addClass('hidden');
                } else {
                    $('.bs-callout-info').addClass('hidden');
                    $('.bs-callout-warning').removeClass('hidden');
                }
            };
        });
        try {
            hljs.initHighlightingOnLoad();
        } catch (err) {}
	</script>
<#-- /demo-form validation -->

<script type="text/javascript">
	$(document).ready(function() {
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