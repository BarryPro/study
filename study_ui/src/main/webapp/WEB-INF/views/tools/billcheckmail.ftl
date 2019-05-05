<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>话单对账统计</title>

    <style type="text/css">
        .hs {
            background-color: #dcdcdc;
        }
    </style>
</head>

<body>
<#if results??>
<h2 style="text-align: center">${supplierZh!}隐私号账单核算(${month!}月)</h2>
<div style="margin-bottom: 20px;width: auto">
    <table border="1" align="center" style="border-collapse: collapse;">
        <#if results.chivalry_flag??>
        <tr>
            <th colspan="6" align="left">客户名称：北京三快在线科技有限公司</th>
        </tr>
        <tr>
            <th colspan="3" align="left">账单时间：${st!} 0:00-${ed!} 24:00</th>
            <th colspan="3" align="left">账单生成时间：${genBillTime!}</th>
        </tr>
        <tr>
            <th colspan="6" align="left">(一)、月账单明细（月/元）</th>
        </tr>
        <tr class="hs">
            <th>城市</th>
            <th>骑士卡计费编码数</th>
            <th>绑定模式</th>
            <th>计费编码数</th>
            <th>计费标准</th>
            <th>当月费用</th>
        </tr>
        <#else>
        <tr>
            <th colspan="5" align="left">客户名称：北京三快在线科技有限公司</th>
        </tr>
        <tr>
            <th colspan="3" align="left">账单时间：${st!} 0:00-${ed!} 24:00</th>
            <th colspan="2" align="left">账单生成时间：${genBillTime!}</th>
        </tr>
        <tr>
            <th colspan="5" align="left">(一)、月账单明细（月/元）</th>
        </tr>
        <tr class="hs">
            <th>城市</th>
            <th>绑定模式</th>
            <th>计费编码个数</th>
            <th>计费标准</th>
            <th>当月费用</th>
        </tr>
        </#if>

    <#--显示城市列表的账单信息-->
        <#list results.rows?keys as city>
            <#if supplierZh="中联">
                <tr align="center">
                    <td rowspan="5">${city!}</td>
                    <if results.chivalry_flag??>
                        <td rowspan="5">${results.rows[city].onlineCard[city]!}</td>
                    </if>
                </tr>
            <#else>
                <tr align="center">
                    <td rowspan="4">${city!}</td>
                    <if results.chivalry_flag??>
                        <td rowspan="4">${results.rows[city].onlineCard[city]!}</td>
                    </if>
                </tr>
            </#if>
            <#list bindCol as bind>
            <tr align="center">
                <#if bind!="小计">
                    <#if results.rows[city].bindCol[bind]??>
                        <td>${results.rows[city].bindCol[bind]}</td>
                        <td>${results.rows[city].countCol[bind]}</td>
                        <td>￥${billSd?string('0.000')}</td>
                        <td class="hs">￥${results.rows[city].billCol[bind]?string('0.000')}</td>
                    </#if>
                </#if>
                <#if bind="小计">
                    <#if results.rows[city].bindCol[bind]??>
                        <td class="hs">${results.rows[city].bindCol[bind]!}</td>
                        <td class="hs">${results.rows[city].subTotal.countTotal!}</td>
                        <td class="hs">￥${billSd?string('0.000')}</td>
                        <#if results.rows[city].subTotal.curMonthTotal??>
                        <td class="hs">￥${results.rows[city].subTotal.curMonthTotal?string('0.000')}</td>
                        </#if>
                    </#if>
                </#if>
            </tr>
            </#list>
        </#list>
    <#--展示当月合计的信息-->
        <tr align="center">
            <#if results.chivalry_flag??>
                <td>当月合计</td>
                <td>${results.chivalryCardTotal}</td>
                <td></td>
            <#else>
                <td colspan="2">当月合计</td>
            </#if>
            <td class="hs">${results.curTotal.countSumTotal?string('0')}</td>
            <td class="hs">￥${billSd?string('0.000')}</td>
            <#if results.curTotal.billSumTotal??>
                <td class="hs">￥${results.curTotal.billSumTotal?string('0.000')}</td>
            </#if>
        </tr>
    </table>
</div>
</#if>
<#if !results??>
    <div align="center"><span>返回数据为空！</span></div>
</#if>
</body>
</html>