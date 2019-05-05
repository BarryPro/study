<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>健康检查管理平台</title>

<#include "../../common/headcsslinks.ftl">

</head>


<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- side bar -->
	<#import "../../common/sidebar.ftl" as s>
	<@s.sidebar active="" />

        <!-- top navigation -->
	<#include "../../common/navbar.ftl">
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3 style="display: inline">健康检查-慢查询Sql配置</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>
                <br>
                <div class="x_panel" style="width: 70%">
                    <div class="x_content">
                        <table class="table" style="">
                            <thead>
                            <tr>
                                <th>sqlId(checksum)</th>
                                <th>状态</th>
                                <th>描述(简短描述)</th>
                            </tr>
                            </thead>
                            <tbody id="slow-sql-cfg-table-tbody">
                            <tr id="slow-sql-cfg-template" class="slow-sql-cfg">
                                <td class="sqlId">
                                    <span class="form_field_sqlId"/>
                                </td>
                                <td class="status">
                                    <select class="from_field_status">
                                        <option value="0">新慢sql</option>
                                        <option value="1">已知慢sql</option>
                                        <option value="2"">不再关注</option>
                                    </select>
                                </td>
                                <td class="desc">
                                    <input class="form_field_desc" type="text"/>
                                </td>
                            </tr>
                            </tbody>
                        </table>

						<button type="button" class="btn btn-primary btn-ms" style="float: right;"
								id="form-btn-save-slow-sql-cfg">更新</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
	<#include "../../common/footer.ftl">
        <!-- /footer content -->
    </div>
</div>

<#include "../../common/allscripts.ftl">

<script type="text/javascript">

$(function(){

	var teamId = ${teamId};
	var sqlId = "${sqlId}";

	$('.form_field_sqlId').text(sqlId);

	$.ajax({
		url: "/monitor/healthcheck/getslowsqlcfg",
		data: {
			"teamId": teamId,
			"sqlId": sqlId,
		},
		method: "get",
		success: function(json) {
			var data = JSON.parse(json);
			if (data.result == 'success') {
				var slowSqlCfg = data.data;
				if (slowSqlCfg == null) {
					return; // 新增
				}

				$('.from_field_status').val(slowSqlCfg.status);
				$('.form_field_desc').val(slowSqlCfg.desc);
			} else {
				alert('获取慢查询sql配置信息出错!');
				$("#form-btn-save-slow-sql-cfg").hide();
			}
		},
		error: function(err) {
			alert("获取慢查询sql配置信息出错:" + err.msg);
			$("#form-btn-save-slow-sql-cfg").hide();
		}
	});

	$('#form-btn-save-slow-sql-cfg').on('click', function(){
		var _sqlId = sqlId;
		var status = $(".from_field_status option:selected").val();
		var desc = $(".form_field_desc").val();

		if (status==null && desc==null) {
    		alert("参数不能为空!");
    		return;
    	}

		var slowSqlCfg = {
			"sqlId": _sqlId,
			"status": status,
			"desc": desc
		};

		$.ajax({
			url: "/monitor/healthcheck/saveorupdateslowsqlcfg",
			data: {
				"teamId": ${teamId},
				"slowSqlCfg": JSON.stringify(slowSqlCfg),
			},
			method: "post",
			success: function(json) {
				var data = JSON.parse(json);
				if (data.result == 'success') {
					alert('配置信息修改成功!');
				} else {
					alert("更新sql配置信息出错:"+data.data);
				}
			},
			error: function(err) {
				alert("获取慢查询sql配置信息出错:" + err.msg);
			}
		});
	});

});
</script>

</body>

</html>