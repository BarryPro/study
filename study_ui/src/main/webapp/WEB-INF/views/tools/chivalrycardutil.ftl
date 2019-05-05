<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>隐私号骑士卡工具</title>

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
                        <h3>隐私号骑士卡工具</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>隐私号获取骑士卡数据文件
                                    <small style="color: red">注意：当月获取前一个月的数据文件</small>
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
                                      action="/tools/chivalrycard/download" method="post">

                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">获取指定年月
                                            <span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="st_calender" name="st"
                                                   class="form-control col-md-7 col-xs-12" autocomplete="off"
                                                   value="${st!}" placeholder="指定获取文件的年月"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">文件存储位置
                                            <span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="download_path" name="download_path"
                                                   placeholder="文件存储的位置" class="form-control col-md-7 col-xs-12"/>
                                        </div>
                                    </div>

                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">获取骑士卡数据文件</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <#if errorInfo??>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <h2>${errorInfo}</h2>
                        </div>
                    </div>
                </div>
                </#if>
            <#if fileList??>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>已经下载的文件</h2>
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
                                <div style="margin-bottom: 20px;width: auto" id="openInfo">
                                    <table align="center" class="table table-striped privacyphone-cfg-table">
                                        <tr>
                                            <th colspan="8" align="center">文件名列表</th>
                                        </tr>
                                        <#list fileList as file>
                                            <tr class="hs">
                                                <th>${file}</th>
                                            </tr>
                                        </#list>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </#if>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>隐私号上报骑士卡数据文件
                                    <small style="color: red">注意：可以上传文件或者上传文件夹</small>
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
                                      action="/tools/chivalrycard/report" method="post"
                                      enctype="multipart/form-data">

                                    <div class="form-group">
                                        <label for="st" class="control-label col-md-3 col-sm-3 col-xs-12">上传文件的日期<span
                                                    class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="ed_calender" name="ed" required="required" autocomplete="off"
                                                   class="form-control col-md-7 col-xs-12" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">文件上传
                                            <span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="file" id="dir_data" name="dir_data" required="required"
                                                   class="form-control col-md-7 col-xs-12"/>
                                        </div>
                                    </div>

                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">上报数据</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <#if msg??>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <h2>${msg}</h2>
                        </div>
                    </div>
                </div>
                </#if>

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
<script type="text/javascript">
    $(function () {
        $('#st_calender').datetimepicker({
            format: 'yyyymm',
            autoclose: true,
            todayBtn: true,
            minView: "month",
            minuteStep: 10
        });
    });

    $(function () {
        $('#ed_calender').datetimepicker({
            format: 'yyyymm',
            autoclose: true,
            todayBtn: true,
            minView: "month",
            minuteStep: 10
        });
    });
</script>


</html>