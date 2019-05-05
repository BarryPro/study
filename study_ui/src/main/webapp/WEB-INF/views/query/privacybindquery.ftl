<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>隐私号运营后台</title>

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
                        <h3>隐私号运营后台</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>绑定关系查询</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <br/>
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left">
                                    <div class="form-group">
                                        <label for="st" class="control-label col-md-3 col-sm-3 col-xs-12">订单展示号 <span
                                                class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="order_view_id" name="order_view_id"
                                                   class="form-control col-md-7 col-xs-12" value="${orderViewId!}"
                                                   placeholder="请输入订单展示号"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">查询号码</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="phone_number" name="phone_number" value="${phoneNumber!}"
                                                   class="form-control col-md-7 col-xs-12"
                                                   placeholder="请输入主叫、被叫或虚拟号码"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">开始时间</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="st_calender" name="st_calender"
                                                   class="form-control col-md-7 col-xs-12" autocomplete="off"
                                                   value="${start!}" placeholder="开始时间"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">结束时间</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="ed_calender" name="ed_calender"
                                                   class="form-control col-md-7 col-xs-12" autocomplete="off"
                                                   value="${end!}" placeholder="结束时间"/>
                                            <br>
                                            <small style="color: red">注意:若不输入时间，则默认查询<b>${defaultTime!}天</b>日志</small>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button id="bind_query" type="button" class="btn btn-primary">绑定查询</button>
                                        </div>
                                    </div>
                                </form>
                                <div id="displayBind" style="display: none">
                                    <div class="x_panel" style="overflow: scroll;display: none" id="orderSuccess">
                                    <div class="x_title">
                                        <h2>订单信息</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content" id="privacyphone-order-show-div">
                                        <table class="table table-orderById" id="privacyphone-order-table">
                                            <thead>
                                            <tr>
                                                <th>订单时间</th>
                                                <th>订单展示ID</th>
                                                <th>骑手姓名</th>
                                                <th>骑手手机号</th>
                                                <th>所在城市</th>
                                                <th>用户姓名</th>
                                                <th>用户手机号</th>
                                                <th>是否开启隐私号</th>
                                                <th>商家手机号</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                    <div class="x_panel" style="overflow: scroll;display: none" id="orderFailed">
                                    <div class="x_title">
                                        <h2>订单信息</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                        </ul>
                                        <div class="clearfix"></div>
                                        <div class="x_content"><br><span>查询数据为空</span></div>
                                    </div>
                                </div>
                                    <div class="x_panel" style="overflow: scroll;display: none" id="bindInfoSuccess">
                                    <div class="x_title">
                                        <h2>绑定信息</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content" id="privacyphone-bind-show-div">
                                        <table class="table table-orderById" id="privacyphone-bind-table">
                                            <thead>
                                            <tr>
                                                <th>绑定时间</th>
                                                <th>操作类型</th>
                                                <th>号码A</th>
                                                <th>号码X</th>
                                                <th>号码B</th>
                                                <th>绑定状态</th>
                                                <th>订单展示号</th>
                                            </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                </div>
                                    <div class="x_panel" style="overflow: scroll;display: none" id="bindInfoFailed">
                                    <div class="x_title">
                                        <h2>绑定信息</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                        </ul>
                                        <div class="clearfix"></div>
                                        <div class="x_content"><br><span>查询数据为空</span></div>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>话单查询</h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <br/>
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/query/privacyoperation/ticketquery" method="post">
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">查询号码
                                            <span class="required">*</span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="phone_number_bill" name="phone_number_bill"
                                                   class="form-control col-md-7 col-xs-12" value="${t_phoneNumber!}"
                                                   placeholder="请输入主叫、被叫或虚拟号码"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">开始时间</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="st_calender_bill" name="st_calender_bill"
                                                   class="form-control col-md-7 col-xs-12" autocomplete="off"
                                                   value="${t_start!}" placeholder="开始时间"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="start_autocancel" class="control-label col-md-3 col-sm-3 col-xs-12">结束时间</label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="ed_calender_bill" name="ed_calender_bill"
                                                   class="form-control col-md-7 col-xs-12" autocomplete="off"
                                                   value="${t_end!}" placeholder="结束时间"/>
                                            <br>
                                            <small style="color: red">注意:若不输入时间，则默认查询<b>${defaultTime!}天</b>日志</small>
                                        </div>
                                    </div>
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button id="bill_query" type="button" class="btn btn-primary">话单查询</button>
                                        </div>
                                    </div>
                                </form>
                                <div id="displayCall" style="display: none">
                                    <div class="x_panel" style="overflow: scroll;display: none" id="billSuccess">
                                        <div class="x_title">
                                            <h2>话单信息</h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content" id="privacyphone-bill-show-div">
                                            <table class="table table-orderById" id="privacyphone-bill-table">
                                                <thead>
                                                <tr>
                                                    <th>序号</th>
                                                    <th>日志时间</th>
                                                    <th>真实主叫</th>
                                                    <th>虚拟号码</th>
                                                    <th>真实被叫</th>
                                                    <th>呼叫结果</th>
                                                    <th>振铃时长(秒)</th>
                                                    <th>通话时长(秒)</th>
                                                    <th>通话录音</th>
                                                    <th>供应商</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="x_panel" style="overflow: scroll;display: none" id="billFailed">
                                        <div class="x_title">
                                            <h2>话单信息</h2>
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                            </ul>
                                            <div class="clearfix"></div>
                                            <div class="x_content"><br><span>查询数据为空</span></div>
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

    <script type="text/javascript">
        $(document).ready(function () {
            $('#bind_query').click(function(){
                $.ajax({
                    url:"/query/privacyoperation/bindquery",
                    data: {
                        order_view_id: $('#order_view_id').val(),
                        phone_number: $('#phone_number').val(),
                        st_calender: $('#st_calender').val(),
                        ed_calender: $('#ed_calender').val()
                    },
                    type:"json",
                    method:"post",
                    success:function(json){
                        showBindTable(json);
                    }
                });
            });

            $('#bill_query').click(function(){
                $.ajax({
                    url:"/query/privacyoperation/ticketquery",
                    data: {
                        phone_number_bill: $('#phone_number_bill').val(),
                        st_calender_bill: $('#st_calender_bill').val(),
                        ed_calender_bill: $('#ed_calender_bill').val()
                    },
                    type:"json",
                    method:"post",
                    success:function(json){
                        showBillTable(json);
                    }
                });
            });

            // 展示隐私号绑定信息
            function showBindTable(json) {
                var _data = $.parseJSON(json);
                var msg = _data.result;
                if (msg == "failed") {
                    return alert(_data.data);
                }

                var bindResult = _data.data;
                if (!bindResult) {
                    return;
                }
                if(bindResult.displayBind == "1"){
                    $('#displayBind').show();
                    if(bindResult.orderResult != null) {
                        $('#orderSuccess').show();
                        $('#orderFailed').hide();
                        var showOrderTableDiv = $('#privacyphone-order-show-div');
                        var table = showOrderTableDiv.find('#privacyphone-order-table');
                        _fillPrivacyOrderTable(table,bindResult.orderResult);
                        showOrderTableDiv.html(table);
                    } else {
                        $('#orderFailed').show();
                        $('#orderSuccess').hide();
                    }
                    if(typeof(bindResult.bindInfoVoMap) != "undefined") {
                        $('#bindInfoSuccess').show();
                        $('#bindInfoFailed').hide();
                        var showBindTableDiv = $('#privacyphone-bind-show-div');
                        var table = showBindTableDiv.find('#privacyphone-bind-table');
                        _fillPrivacyBindTable(table,bindResult.bindInfoVoMap);
                        showBindTableDiv.html(table);
                    } else {
                        $('#bindInfoFailed').show();
                        $('#bindInfoSuccess').hide();
                    }
                }
            }

            // 展示隐私号话单信息
            function showBillTable(json) {
                var _data = $.parseJSON(json);
                var msg = _data.result;
                if (msg == "failed") {
                    return alert(_data.data);
                }

                var callResult = _data.data;
                if (!callResult) {
                    return;
                }
                if(callResult.displayCall == "1"){
                    $('#displayCall').show();
                    if(typeof(callResult.callBillVoMap) != "undefined") {
                        $('#billSuccess').show();
                        $('#billFailed').hide();
                        var showBillTableDiv = $('#privacyphone-bill-show-div');
                        var table = showBillTableDiv.find('#privacyphone-bill-table');
                        _fillPrivacyBillTable(table,callResult.callBillVoMap);
                        showBillTableDiv.html(table);
                    } else {
                        $('#billFailed').show();
                        $('#billSuccess').hide();
                    }
                }
            }

            function _fillPrivacyBillTable(table, callMap) {
                var tbody = table.find("tbody");
                tbody.empty();
                var index = 0;
                $.each(callMap,function (key, val) {
                    var tr = document.createElement("tr");
                    tr.append(_genTd(++index));
                    tr.append(_genTd(callMap[key].log_time));
                    tr.append(_genTd(callMap[key].real_calling));
                    tr.append(_genTd(callMap[key].tel_x));
                    tr.append(_genTd(callMap[key].real_called));
                    tr.append(_genTd(callMap[key].call_result));
                    tr.append(_genTd(callMap[key].alert_duration));
                    tr.append(_genTd(callMap[key].call_duration));
                    if(callMap[key].mp3_url != null){
                        tr.append(_genUrlTd(callMap[key].mp3_url));
                    } else {
                        tr.append(_genTd("无录音"));
                    }
                    tr.append(_genTd(callMap[key].supplier));
                    tbody.append(tr);
                });
            }

            function _fillPrivacyBindTable(table, bindMap) {
                var tbody = table.find("tbody");
                tbody.empty();
                $.each(bindMap,function (key, val) {
                    var tr = document.createElement("tr");
                    tr.append(_genTd(bindMap[key].bind_time));
                    tr.append(_genTd(bindMap[key].opt_type));
                    if(bindMap[key].match_flag == null){
                        tr.append(_genTd(bindMap[key].phone_A));
                        tr.append(_genTd(bindMap[key].phone_X));
                        tr.append(_genTd(bindMap[key].phone_B));
                    } else {
                        if(bindMap[key].match_flag == "A"){
                            tr.append(_genColorTd(bindMap[key].phone_A));
                        } else {
                            tr.append(_genTd(bindMap[key].phone_A));
                        }
                        tr.append(_genTd(bindMap[key].phone_X));
                        if(bindMap[key].match_flag == "B"){
                            tr.append(_genColorTd(bindMap[key].phone_B));
                        } else {
                            tr.append(_genTd(bindMap[key].phone_B));
                        }
                    }
                    tr.append(_genTd(bindMap[key].bind_status));
                    tr.append(_genTd(bindMap[key].order_view_id));
                    tbody.append(tr);
                });
            }


            function _fillPrivacyOrderTable(table, orderResult) {
                var tbody = table.find("tbody");
                tbody.empty();
                var tr = document.createElement("tr");
                tr.append(_genTd(orderResult.order_time));
                tr.append(_genTd(orderResult.order_view_id));
                tr.append(_genTd(orderResult.courier_name));
                tr.append(_genTd(orderResult.courier_phone));
                tr.append(_genTd(orderResult.city_name));
                tr.append(_genTd(orderResult.recipient_name));
                tr.append(_genTd(orderResult.recipient_phone));
                tr.append(_genTd(orderResult.is_open_privacy_number));
                tr.append(_genTd(orderResult.merchant_phone));
                tbody.append(tr);
            }


            // 添加表单列
            function _genTd(value) {
                var td = document.createElement("td");
                td.innerHTML = value;
                return td;
            }

            // 处理带颜色的列
            function _genColorTd(value) {
                var td = document.createElement("td");
                var b = document.createElement("b");
                b.innerHTML = value;
                b.style.backgroundColor = "yellow";
                td.appendChild(b);
                return td;
            }

            // 生成录音链接
            function _genUrlTd(value) {
                var td = document.createElement("td");
                var a = document.createElement("a");
                a.innerHTML = "录音链接";
                a.href = value;
                td.appendChild(a)
                return td;
            }

            $('#st_calender').datetimepicker({
                format: 'yyyy-mm-dd 00:00:00',
                autoclose: true,
                todayBtn: true,
                minView: "month",
                minuteStep: 10
            });

            $('#ed_calender').datetimepicker({
                format: 'yyyy-mm-dd 23:59:59',
                autoclose: true,
                todayBtn: true,
                minView: "month",
                minuteStep: 10
            });

            $('#st_calender_bill').datetimepicker({
                format: 'yyyy-mm-dd 00:00:00',
                autoclose: true,
                todayBtn: true,
                minView: "month",
                minuteStep: 10
            });

            $('#ed_calender_bill').datetimepicker({
                format: 'yyyy-mm-dd 23:59:59',
                autoclose: true,
                todayBtn: true,
                minView: "month",
                minuteStep: 10
            });
        });
    </script>

</body>

</html>