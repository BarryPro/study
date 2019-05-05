<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>洗数据</title>

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
                        <h3>洗数据</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>清洗"正大"OR"楚风鸡翅"的订单 <small>ZH</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
							<#if error_zdview??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_zdview!}
                            </div>
							</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/tools/hide/tyfx/zdview" method="post">
                                    <div class="form-group">
                                        <label for="password" class="control-label col-md-3 col-sm-3 col-xs-12">password <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="password" id="password" name="password" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="" value="${password!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
							<#if result_zdview??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result_zdview!}
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
                                <h2>将删除的订单还原 <small>将删除的订单还原</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
						<#if error_recoverview??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_recoverview!}
                            </div>
						</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form-A" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/tools/hide/tyfx/recoverview" method="post">
                                    <div class="form-group">
                                        <label for="password" class="control-label col-md-3 col-sm-3 col-xs-12">password <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="password" id="password" name="password" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="" value="${password!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="id" class="control-label col-md-3 col-sm-3 col-xs-12">id <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="id" name="id" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="id" value="${id!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="visible" class="control-label col-md-3 col-sm-3 col-xs-12">visible <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="visible" name="visible" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="visible" value="${visible!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="valid" class="control-label col-md-3 col-sm-3 col-xs-12">valid <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="valid" name="valid" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="valid" value="${valid!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
							<#if result_recoverview??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result_recoverview!}
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

</body>

</html>