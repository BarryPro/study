<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>虚拟商品订单查询</title>

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
                    <h3>订单信息查询</h3>
                </div>
            </div>
            <div class="clearfix"></div>

        <#-- vp订单信息 -->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>根据id查询<small></small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>

                        <div id="vpdbinfo-search-div" class="x_content">
                            <form id="orderid-form" data-parsley-validate class="form-horizontal form-label-left">
                                <div id="orderid-str-input-div" class="form-group">
                                    <label class="orderid-form-label col-md-3 control-label">订单ID <span class="required">*</span></label>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input id="orderid-form-input" type="text" class="form-control"
                                                   placeholder="展示/非展示ID" value="${orderId!}"/>
                                            <span class="input-group-btn">
                                            <button id="orderid-form-button" type="button" class="btn btn-primary">查询</button>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div id="vpdbinfo-result-div" class="x_panel" style="overflow: scroll; display: none" >
                            <div id="vpdbinfo-div" class="x_content">
                            <#-- errorTip -->
                                <div id="vpdbinfo-alert-demo-div" class="vpdbinfo-demo-div alert alert-danger alert-dismissible fade in" role="alert" style="display: none">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">x</span></button>
                                    <strong>获取数据异常: </strong> <span class="vpdbinfo-alert-msg-span"></span>
                                </div>

                                <div id="vpdbinfo-demo-div" class="vpdbinfo-demo-div" style="display: none">
                                    <h4 class="vpdbinfo-h4" style="color:green;" align="center"></h4>
                                    <table class="vpdbinfo-table table table-striped" >
                                        <thead></thead>
                                        <tbody style="table-layout: fixed;"></tbody>
                                    </table>
                                </div>

                                <div id="order-info-detail-demo-div" class="vpdbinfo-demo-div" style="display: none; word-wrap: break-word">
                                </div>

                                <div id="vpdbinfo-orderinfo-div"></div>

                                <div id="vpdbinfo-statushises-div"></div>
                                <div id="vpdbinfo-payrecords-div"></div>
                                <div id="vpdbinfo-applyrefundrecords-div"></div>
                                <div id="vpdbinfo-refundrecords-div"></div>
                                <div id="vpdbinfo-opremarks-div"></div>
                                <div id="vpdbinfo-orderextra-div"></div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <#-- vp用户最近下单信息 -->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>根据userId查询<small></small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>

                        <div id="vpuserinfo-search-div" class="x_content">
                            <form id="userid-form" data-parsley-validate class="form-horizontal form-label-left">
                                <div id="userid-str-input-div" class="form-group">
                                    <label class="userid-form-label col-md-3 control-label">UserID <span class="required">*</span></label>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input id="userid-form-input" type="text" class="form-control"
                                                   placeholder="用户ID" value="${userId!}"/>
                                            <select id="userid-form-select" class="form-control col-md-9 col-sm-9 col-xs-12" >
                                                <option value="60">跑腿</option>
                                                <option value="61">跑腿小费</option>
                                                <option value="1">会员卡</option>
                                                <option value="50">骑手打赏</option>
                                            </select>
                                            <span class="input-group-btn">
                                            <button id="userid-form-button" type="button" class="btn btn-primary">查询</button>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div id="vpuserinfo-result-div" class="x_panel" style="overflow: scroll; display: none" >
                            <div id="vpuserinfo-div" class="x_content">
                            <#-- errorTip -->
                                <div id="vpuserinfo-alert-demo-div" class="vpuserinfo-demo-div alert alert-danger alert-dismissible fade in" role="alert" style="display: none">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">x</span></button>
                                    <strong>获取数据异常: </strong> <span class="vpuserinfo-alert-msg-span"></span>
                                </div>

                                <div id="vpuserinfo-demo-div" class="vpuserinfo-demo-div" style="display: none">
                                <#--<h4 class="vpuserinfo-h4" style="color:green;" align="center"></h4>-->
                                    <table class="vpuserinfo-table table table-striped" >
                                        <thead></thead>
                                        <tbody style="table-layout: fixed;"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <#-- vp判断是否在白名单 -->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>根据user_id查询用户是否在白名单中
                                <small></small>
                            </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div id="vpdbinfo-search-div" class="x_content">
                            <form id="orderid-form" data-parsley-validate class="form-horizontal form-label-left">
                                <div id="orderid-str-input-div" class="form-group">
                                    <label class="orderid-form-label col-md-3 control-label">User_ID <span
                                            class="required">*</span></label>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input id="userid-writelist-form-input" type="text" class="form-control"
                                                   placeholder="用户ID" value="${userId!}"/>
                                            <span class="input-group-btn">
                                            <button id="userid-writelist-form-button" type="button"
                                                    class="btn btn-primary">查询</button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <#-- vp根据收件人电话号码查询最近10条跑腿订单信息-->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>根据收件人电话号码查询跑腿订单信息<small></small></h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>

                        <div id="vporderinfo-search-div" class="x_content">
                            <form id="orderid-form" data-parsley-validate class="form-horizontal form-label-left">
                                <div id="phoneno-str-input-div" class="form-group">
                                    <label class="orderid-form-label col-md-3 control-label">PhoneNo <span class="required">*</span></label>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input id="phoneno-form-input" type="text" class="form-control"
                                                   placeholder="收件人电话号码" value="${phoneNo!}"/>
                                            <span class="input-group-btn">
                                            <button id="phoneno-form-button" type="button" class="btn btn-primary">查询</button>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div id="vporderinfo-result-div" class="x_panel" style="overflow: scroll; display: none" >
                            <div id="vporderinfo-div" class="x_content">
                            <#-- errorTip -->
                                <div id="vporderinfo-alert-demo-div" class="vpuserinfo-demo-div alert alert-danger alert-dismissible fade in" role="alert" style="display: none">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">x</span></button>
                                    <strong>获取数据异常: </strong> <span class="vpuserinfo-alert-msg-span"></span>
                                </div>

                                <div id="vporderinfo-demo-div" class="vpuserinfo-demo-div" style="display: none">
                                <#--<h4 class="vpuserinfo-h4" style="color:green;" align="center"></h4>-->
                                    <table class="vporderinfo-table table table-striped" >
                                        <thead></thead>
                                        <tbody style="table-layout: fixed;"></tbody>
                                    </table>
                                </div>
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

<#-- self define -->
<script src="/static/js/admin/vporderinfo/vp-db-info.js"></script>
<script src="/static/js/admin/vporderinfo/vp-user-info.js"></script>

<script type="text/javascript">
    $(function () {

        $('#orderid-form-button').on("click", function() {
            var orderId = $('#orderid-form-input').val();
            if (!orderId || orderId.length>50) {
                return alert("订单id非法!");
            }

            $('#vpdbinfo-result-div').show();

            showVpDbInfo(orderId);
        });

        $('#userid-form-button').on("click", function() {
            var userId = $('#userid-form-input').val();
            var vpType = $('#userid-form-select').val();
            if (!userId || userId.length>50) {
                return alert("userId非法!");
            }
            if (!vpType) {
                return alert("vp类型非法!");
            }

            $('#vpuserinfo-result-div').show();

            showUserOrderListInfo(userId, vpType);
        });

        $('#userid-writelist-form-button').on("click", function () {
            var userID = $('#userid-writelist-form-input').val();
            if (!userID || userID.length > 50) {
                return alert("user_id非法!");
            }

            isInWhiteList(userID);
        });

        $('#phoneno-form-button').on("click", function() {
            var phoneNo = $('#phoneno-form-input').val();
            if (!phoneNo || phoneNo.length>50) {
                return alert("phoneNo非法!");
            }

            $('#vporderinfo-result-div').show();

            showRecipientOrderListInfo(phoneNo);
        });

    });
</script>

</body>

</html>