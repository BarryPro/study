/**
 * order trace tree view
 */

function drawTraceTree(chain) {
    var treeViewDiv = $('#order-trace-tree-view-div').clone();
    treeViewDiv.removeAttr('id');
    treeViewDiv.show();

    // chain title
    treeViewDiv.find(".order-trace-chain-title").text(chain.name);

    // table
    var table = treeViewDiv.find(".chain-base-info-table");
    table.find(".order_token").text(chain.baseInfo.order_token);
    table.find(".appkey").text(chain.baseInfo.appkey);
    table.find(".phone").text(chain.baseInfo.phone);
    table.find(".user_id").text(chain.baseInfo.user_id);
    table.find(".poi_id").text(chain.baseInfo.poi_id);
    table.find(".uuid").text(chain.baseInfo.uuid);

    chain.nodes.forEach(function(node, i) {
        var nodeLi = treeViewDiv.find('#node-li').clone();
        nodeLi.removeAttr('id');
        nodeLi.show();

        nodeLi.find('.node-name').text(node.name);
        nodeLi.find('.node-base-info').text(jsonFormat(node.baseInfo));
        nodeLi.find('.node-plus').on("click", function() {
            onOffTraceUl(nodeLi)
        });

        var traceUl = nodeLi.find('.trace-ul');
        node.traces.forEach(function(trace, i) {
            var traceLi = traceUl.find('#trace-li').clone();
            traceLi.removeAttr('id');
            traceLi.show();

            if (!trace.success) {
                nodeLi.find('.node-li-a').css("background-color", "#F3625E");

                traceLi.find('.trace-li-a').css("background-color", "#F3625E");
                traceLi.find('.trace-error-msg').show();
                traceLi.find('.trace-error-msg').text(trace.errorMsg);
            }

            traceLi.find('.trace-name').text(trace.name);
            traceLi.find('.trace-base-info').text(jsonFormat(trace.baseInfo));
            traceLi.find('.trace-plus').on("click", function() {
                onOffFlowData(traceLi)
            });

            var flowDataUl = traceLi.find('.flow-data-ul');
            flowDataUl.find(".in-data-json").text(jsonFormat(trace.dataFlow.inData));
            flowDataUl.find(".out-data-json").text(jsonFormat(trace.dataFlow.outData));

            traceUl.append(traceLi);
        });
        traceUl.find('#trace-li').remove(); // need

        treeViewDiv.find('.order-trace-ul').append(nodeLi);
    });
    treeViewDiv.find('#node-li').remove(); // need

    return treeViewDiv;
}

function onOffTraceUl(li) {
    var tag = li.find('.node-plus-tag').text();
    if (tag == "+") {
        li.find('.node-plus-tag').text("-");
        li.find('.trace-ul').show();
    } else if (tag == "-") {
        li.find('.node-plus-tag').text("+");
        li.find('.trace-ul').hide();
    } else {
        alert("onOffTraceUl error!");
    }
}

function onOffFlowData(li) {
    var tag = li.find('.trace-plus-tag').text();
    if (tag == "+") {
        li.find('.trace-plus-tag').text("-");
        li.find('.flow-data-ul').show();
    } else if (tag == "-") {
        li.find('.trace-plus-tag').text("+");
        li.find('.flow-data-ul').hide();
    } else {
        alert("onOffTraceLi error!");
    }
}

function jsonFormat(json) {
    var obj = json;
    try {
        if (typeof obj === 'string') {
            obj = JSON.parse(json);
        }
        return JSON.stringify(obj, null, 1);
    } catch (e) {
        return json;
    }
}
