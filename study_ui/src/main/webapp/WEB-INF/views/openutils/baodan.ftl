<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>爆单处理工具</title>

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

            <div class="page-title">
                <div class="title_left">
                    <h3>爆单处理工具</h3>
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>问题单下载<small></small></h2>
                            <div class="clearfix"></div>
                        </div>

                        <div id="baodan-search-div" class="x_content">
                            <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                  action="/openutils/baodan/export" method="post">
                                <div id="baodan-input-div" class="form-group">
                                    <label class="baodan-form-label control-label col-md-3 col-sm-3 col-xs-12">门店id列表 <span class="required">*</span></label>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input id="baodan-form-input" name="poi_id_list" type="text" class="form-control"
                                                   placeholder="逗号分割,最多10个" value=""/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="baodan-start" class="control-label col-md-3 col-sm-3 col-xs-12">start <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="baodan_start_calender" name="start" required="required" class="form-control col-md-7 col-xs-12"
                                               placeholder="yyyy-MM-dd HH:mm:ss" value="${start!}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="baodan-end" class="control-label col-md-3 col-sm-3 col-xs-12">end <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="baodan_end_calender" name="end" required="required" class="form-control col-md-7 col-xs-12"
                                               placeholder="yyyy-MM-dd HH:mm:ss" value="${end!}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="mima" class="control-label col-md-3 col-sm-3 col-xs-12">密码 <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="mima" name="mima" required="required" class="form-control col-md-7 col-xs-12"/>
                                    </div>
                                </div>

                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <button id="baodan-form-button" type="submit" class="btn btn-primary">下载</button>
                                    </div>
                                </div>

                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <#-- 批量取消订单 -->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>批量取消订单<small></small></h2>
                            <div class="clearfix"></div>
                        </div>

                        <div id="cancelorder-div" class="x_content">
                            <form id="cancelorder-form" data-parsley-validate class="form-horizontal form-label-left"
                                  action="/openutils/baodan/cancelbyviews/" method="post">
                                <div class="form-group">
                                    <label class="cancelorder-form-label col-md-3 control-label">订单ViewID列表 <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="cancelorder-form-input-viewids" name="view_id_list" type="text" class="form-control"
                                               placeholder="订单展示ID列表(最多10个),逗号分割" value=""/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="cancelorder-form-label col-md-3 control-label">密码 <span class="required">*</span></label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="cancelorder-form-input-mima" name="mima" type="text" class="form-control"
                                               placeholder="" value=""/>
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <button id="cancelorder-form-button" type="submit" class="btn btn-primary">取消</button>
                                    </div>
                                </div>
                            </form>
                        <#if error??>
                            <div class="alert alert-error alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>运行结果: </strong> ${error!}
                            </div>
                        </#if>
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
//    $(function () {
//        $('#cancelorder-form-button').on("click", function() {
//            var viewIds = $('#cancelorder-form-input-viewids').val();
//            if (!viewIds) {
//                return alert("订单id非法!");
//            }
//
//            var mima = $('#cancelorder-form-input-mima').val();
//            if (!mima) {
//                return alert("密码非法!");
//            }
//
//            _cancelOrderByViewIds(viewIds, mima);
//        });
//
//        function _cancelOrderByViewIds(viewIds, mima) {
//
////            $.ajax({
////                url: "/openutils/baodan/cancelbyviews",
////                data: {
////                    "view_id_list": viewIds,
////                    "mima": mima
////                },
////                type: "json",
////                method: "get",
////                success: function(data){
////                    var _data = $.parseJSON(data);
////                    var msg = _data.result;
////                    if (msg == "failed") {
////                        return alert(_data.data);
////                    }
////
////                    return alert("success");
////                },
////                error: function(err){
////                    console.info(err);
////                    console.info(err.toString());
////                    console.info(err.info);
////                    console.info(err.error());
////                    //alert("js查询订单服务出错!");
////
////                    console.log("请求小组信息出错" + err.msg);
////                    var e = err;
////
////
////                    var  a = "aaa";
////                    alert("js查询订单服务出错!");
////                }
////            });
//        }
//
//    });
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $('#baodan_start_calender').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:00',
            autoclose: true,
            todayBtn: true,
            minuteStep: 10
        });

        $('#baodan_end_calender').datetimepicker({
            format: 'yyyy-mm-dd hh:ii:00',
            autoclose: true,
            todayBtn: true,
            minuteStep: 10
        });
    });
</script>

</body>

</html>