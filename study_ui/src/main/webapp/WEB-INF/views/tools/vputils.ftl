<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>虚拟商品工具</title>

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
                    <h3>工具汇总</h3>
                </div>
            </div>
            <div class="clearfix"></div>

            <#-- vp支付回调mock -->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>支付回调mock<small></small></h2>
                            <div class="clearfix"></div>
                        </div>

                        <div id="vppaynotifymock-search-div" class="x_content">
                            <form id="vppaynotifymock-form" data-parsley-validate class="form-horizontal form-label-left">
                                <div id="vppaynotifymock-input-div" class="form-group">
                                    <label class="vppaynotifymock-form-label col-md-3 control-label">订单ViewID <span class="required">*</span></label>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input id="vppaynotifymock-form-input" type="text" class="form-control"
                                                   placeholder="订单展示ID" value=""/>
                                            <span class="input-group-btn">
                                            <button id="vppaynotifymock-form-button" type="button" class="btn btn-primary">查询</button>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <#-- vp退款回调mock -->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>退款回调mock<small></small></h2>
                            <div class="clearfix"></div>
                        </div>

                        <div id="vprefundnotifymock-search-div" class="x_content">
                            <form id="vprefundnotifymock-form" data-parsley-validate class="form-horizontal form-label-left">
                                <div id="vprefundnotifymock-input-div" class="form-group">
                                    <label class="vprefundnotifymock-form-label col-md-3 control-label">订单ViewID <span class="required">*</span></label>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input id="vprefundnotifymock-form-input-viewid" type="text" class="form-control"
                                                   placeholder="订单展示ID" value=""/>
                                            <input id="vprefundnotifymock-form-input-refundid" type="text" class="form-control"
                                                   placeholder="退款ID" value=""/>
                                            <span class="input-group-btn">
                                            <button id="vprefundnotifymock-form-button" type="button" class="btn btn-primary">查询</button>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
    $(function () {

        $('#vppaynotifymock-form-button').on("click", function() {
            var viewId = $('#vppaynotifymock-form-input').val();
            if (!viewId || viewId.length>50) {
                return alert("订单id非法!");
            }

            _mockVpPayNotify(viewId);
        });

        function _mockVpPayNotify(viewId) {

            $.ajax({
                url: "/tools/vputils/mockpaynotify",
                data: {
                    "vpOrderViewId": viewId
                },
                type: "json",
                method: "get",
                success: function(data){
                    var _data = $.parseJSON(data);
                    var msg = _data.result;
                    if (msg == "failed") {
                        return alert(_data.data);
                    }

                    return alert("success");
                },
                error: function(err){
                    return alert("js查询订单服务出错!");
                }
            });
        }

        $('#vprefundnotifymock-form-button').on("click", function() {
            var viewId = $('#vprefundnotifymock-form-input-viewid').val();
            if (!viewId || viewId.length>50) {
                return alert("订单id非法!");
            }

            var refundId = $('#vprefundnotifymock-form-input-refundid').val();
            if (!refundId || refundId.length>50) {
                return alert("退款id非法!");
            }

            _mockVpRefundNotify(viewId, refundId);
        });

        function _mockVpRefundNotify(viewId, refundId) {

            $.ajax({
                url: "/tools/vputils/mockrefundnotify",
                data: {
                    "vpOrderViewId": viewId,
                    "refundId": refundId
                },
                type: "json",
                method: "get",
                success: function(data){
                    var _data = $.parseJSON(data);
                    var msg = _data.result;
                    if (msg == "failed") {
                        return alert(_data.data);
                    }

                    return alert("success");
                },
                error: function(err){
                    return alert("js查询订单服务出错!");
                }
            });
        }

    });
</script>

</body>

</html>