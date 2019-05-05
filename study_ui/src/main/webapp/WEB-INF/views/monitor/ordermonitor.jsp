<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    .order-monitor-container {
        position: relative;
        float: left;
        margin: 2px 2px 2px 2px;
        padding: 0;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
        border: 1px solid #eee;
        width: 49%;
        height: 650px;
        padding: 10px 0;
    }
    .order-monitor-container.lg {
        width: 100%;
    }
    .select2-container.select2-allowclear .select2-choice abbr {
        display: none !important;
    }
    @media all and (orientation : landscape) {  
        .order-monitor-container {   
            width: 49%;
        }  
    }  
  
    @media all and (orientation : portrait){  
        .order-monitor-container {  
            width: 100%;
        }  
    }  
</style>
<div>
    <label>数据时间段:
        <select id="J-select-time">
            <option value="3" <c:if test="${lastTime == 3}">selected="selected"</c:if> >3小时</option>
            <option value="6" <c:if test="${lastTime == 6}">selected="selected"</c:if> >6小时</option>
            <option value="24" <c:if test="${lastTime == 24}">selected="selected"</c:if> >1天 </option>
            <option value="48" <c:if test="${lastTime == 48}">selected="selected"</c:if> >2天 </option>
            <option value="72" <c:if test="${lastTime == 72}">selected="selected"</c:if> >3天 </option>
            <option value="96" <c:if test="${lastTime == 96}">selected="selected"</c:if> >4天 </option>
            <option value="120" <c:if test="${lastTime == 120}">selected="selected"</c:if> >5天 </option>
            <option value="144" <c:if test="${lastTime == 144}">selected="selected"</c:if> >6天 </option>
            <option value="168" <c:if test="${lastTime == 168}">selected="selected"</c:if> >7天 </option>
        </select>
    </label>
</div>

<div id="container1" class="order-monitor-container"></div>
<div id="container2" class="order-monitor-container" ></div>
<div id="container3" class="order-monitor-container" ></div>
<div id="container4" class="order-monitor-container" ></div>
<div id="container5" class="order-monitor-container" ></div>
<div id="container6" class="order-monitor-container" ></div>
<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/admin/echarts-all.js"></script>
<script>
$(document).ready(function () {
    var lastTime = ${lastTime};

    var jQc1 = $('#container1'),
        jQc2 = $('#container2'),
        jQc3 = $('#container3'),
        jQc4 = $('#container4'),
        jQc5 = $('#container5'),
        jQc6 = $('#container6'),
        chartC1,
        chartC2,
        chartC3,
        chartC4,
        chartC5,
        chartC6,
        chartData = getInitChartData(),
        updateTimer;
    
    var getData = function() {
        $.get('/admin/orderadmin/monitor/kpi/lastTime?lastTime=' + lastTime, function(res) {
            if (!!res.error) {
                alert("获取数据失败");
                chartData = getInitChartData();
            } else {
                var data = JSON.parse(res);
                chartData.date = data.date;
                chartData.submit = data.submit;
                chartData.push = data.push;
                chartData.confirm = data.confirm;
                chartData.cancel_reason = data.cancel_reason;
                chartData.cancel = data.cancel;
                chartData.cancel_op_type = data.cancel_op_type;
                !!updateTimer && clearInterval(updateTimer);
                updateTimer = setInterval(addData, 60000);
            }
            destroyCharts();
            setchartsWrap();
        });
    };

    function getInitChartData() {
        return {
            date: [],
            submit: [],
            push: [],
            confirm: [],
            cancel_reason:[],
            cancel: [],
            cancel_op_type:[]
        };
    };

    var addData = function() {
        $.get('/admin/orderadmin/monitor/kpi/now', function(res) {
            if (!!res.error) {
                alert("获取数据失败");
            } else {
                var data = JSON.parse(res);
                // 动态数据接口 addData
                var c1Arr = [],
                    c2Arr = [],
                    c3Arr = [],
                    c4Arr = [],
                    c5Arr = [],
                    c6Arr = [];
                for (var i in data.submit) {
                    if(data.submit[i].data==null) {
                        data.submit[i].data='-';
                    }
                    c1Arr.push([
                        getIndexByName(data.submit[i].name),        // 系列索引
                        data.submit[i].data
                    ]);
                }
                c1Arr[0] = c1Arr[0].concat(false, false, data.date);
                for (var j in data.push) {
                    if(data.push[j].data==null){
                        data.push[j].data='-';
                    }
                    c2Arr.push([
                        getIndexByName(data.push[j].name),        // 系列索引
                        data.push[j].data
                    ]);
                }
                c2Arr[0] = c2Arr[0].concat(false, false, data.date);
                for (var k in data.confirm) {
                    if(data.confirm[k].data==null){
                        data.confirm[k].data='-';
                    }
                    c3Arr.push([
                        getIndexByName(data.confirm[k].name),        // 系列索引
                        data.confirm[k].data
                    ]);
                }
                c3Arr[0] = c3Arr[0].concat(false, false, data.date);

                for (var m in data.cancel_reason) {
                    if(data.cancel_reason[m].data==null){
                        data.cancel_reason[m].data='-';
                    }
                    c4Arr.push([
                        getIndexByName(data.cancel_reason[m].name),        // 系列索引
                        data.cancel_reason[m].data
                    ]);
                }
                c4Arr[0] = c4Arr[0].concat(false, false, data.date);

                for (var n in data.cancel) {
                    if(data.cancel[n].data==null){
                        data.cancel[n].data='-';
                    }
                    c5Arr.push([
                        getIndexByName(data.cancel[n].name),        // 系列索引
                        data.cancel[n].data
                    ]);
                }
                c5Arr[0] = c5Arr[0].concat(false, false, data.date);

                for (var s in data.cancel_op_type) {
                    if(data.cancel_op_type[s].data==null){
                        data.cancel_op_type[s].data='-';
                    }
                    c6Arr.push([
                        getIndexByName(data.cancel_op_type[s].name),        // 系列索引
                        data.cancel_op_type[s].data
                    ]);
                }
                c6Arr[0] = c6Arr[0].concat(false, false, data.date);

                chartC1.addData(c1Arr);
                chartC2.addData(c2Arr);
                chartC3.addData(c3Arr);
                chartC4.addData(c4Arr);
                chartC5.addData(c5Arr);
                chartC6.addData(c6Arr);
            }
        });
    };
    var getIndexByName = function(name) {
        var index = 0;
        switch (name) {
            case 'total':
                index = 0;
                break;
            case 'wm_android':
                index = 1;
                break;
            case 'wm_ios':
                index = 2;
                break;
            case 'wm_web':
                index = 3;
                break;
            case 'wm_i':
                index = 4;
                break;
            case 'mt_i':
                index = 5;
                break;
            case 'mt_android':
                index = 6;
                break;
            case 'mt_ios':
                index = 7;
                break;
            case 'dp_android':
                index = 8;
                break;
            case 'dp_ios':
                index = 9;
                break;
            case 'dp_web':
                index = 10;
                break;
            case 'dp_i':
                index = 11;
                break;
            case 'wx_i':
                index = 12;
                break;
            case 'wx_app':
                index = 13;
                break;
            case 'wx_wallet':
                index = 14;
                break;
            case 'mobile_qq':
                index = 15;
                break;
            case 'wx_ent':
                index = 16;
                break;
            case 'total_forecast':
                index = 17;
                break;
            case 'wm_forecast':
                index = 18;
                break;
            case 'mt_forecast':
                index = 19;
                break;
            case 'dp_forecast':
                index = 20;
                break;
            case '用户':
                index = 1;
                break;
            case '商家':
                index = 2;
                break;
            case '客服':
                index = 3;
                break;
            case 'BD':
                index = 4;
                break;
            case '系统':
                index = 5;
                break;
            case '三方平台':
                index = 6;
                break;
            case '未接单超时取消':
                index = 1;
                break;
            case '未支付超时取消':
                index = 2;
                break;
            case '其他':
                index = 3;
                break;
            default:
                index = 0;
                return;
        }
        return index;
    };

    var setchartsWrap = function() {
        chartC1 = echarts.init(jQc1[0], 'macarons');
        chartC2 = echarts.init(jQc2[0], 'macarons');
        chartC3 = echarts.init(jQc3[0], 'macarons');
        chartC4 = echarts.init(jQc4[0], 'macarons');
        chartC5 = echarts.init(jQc5[0], 'macarons');
        chartC6 = echarts.init(jQc6[0], 'macarons');
        updateCharts();
    };

    var updateCharts = function() {
        renderChart({
            chartObj: chartC1,
            title: "1分钟提单数",
            legend: ['total', 'wm_android', 'wm_ios', 'wm_web', 'wm_i', 'mt_i', 'mt_android', 'mt_ios', 'dp_android', 'dp_ios', 'dp_web' ,'dp_i', 'wx_i', 'wx_app', 'wx_wallet', 'mobile_qq', 'wx_ent', 'total_forecast', 'wm_forecast', 'mt_forecast', 'dp_forecast', 'tx_forecast'],
            data: chartData.submit,
        });
        renderChart({
            chartObj: chartC2,
            title: "1分钟推单数",
            legend: ['total', 'wm_android', 'wm_ios', 'wm_web', 'wm_i', 'mt_i', 'mt_android', 'mt_ios', 'dp_android', 'dp_ios', 'dp_web' ,'dp_i', 'wx_i', 'wx_app', 'wx_wallet', 'mobile_qq', 'wx_ent', 'total_forecast', 'wm_forecast', 'mt_forecast', 'dp_forecast', 'tx_forecast'],
            data: chartData.push,
        });
        renderChart({
            chartObj: chartC3,
            title: "1分钟商家接单数",
            legend: ['total', 'wm_android', 'wm_ios', 'wm_web', 'wm_i', 'mt_i', 'mt_android', 'mt_ios', 'dp_android', 'dp_ios', 'dp_web' ,'dp_i', 'wx_i', 'wx_app', 'wx_wallet', 'mobile_qq', 'wx_ent', 'total_forecast', 'wm_forecast', 'mt_forecast', 'dp_forecast', 'tx_forecast'],
            data: chartData.confirm,
        });
        renderChart({
            chartObj: chartC4,
            title: "1分钟订单取消数(取消原因)",
            legend: ['total', '未接单超时取消', '未支付超时取消', '其他'],
            data: chartData.cancel_reason,
        });
        renderChart({
            chartObj: chartC5,
            title: "1分钟订单取消数(订单来源)",
            legend: ['total', 'wm_android', 'wm_ios', 'wm_web', 'wm_i', 'mt_i', 'mt_android', 'mt_ios', 'dp_android', 'dp_ios', 'dp_web' ,'dp_i', 'wx_i', 'wx_app', 'wx_wallet', 'mobile_qq', 'wx_ent', 'total_forecast', 'wm_forecast', 'mt_forecast', 'dp_forecast', 'tx_forecast'],
            data: chartData.cancel,
        });
        renderChart({
            chartObj: chartC6,
            title: "1分钟订单取消数(操作类型)",
            legend: ['total', '用户', '商家', '客服', 'BD', '系统', '三方平台'],
            data: chartData.cancel_op_type,
        });
    };

    var renderChart = function(options) {
        for (var i = 0 ; i < options.data.length;i++) {
            var data = options.data[i];
            for (var j = 0; j < data.data.length; j++) {
                if(data.data[j]==null){
                    data.data[j]='-';
                }
            }
        }
        var option = {
            title : {
                text: options.title,
                x: "center"
            },
            tooltip : {
                trigger: 'axis'
            },
            grid: {
                x: 60,
                x2: 60,
                y1: 50,
                y2: 140
            },
            legend: {
                data: options.legend,
                x: "center",
                y: 545,
                itemGap: 10,
                selected: {
                    "total": true,
                    'wm_android': false, 
                    'wm_ios': false,
                    'wm_web': false,
                    'wm_i': false,
                    'mt_i': false,
                    'mt_android': false,
                    'mt_ios': false,
                    'dp_android': false,
                    'dp_ios': false,
                    'dp_web': false,
                    'dp_i': false,
                    'wx_i': false,
                    'wx_app': false,
                    'wx_wallet': false,
                    'mobile_qq': false,
                    'wx_ent': false,
                    'total_forecast': true,
                    'wm_forecast': false,
                    'mt_forecast': false,
                    'dp_forecast': false,
                    'tx_forecast': false,
                    '商家': false,
                    '客服': false,
                    '用户': false,
                    '系统': false,
                    '三方平台': false,
                    'BD': false,
                    '未接单超时取消':false,
                    '未支付超时取消':false,
                    '其他':false
                }
            },
            addDataAnimation :false,
            dataZoom : {
                show : true,
                start : 0,
                end : 100
            },
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : true,
                    data : chartData.date
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    boundaryGap: [0.2, 0.2]
                }
            ],
            series : options.data,
        };
        options.chartObj.setOption(option);
    };

    // 销毁chart对象, 重新set 此为echarts的一个坑
    var destroyCharts = function() {
        !!chartC1 && chartC1.dispose();
        !!chartC2 && chartC2.dispose();
        !!chartC3 && chartC3.dispose();
        !!chartC4 && chartC4.dispose();
        !!chartC5 && chartC5.dispose();
        !!chartC6 && chartC6.dispose();
    };

    var bindEvt = function() {
        $('#J-select-time').on('change', function() {
            lastTime = $(this).val();
            getData();
        });
        $(window).on('resize', function(evt){
          !!chartC1 && chartC1.resize(evt);
          !!chartC2 && chartC2.resize(evt);
          !!chartC3 && chartC3.resize(evt);
          !!chartC4 && chartC4.resize(evt);
          !!chartC5 && chartC5.resize(evt);
          !!chartC6 && chartC6.resize(evt);
        });
    }

    var init = function() {
        bindEvt();
        getData();
    };

    init();
});
</script>