<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>清洗订单推单数据</title>

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
                        <h3>清洗订单推单数据</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>dataview <small>dataview</small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
						<#if error_all??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_all!}
                            </div>
						</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/tools/test/b/seq/allview" method="post">
                                    <div class="form-group">
                                        <label for="from_id" class="control-label col-md-3 col-sm-3 col-xs-12">from_id <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="extras" name="from_id" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="" value="${from_id!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="to_id" class="control-label col-md-3 col-sm-3 col-xs-12">to_id <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="to_id" name="to_id" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="" value="${to_id!}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pass" class="control-label col-md-3 col-sm-3 col-xs-12">pass <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="pass" name="pass" required="required" class="form-control col-md-7 col-xs-12"
                                                   placeholder="" value="${pass!}"/>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
							<#if result_all??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>运行结果: </strong> ${result_all!}
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

</body>

</html>