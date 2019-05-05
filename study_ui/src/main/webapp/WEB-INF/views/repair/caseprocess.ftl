<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>支付异常订单修复</title>

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
                        <h3>支付异常订单修复</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>


                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>故障订单查询 <small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
						<#if error_search??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_search!}
                            </div>
						</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form-C" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/repair/caseprocess/searchbyorder" method="post">
                                    <div class="form-group">
                                        <label for="orderId" class="control-label col-md-3 col-sm-3 col-xs-12">orderId <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="orderId" name="orderId" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="orderId" value="${orderId!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
							<#if result_search??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
									<#if needRefund??>
                                        <strong>运行结果: </strong> ${search_reason!}
									<#else >
                                        <strong>运行结果: </strong> ${search_reason!} <a href='http://waimai.sankuai.com/wmorder/query/r/list_all_valid?_from=order_bd_panel' target='_blank'>欲了解订单详情请点这里</a>
									</#if>
                                </div>

								<#if needRefund??>
									<form id="" data-parsley-validate class="form-horizontal form-label-left"
										  action="/repair/caseprocess/refundbyorder" method="post">
                                        <input type="hidden" id="refundOrderId" name="refundOrderId" required="required"
											   value="${refundOrderId!}"/>
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button type="submit" class="btn btn-primary">退款</button>
											</div>
										</div>
									</form>
								</#if>
							</#if>
							<#if error_refund??>
                                <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>退款结果: </strong> ${error_refund!}
                                </div>
							</#if>
							<#if result_refund??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>退款结果: </strong> ${result_refund!}
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
                                <h2>通过时间范围批量退款 <small>限制3分钟以内</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
							<#if error_timerange??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_timerange!}
                            </div>
							</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/repair/caseprocess/refund/timerangeview/" method="post">
                                    <div class="form-group">
                                        <label for="begintime" class="control-label col-md-3 col-sm-3 col-xs-12">begintime <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="begintime_calender" name="begintime" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="yyyy-MM-dd HH:mm:ss" value="${begintime!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="end_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">endtime <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="endtime_calender" name="endtime" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="yyyy-MM-dd HH:mm:ss" value="${endtime!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
								<#if result_timerange??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result_timerange!}
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
                                <h2>通过id批量退款 <small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
							<#if error_view??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_view!}
                            </div>
							</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form-A" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/repair/caseprocess/refundbybatchview" method="post">
                                    <div class="form-group">
                                        <label for="wmOrderIds" class="control-label col-md-3 col-sm-3 col-xs-12">wmOrderIds <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="start_autofinish" name="wmOrderIds" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="wmOrderIds" value="${wmOrderIds!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
								<#if result_view??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result_view!}
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
                                <h2>通过支付记录批量退款 <small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
							<#if error_payrecord??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_payrecord!}
                            </div>
							</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form-B" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/repair/caseprocess/refundbypayrecordbatchview" method="post">
                                    <div class="form-group">
                                        <label for="wmPayRecordIds" class="control-label col-md-3 col-sm-3 col-xs-12">wmPayRecordIds <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="wmPayRecordIds" name="wmPayRecordIds" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="wmPayRecordIds" value="${wmPayRecordIds!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
							<#if result_payrecord??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result_payrecord!}
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
            $('#demo-form-A .btn').on('click', function() {
                $('#demo-form-A').parsley().validate();
                validateFront();
            });
            var validateFront = function() {
                if (true === $('#demo-form-A').parsley().isValid()) {
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
            $('#demo-form-B .btn').on('click', function() {
                $('#demo-form-B').parsley().validate();
                validateFront();
            });
            var validateFront = function() {
                if (true === $('#demo-form-B').parsley().isValid()) {
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

<#-- demo-form validation -->
<script type="text/javascript">
        $(document).ready(function() {
            $.listen('parsley:field:validate', function() {
                validateFront();
            });
            $('#demo-form-C .btn').on('click', function() {
                $('#demo-form-C').parsley().validate();
                validateFront();
            });
            var validateFront = function() {
                if (true === $('#demo-form-C').parsley().isValid()) {
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