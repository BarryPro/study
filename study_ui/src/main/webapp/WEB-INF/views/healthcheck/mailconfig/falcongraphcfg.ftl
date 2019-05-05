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
                        <h3 style="display: inline">健康检查-Falcon_Graph阈值配置</h3>
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
                                <th>图片名</th>
                                <th>阈值类型</th>
                                <th>阈值(取falcon三天均值)</th>
                            </tr>
                            </thead>
                            <tbody id="falcon-graph-cfg-table-tbody">
                            <tr id="falcon-graph-cfg-template" class="falcon-graph-cfg" style="display: none">
                                <td class="sqlId">
                                    <span class="form-graph-name"/>
                                </td>
                                <td class="status">
                                    <select class="">
                                        <option selected="selected">指标值大于</option>
                                    </select>
                                </td>
                                <td class="desc">
                                    <input class="form-graph-threshold" type="text"/>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <button type="button" class="btn btn-primary btn-ms" style="float: right; display: none"
                                id="form-btn-update-graph-thrhod-cfg">更新</button>
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
	var screenId = "${screenId}";
	var gId = "${gId}";

	$.ajax({
		url: "/monitor/healthcheck/getfalcongraphcfg",
		data: {
			"teamId": teamId,
			"screenId": screenId,
			"gId": gId,
		},
		method: "get",
		success: function(json) {
			var data = JSON.parse(json);
			if (data.result == 'success') {
				var graphThreholdCfg = data.data;
				if (graphThreholdCfg == null) {
					alert('获取慢查询sql配置信息出错!');
					return;
				}

				$('.form-graph-name').text(graphThreholdCfg.gName);
				$('.form-graph-threshold').val(graphThreholdCfg.tValue);
				$('#falcon-graph-cfg-template').show();
				$('#form-btn-update-graph-thrhod-cfg').show();
			} else {
				alert('获取慢查询sql配置信息出错!');
			}
		},
		error: function(err) {
			alert("获取慢查询sql配置信息出错:" + err.msg);
		}
	});

	$('#form-btn-update-graph-thrhod-cfg').on('click', function(){
		var _gId = gId;
		var gName = $('.form-graph-name').val();
		var tValue = $('.form-graph-threshold').val();

		if (status==null && desc==null) {
    		alert("参数不能为空!");
    		return;
    	}

		var graphThreholdCfg = {
			"gId": _gId,
			"gName": gName,
			"tType": 0,
			"tValue": tValue
		};

		$.ajax({
			url: "/monitor/healthcheck/updatefalcongraphcfg",
			data: {
				"teamId": ${teamId},
				"screenId": screenId,
				"graphThreholdCfg": JSON.stringify(graphThreholdCfg),
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