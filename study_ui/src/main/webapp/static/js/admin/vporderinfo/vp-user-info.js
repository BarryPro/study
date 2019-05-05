/**
 * 展示vp user-orders信息
 */
function showUserOrderListInfo(userId, vpType) {
    $.ajax({
        url: "/query/vporderinfo/querybyuserid",
        data: {
            "userId": userId,
            "vpType": vpType
        },
        type: "json",
        method: "get",
        success: function(data){
            var _data = $.parseJSON(data);
            var msg = _data.result;
            if (msg == "failed") {
                return alert(_data.data);
            }

            var orderList = _data.data;
            return _showOrderListInfo(orderList);
        },
        error: function(err){
            return alert("js查询订单服务出错!");
        }
    });
}


function _showOrderListInfo(orderList) {
    var rootDiv = $('#vpuserinfo-div');
    _clearAllUserInfo(rootDiv);

    var userOrderInfoDiv = _genOrderListInfoDiv(rootDiv, orderList);
    rootDiv.append(userOrderInfoDiv);
}

function _clearAllUserInfo(rootDiv) {
    rootDiv.find('.vpuserinfo-demo-div').each(function (i, obj) {
        if (obj.style.display != "none")
            obj.remove();
    });

    rootDiv.find('.vpuserinfo-alert-demo-div').each(function (i, obj) {
        if (obj.style.display != "none")
            obj.remove();
    });
}

function _genOrderListInfoDiv(rootDiv, orderList) {
    var div = rootDiv.find('#vpuserinfo-demo-div').clone();
    div.removeAttr('id');
    div.show();

    if (orderList != null && orderList.length) {
        _fillOrderListTable(div.find("table"), orderList);
    }

    return div;
}

function _fillOrderListTable(table, orderList) {
    var thead = table.find("thead");
    var tbody = table.find("tbody");

    var tr = document.createElement("tr");
    tr.append(_genTh("id"));
    tr.append(_genTh("wm_vp_order_view"));
    tr.append(_genTh("user_id"));
    tr.append(_genTh("order_time"));
    tr.append(_genTh("ctime"));
    tr.append(_genTh("utime"));
    tr.append(_genTh("status"));
    tr.append(_genTh("paystatus"));
    tr.append(_genTh("logistics_status"));
    tr.append(_genTh("vp_type"));
    thead.append(tr);

    orderList.forEach(function (obj, i) {
        var tr = document.createElement("tr");
        tr.append(_genTd(obj["id"]));
        tr.append(_genTd(obj["wm_vp_order_view"]));
        tr.append(_genTd(obj["user_id"]));
        tr.append(_genTd(obj["order_time"]));
        tr.append(_genTd(obj["ctime"]));
        tr.append(_genTd(obj["utime"]));
        tr.append(_genTd(obj["status"]));
        tr.append(_genTd(obj["paystatus"]));
        tr.append(_genTd(obj["logistics_status"]));
        tr.append(_genTd(obj["vp_type"]));

        tbody.append(tr);
    });
}