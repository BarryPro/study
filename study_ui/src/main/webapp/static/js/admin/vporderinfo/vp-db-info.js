/**
 * 展示vp db信息
 */

function showVpDbInfo(orderId) {

    $.ajax({
        url: "/query/vporderinfo/querybyid",
        data: {
            "vpOrderId": orderId
        },
        type: "json",
        method: "get",
        success: function(data){
            var _data = $.parseJSON(data);
            var msg = _data.result;
            if (msg == "failed") {
                return alert(_data.data);
            }

            var order = _data.data;
            return showAllDBInfo(order);
        },
        error: function(err){
            return alert("js查询订单服务出错!");
        }
    });
}

/**
 * 判断user_id是否在白名单中
 * @param userID
 */
function isInWhiteList(userID){
    $.ajax({
        url: "/query/vporderinfo/querybycache",
        data: {
            "userId":userID
        },
        type: "json",
        method: "post",
        success: function(data){
            var _data = $.parseJSON(data);
            return alert(_data.data.msg);
        },
        error: function(err){
            return alert("js查询userID服务出错!");
        }
    });
}

/**
 * 通过收件人的电话号码查询最近10条订单
 * @param phoneNo
 */
function showRecipientOrderListInfo(phoneNo) {
    $.ajax({
        url: "/query/vporderinfo/querybyphoneno",
        data: {
            "phoneNo":phoneNo
        },
        type: "json",
        method: "post",
        success: function(data){
            var _data = $.parseJSON(data);
            var msg = _data.result;
            if (msg == "failed") {
                return alert(_data.data);
            }

            if(_data.data.data!=null){
                var orders = _data.data.data.orders;
                return showThreeMonthOrderInfo(orders);
            } else {
                alert("根据收件人手机号查询跑腿订单程序异常，导致查询结果为空")
            }
        },
        error: function(err){
            return alert("js查询订单服务出错!");
        }
    });
}

// FIXME: 提取从数据库中得到的order内容到主ftl中
function showThreeMonthOrderInfo(orderList) {
    var rootDiv = $('#vporderinfo-div');
    _clearAllDbInfo(rootDiv);

    var userOrderInfoDiv = _genOrdersInfoDiv(rootDiv, orderList);
    rootDiv.append(userOrderInfoDiv);
    alert(orders);
}

function _genOrdersInfoDiv(rootDiv, orderList){
    var div = rootDiv.find('#vporderinfo-demo-div').clone();
    div.removeAttr('id');
    div.show();

    if (orderList != null && orderList.length) {
        _fillOrdersTable(div.find("table"), orderList);
    }

    return div;
}

function _fillOrdersTable(table, orderList) {
    var thead = table.find("thead");
    var tbody = table.find("tbody");

    var tr = document.createElement("tr");
    tr.append(_genTh("id"));
    tr.append(_genTh("wm_vp_order_view"));
    tr.append(_genTh("user_id"));
    tr.append(_genTh("order_time"));
    tr.append(_genTh("status"));
    tr.append(_genTh("paystatus"));
    tr.append(_genTh("logistics_status"));
    thead.append(tr);

    orderList.forEach(function (obj, i) {
        var tr = document.createElement("tr");
        tr.append(_genTd(obj["id"]));
        tr.append(_genTd(obj["wm_vp_order_view_id"]));
        tr.append(_genTd(obj["user_id"]));
        tr.append(_genTd(obj["order_time"]));
        tr.append(_genTd(obj["status"]));
        tr.append(_genTd(obj["pay_status"]));
        tr.append(_genTd(obj["logistics_status"]));

        tbody.append(tr);
    });
}

// FIXME: 提取到主ftl中
function showAllDBInfo(order) {
    var rootDiv = $('#vpdbinfo-div');
    _clearAllDbInfo(rootDiv);

    var orderInfoDiv = _genMainOrderInfoDivWithDetail(rootDiv, order);
    rootDiv.find("#vpdbinfo-orderinfo-div").append(orderInfoDiv);

    _getVpDBInfo(order.id, "querystatushisesbyid", function(data, errorTip) {
        var div = _genVpDBInfoDivWithError(rootDiv, "状态历史表", data, errorTip);
        return rootDiv.find("#vpdbinfo-statushises-div").append(div);
    });

    _getVpDBInfo(order.id, "querypayrecordsbyid", function(data, errorTip) {
        var div = _genVpDBInfoDivWithError(rootDiv, "支付记录表", data, errorTip);
        return rootDiv.find("#vpdbinfo-payrecords-div").append(div);
    });

    _getVpDBInfo(order.id, "queryapplyrefundrecordsbyid", function(data, errorTip) {
        var div = _genVpDBInfoDivWithError(rootDiv, "申请退款记录表", data, errorTip);
        return rootDiv.find("#vpdbinfo-applyrefundrecords-div").append(div);
    });

    _getVpDBInfo(order.id, "queryrefundrecordsbyid", function(data, errorTip) {
        var div = _genVpDBInfoDivWithError(rootDiv, "退款记录表", data, errorTip);
        return rootDiv.find("#vpdbinfo-refundrecords-div").append(div);
    });

    _getVpDBInfo(order.id, "queryopremarksbyid", function(data, errorTip) {
        var div = _genVpDBInfoDivWithError(rootDiv, "OpRemark表", data, errorTip);
        return rootDiv.find("#vpdbinfo-opremarks-div").append(div);
    });

    _getVpDBInfo(order.id, "queryorderextrasbyid", function(data, errorTip) {
        var div = _genVpDBInfoDivWithError(rootDiv, "Extra表", data, errorTip);
        return rootDiv.find("#vpdbinfo-orderextra-div").append(div);
    });
}

function _clearAllDbInfo(div) {
    div.find('.vpdbinfo-demo-div').each(function (i, obj) {
        if (obj.style.display != "none")
            obj.remove();
    });

    div.find('.vpdbinfo-alert-demo-div').each(function (i, obj) {
        if (obj.style.display != "none")
            obj.remove();
    });
}

function _genMainOrderInfoDivWithDetail(rootDiv, order) {
    var div = _genMainOrderInfoDiv(rootDiv, order);

    div.find("#main-order-info-detail-btn").on("click", function () {
        var oidDiv = rootDiv.find('#order-info-detail-div');
        if (oidDiv==null || !oidDiv.length) {
            return div.append(_genOrderInfoDetailDiv(rootDiv, order));
        }

        return oidDiv.is(':visible') ?
            oidDiv.hide() : oidDiv.show();
    });

    return div;
}

function _genMainOrderInfoDiv(rootDiv, order) {
    var div = rootDiv.find('#vpdbinfo-demo-div').clone();
    div.removeAttr('id');
    div.show();

    var orderDBWikiUrl = "https://wiki.sankuai.com/pages/viewpage.action?pageId=683024495";
    div.find('.vpdbinfo-h4').append(
        '订单表<small> <a href="${orderDBWikiUrl}">(详细字段含义)</a></small>');

    var table = div.find("table");

    var threadTr = document.createElement("tr");
    threadTr.append(_genTh("id"));
    threadTr.append(_genTh("wm_vp_order_view"));
    threadTr.append(_genTh("user_id"));
    threadTr.append(_genTh("order_time"));
    threadTr.append(_genTh("ctime"));
    threadTr.append(_genTh("utime"));
    threadTr.append(_genTh("status"));
    threadTr.append(_genTh("paystatus"));
    threadTr.append(_genTh("logistics_status"));
    threadTr.append(_genTh("vp_type"));

    var detailBtn = '<button id="main-order-info-detail-btn" type="button" class="btn btn-primary btn-xs">详情</button>';
    threadTr.append(_genTh(detailBtn));

    table.find("thead").append(threadTr);

    var tbodyTr = document.createElement("tr");
    tbodyTr.append(_genTd(order.id));
    tbodyTr.append(_genTd(order.wm_vp_order_view));
    tbodyTr.append(_genTd(order.user_id));
    tbodyTr.append(_genTd(order.order_time));
    tbodyTr.append(_genTd(order.ctime));
    tbodyTr.append(_genTd(order.utime));
    tbodyTr.append(_genTd(order.status));
    tbodyTr.append(_genTd(order.paystatus));
    tbodyTr.append(_genTd(order.logistics_status));
    tbodyTr.append(_genTd(order.vp_type));

    table.find("tbody").append(tbodyTr);

    return div;
}

function _genOrderInfoDetailDiv(rootDiv, order) {
    var div = rootDiv.find('#order-info-detail-demo-div').clone();
    div.attr('id', 'order-info-detail-div');
    div.show();

    div.text(JSON.stringify(order));
    return div;
}

function _genVpDBInfoDivWithError(rootDiv, tableName, data, errorTip) {
    var div = _genVpDBInfoDiv(rootDiv, tableName, data);
    if (errorTip !== null) {
        div.append(_genAlertTipDiv(rootDiv, tableName, errorTip));
    }
    return div;
}

function _getVpDBInfo(orderId, uri, callback) {
    $.ajax({
        url: "/query/vporderinfo/"+uri,
        data: {
            "vpOrderId": orderId
        },
        type: "json",
        method: "get",
        success: function(data){
            var _data = $.parseJSON(data);
            var msg = _data.result;

            if (msg == "failed") {
                var errorMsg = _data.data;
                return callback(null, errorMsg);
            } else {
                return callback(_data.data, null);
            }

        },
        error: function(err){
            return callback(null, 'js查询订单信息出错!');
        }
    });
}

function _genVpDBInfoDiv(rootDiv, tableName, objs) {
    var div = rootDiv.find('#vpdbinfo-demo-div').clone();
    div.removeAttr('id');
    div.show();

    div.find('.vpdbinfo-h4').text(tableName);

    if (objs!=null && objs.length) {
        _fillDBInfoTable(div.find("table"), objs);
    }

    return div;
}

function _genAlertTipDiv(rootDiv, errorMsg) {
    var div = rootDiv.find("#vpdbinfo-alert-demo-div").clone();
    div.show();

    div.find(".vpdbinfo-alert-msg-span").text(errorMsg);

    return div;
}

function _fillDBInfoTable(table, objs) {
    var thead = table.find("thead");
    var tbody = table.find("tbody");

    var tr = document.createElement("tr");
    tr.append(_genTh("id"));
    for(var key in objs[0]) {
        if (key === "id") continue;
        tr.append(_genTh(key));
    }
    thead.append(tr);

    objs.forEach(function(obj, i) {
        var tr = document.createElement("tr");
        tr.append(_genTd(obj["id"]));
        for (var key in obj) {
            if (key === "id") continue;
            tr.append(_genTd(obj[key]));
        }
        tbody.append(tr);
    });
}

function _genTh(orderFieldName) {
    var th = document.createElement("th");
    th.innerHTML = orderFieldName;
    return th;
}

function _genTd(orderFieldValue) {
    var td = document.createElement("td");
    // td.style.cssText = "width:20px;";
    td.innerHTML = orderFieldValue;
    return td;
}