<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>异步系统数据修复</title>

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
                        <h3>异步系统数据修复</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>订单自动取消检测/修复 <small>[用户15分钟未支付/商家5分钟未接单自动取消]</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
							<#if error_asyncautocancel??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_asyncautocancel!}
                            </div>
							</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/repair/async/asyncautocancel/" method="post">
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">start <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="start_autocancel_calender" name="start_autocancel" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="yyyy-MM-dd HH:mm:ss" value="${start_autocancel!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="end_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">end <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="end_autocancel_calender" name="end_autocancel" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="yyyy-MM-dd HH:mm:ss" value="${end_autocancel!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="resolve_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">resolve <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="resolve_autocancel" name="resolve_autocancel" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="true/false" value="${resolve_autocancel!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
								<#if result_asyncautocancel??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result_asyncautocancel!}
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
                                <h2>订单自动完成检测/修复 <small>[订单完成检测/修复]</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
							<#if error_asyncautofinish??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_asyncautofinish!}
                            </div>
							</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form-A" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/repair/async/asyncautofinish/" method="post">
                                    <div class="form-group">
                                        <label for="start_autofinish" class="control-label col-md-3 col-sm-3 col-xs-12">start <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="start_autofinish_calender" name="start_autofinish" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="yyyy-MM-dd HH:mm:ss" value="${start_autofinish!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="end_autofinish" class="control-label col-md-3 col-sm-3 col-xs-12">end <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="end_autofinish_calender" name="end_autofinish" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="yyyy-MM-dd HH:mm:ss" value="${end_autofinish!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="resolve_autofinish" class="control-label col-md-3 col-sm-3 col-xs-12">resolve <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="resolve_autofinish" name="resolve_autofinish" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="true/false" value="${resolve_autofinish!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
								<#if result_asyncautofinish??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result_asyncautofinish!}
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
                                <h2>手动批量自动完成订单 <small>[手动向队列中插入需要自动完成的订单]</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
							<#if error_asyncautofinishbybatch??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_asyncautofinishbybatch!}
                            </div>
							</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form-B" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/repair/async/autofinishbybatchview" method="post">
                                    <div class="form-group">
                                        <label for="fireTime" class="control-label col-md-3 col-sm-3 col-xs-12">fireTime </label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="fireTime" name="fireTime" class="form-control col-md-7 col-xs-12"
                                                   placeholder="fire time" value="${fireTime!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="wmOrderIds" class="control-label col-md-3 col-sm-3 col-xs-12">wmOrderIds <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="wmOrderIds" name="wmOrderIds" required="required" class="form-control col-md-7 col-xs-12"
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
							<#if result_asyncautofinishbybatch??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result_asyncautofinishbybatch!}
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

<script type="text/javascript">
	$(document).ready(function() {
		$('#start_autocancel_calender').datetimepicker({
			format: 'yyyy-mm-dd hh:ii:00',
			autoclose: true,
			todayBtn: true,
        	minuteStep: 10
		});

		$('#end_autocancel_calender').datetimepicker({
			format: 'yyyy-mm-dd hh:ii:00',
			autoclose: true,
			todayBtn: true,
        	minuteStep: 10
		});

		$('#start_autofinish_calender').datetimepicker({
			format: 'yyyy-mm-dd hh:ii:00',
			autoclose: true,
			todayBtn: true,
        	minuteStep: 10
		});

		$('#end_autofinish_calender').datetimepicker({
			format: 'yyyy-mm-dd hh:ii:00',
			autoclose: true,
			todayBtn: true,
        	minuteStep: 10
		});
	});
</script>

</body>

</html>