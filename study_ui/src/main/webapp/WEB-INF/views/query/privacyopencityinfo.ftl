<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>隐私号开城信息</title>

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
                    <h3>隐私号开城信息</h3>
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                            <div id="privacyphone-cfgs-show-div">
                                <#if output??>
                                <#assign json=output?eval />
                                <#if json.result='success'>
                                    <table id="privacyphone-cfg-table" class="table table-striped privacyphone-cfg-table" >
                                        <thead>
                                        <tr>
                                            <th>地区名称</th>
                                            <th>城市id(前缀)</th>
                                            <th>运营商</th>
                                            <th>号池区号</th>
                                            <th>灰度比例</th>
                                            <th>默认开启</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                    <#if json.data??>
                                        <#list json.data as info>
                                            <tr>
                                                <td>${info.cityAreaName!}</td>
                                                <td>${info.cityIdPrefix!}</td>
                                                <td>${info.ispName!}</td>
                                                <td>${info.phonePoolAreaCode!}</td>
                                                <td>${info.greyScale!}</td>
                                                <td>${info.defaultOpen!}</td>
                                            </tr>
                                        </#list>
                                    </#if>
                                        </tbody>
                                    </table>
                                <#else>
                                    <span>获取开城信息失败！</span>
                                </#if>
                                </#if>
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
    $(function () {
        $.ajax({
            url: "/query/opencityinfo",
            error: function(){
                return alert("js查询订单服务出错!");
            }
        });
    });
</script>

</body>

</html>