<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>健康检查接入小组列表</title>

	<#include "../common/headcsslinks.ftl">
    <style>
        .config-falcon-screen {
            height: 40px;
            border: solid 1px #ddd;
            border-radius: 4px;
            background-color: #fff;
            padding: 6px 0px 0px 15px;
            margin-bottom: 3px;
        }
        .config-header-title {
            font-size : 18px;
            font-weight: 500;
        }
        .config-header-option {
            margin-left: 15px;
        }
        .config-group:after {
            display: block;
            clear: both;
            content: "";
        }
        .form-empty-cfgs {
            display: none;
        }

        .config-item {
            height: 40px;
            border: solid 1px #ddd;
            border-radius: 4px;
            background-color: #fff;
            padding: 6px 0px 0px 15px;
            margin-bottom: 3px;
        }

		.config-item-block {
			width: 80%;
		}

    </style>
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
            <div>
                <input type="hidden" id="team-id" value="${teamId}">
                <div class="config-group">
                    <h3>基本配置</h3>
                    <form class="form-horizontal col-lg-8">
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">组名</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input id="inputTeamName" type="text" class="form-control" disabled="disabled" placeholder="小组名字">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">邮件收件人</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input id="inputReceivers" type="text" class="form-control" disabled="disabled" placeholder="请输入收件人完整邮箱地址，以英文逗号分隔">
                            </div>
                        </div>
                    </form>
                </div>

                <div class="ln_solid"></div>

				<#-- Falcon Screen -->
                <div class="config-group" id="config-group-falcon-screen">
                    <div style="margin-bottom: 10px;">
                        <h3 style="display: inline;">Falcon Screen配置</h3>
                        <a href="javascript:void(0)" style="margin-left: 5px;" class="config-falcon-screen-create">新建</a>
                    </div>
                    <div id="config-falcon-screens" class="config-item-block">
						<#if falconScreens??>
                        <#list falconScreens as falconScreen>
                            <div class="config-falcon-screen" data-falcon-sid="${falconScreen.sid}">
                                <span class="config-header-title">${falconScreen.name}</span>
                                <span class="config-header-option">
                                    <a href="javascript:void(0)" class="config-falcon-screen-delete">删除</a>
                                	<button class="btn btn-info btn-sm config-falcon-screen-edit" type="button"
                                        style="margin-bottom: 6px; margin-right: 3px; float: right"
                                        >配置图片阈值</button>
								</span>
                            </div>
                        </#list>
						</#if>
                    </div>
                </div>
				<br/>

				<#-- OCTO Exp -->
                <div class="config-group" id="config-group-octo-exp">
                    <div style="margin-bottom: 10px;">
                        <h3 style="display: inline;">Octo异常配置</h3>
                        <a href="javascript:void(0)" style="margin-left: 5px;" class="config-octo-exp-create">新建</a>
                    </div>
                    <div id="config-octo-exps" class="config-item-block">
						<#-- template -->
						<div id="config-octo-exp" class="config-item" style="display: none;">
                            <span class="config-header-appkey" style="display: none"></span>
							<span class="config-header-title"></span>
							<span class="config-header-option">
								<a href="javascript:void(0)" class="config-octo-exp-edit">编辑</a>
								<a href="javascript:void(0)" class="config-octo-exp-del">删除</a>
								<button id="config-octo-exp-threhold-cfg" class="btn btn-info btn-sm" type="button"
                                        style="margin-bottom: 6px; margin-right: 3px; float: right">
									配置异常阈值</button>
							</span>
						</div>

                    </div>
                </div><br/>

				<#-- Iface -->
				<div class="config-group" id="config-group-iface-stat">
					<div style="margin-bottom: 10px;">
						<h3 style="display: inline;">Iface接口指标配置</h3>
						<a href="javascript:void(0)" style="margin-left: 5px;" class="config-iface-stat-create">新建</a>
					</div>
					<div id="config-iface-stats" class="config-item-block">
						<#-- template -->
						<div id="config-iface-stat" class="config-item" style="display: none;">
							<span class="config-header-appkey" style="display: none"></span>
							<span class="config-header-title"></span>
							<span class="config-header-services" style="display: none"></span>
							<span class="config-header-option">
								<a href="javascript:void(0)" class="config-iface-stat-edit">编辑</a>
								<a href="javascript:void(0)" class="config-iface-stat-del">删除</a>

								<button id="config-iface-stat-threhold-cfg" type="button"
										style="margin-bottom: 6px; margin-right: 3px; float: right"
										class="btn btn-info btn-sm">配置接口阈值</button>
							</span>

						</div>
					</div>
				</div><br/>

				<#-- Slow Query -->
                <div class="config-group" id="config-group-show-query">
                    <div style="margin-bottom: 10px;">
                        <h3 style="display: inline;">慢查询邮件自定义配置</h3>
                    </div>
                    <div class="x_panel config-item-block">
                        <div class="x_content">

                            <div id="form-slow-query" class="form-group">
 								<label for="form-field-leader">慢查询小组leader:</label>
								<input type="text" class="form-control" style="width: 40%"
									   id="form-field-leader" placeholder="慢查询小组leader名字">

								<br/>
								<label for="form-field-filter-hosts">需要屏蔽的Hosts(以;分隔) :</label>
								<textarea id="form-field-filter-hosts" class="form-control" style="width: 50%"
										  placeholder="示例: yf-waimai-mysql-his02;aa-bb-cc-dd;">
								</textarea>
                                <div class="ln_solid"></div>
                                <button type="submit" class="btn btn-primary config-slow-query-save">保存基本配置</button>
                                <button type="reset" class="btn btn-info config-slow-query-mark">标记慢查询Sql信息</button>
							</div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- /page content -->
    </div>

	<!-- footer content -->
    <#include "../common/footer.ftl">
	<!-- /footer content -->
</div>

<#include "../common/allscripts.ftl">

<#-- dialogs -->
<#include "./dialog/falconscreendialog.ftl">
<#include "./dialog/octoexpdialog.ftl">
<#include "./dialog/ifacestatdialog.ftl">
<#include "./dialog/slowquerydialog.ftl">


<script>

//
// team base info
//
$(document).ready(function () {
	var teamId = ${teamId};

	$.ajax({
		url: "/monitor/healthcheck/getteaminfobyid",
		data: {"teamId": teamId},
		type: "json",
		method: "get",
		success: function(data){
			var result = $.parseJSON(data);
			var msg = result.data;
			$("#inputTeamName").val(msg.teamName);
			$("#inputReceivers").val(msg.receivers);
		},
        error: function(err){
        	console.log("请求小组信息出错" + err.msg);
        }
    });

});

</script>

</body>

</html>