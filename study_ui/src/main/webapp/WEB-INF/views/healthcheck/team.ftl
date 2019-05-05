<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>健康检查管理平台</title>

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
                    <h3 style="display: inline">健康检查接入小组列表</h3>
                    <a href="javascript:void(0)" style="margin-left: 5px;" class="config-team-create">新建</a>
                </div>
                <div class="title_right"></div>
            </div>
            <div class="clearfix"></div>
			<br>
            <div class="x_panel" style="width: 80%">
				<div class="x_content">
					<table class="table table-hover">
						<thead>
						<tr>
							<th>小组名</th>
							<th>邮件组</th>
							<th>操作</th>
							<th>发送邮件</th>
						</tr>
						</thead>
						<tbody id="team-cfg-table-tbody">

							<#-- team cfgs template -->
							<tr id="config-team-info" class="config-team" style="display: none;">
								<td class="teamId" style="display: none"></td>
								<td class="teamName">
									<a href=""></a>
								</td>
                                <td>
                                    <input disabled="disabled" type="text" class="receivers">
								</td>
								<td>
                                    <a href="javascript:void(0)" class="form-btn-edit-team-cfg">编辑</a>
                                    <#--<button type="button" class="btn btn-default btn-xs form-btn-edit-team-cfg">编辑</button>-->
									<button type="button" class="btn btn-danger btn-xs form-btn-del-team-cfg"
											style="margin-bottom: 3px">删除</button>
								</td>
								<td>
                                    <button type="button" class="btn btn-primary btn-xs form-btn-send-team-cfg"
                                            style="margin-bottom: 3px">发送</button>
								</td>
							</tr>

						</tbody>
					</table>
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


<#-- Iface Stat配置(新建/更新弹窗) -->
<div class="team-cfg-dialog-template modal fade" tabindex="-1" role="dialog" aria-labelledby="modal-title" style="display: none">
    <div class="modal-dialog" role="document" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新增小组信息</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal col-lg-12 team-cfg-form">
                        <div class="form-group">
                            <label class="col-lg-1 control-label">小组Id</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control form-field-team-id"
                                       placeholder="小组Id,由管理员手动分配"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">小组名</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control form-field-team-name"
                                       placeholder="小组名称"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">收件人</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control form-field-receivers"
                                       placeholder="邮件接收组"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">密码</label>
                            <div class="col-lg-4">
                                <input type="password" class="form-control form-field-mima"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary form-btn-save">保存</button>
            </div>
        </div>
    </div>
</div>

<#--密码确认窗口-->
<div class="password-confirm-dialog-template modal fade" tabindex="-1" role="dialog" aria-labelledby="modal-title" style="display: none">
    <div class="modal-dialog" role="document" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">请输入密码</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal col-lg-12 team-cfg-form">
                        <div class="form-group">
                            <label class="col-lg-1 control-label">密码</label>
                            <div class="col-lg-4">
                                <input type="password" class="form-control form-field-password"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary form-btn-confirm">确认</button>
            </div>
        </div>
    </div>
</div>
<#include "../common/allscripts.ftl">

<script type="text/javascript">
//
// iface stat info
//
$(function(){

	// show all iface stat infos
	$.ajax({
		url: "/monitor/healthcheck/getallteaminfo",
		type: "json",
		method: "get",
		success: function(json) {
			var data = JSON.parse(json);
			if (data.result == 'success') {
				var teamCfgs = data.data;

				teamCfgs.forEach(function(cfg) {
					var teamCfgInfoTr = createTeamInfoTr(
						cfg.teamId, cfg.teamName, cfg.receivers);
					$('#team-cfg-table-tbody').append(teamCfgInfoTr);
				});
			} else {
				alert('获取小组信息失败!');
			}
		},
		error: function(err) {
			console.log("请求小组信息出错" + err.msg);
		}
	});

	function createTeamInfoTr(teamId, teamName, receivers) {
		var cfgTr = $('#config-team-info').clone();
		cfgTr.removeAttr('id');
		cfgTr.show();
		cfgTr.find('.teamId').text(teamId);
		cfgTr.find('.teamName a').text(teamName);
		var url = "/monitor/healthcheck/team/"+teamId+"/config";
		cfgTr.find('.teamName a').attr("href", url);
		cfgTr.find('.receivers').val(receivers);

		cfgTr.find(".form-btn-edit-team-cfg").on("click", function() {
			teamCfgEditBtnClickHandler(cfgTr);
		});

        cfgTr.find(".form-btn-send-team-cfg").on("click", function() {
			passwordConfirmBtnClickHandler(cfgTr);
        });
		return cfgTr;
	}

	$(".config-team-create").on("click", function(){
		var dialog = $('.team-cfg-dialog-template').clone();
		dialog.removeClass('team-cfg-dialog-template');

		dialog.find('.form-btn-save').on('click', function() {
			teamCfgCreateBtnClickHandler(dialog);
		});

		// 初始化tooltip
		dialog.find('[data-toggle="tooltip"]').tooltip()
		dialog.modal('show');
	});

	function teamCfgCreateBtnClickHandler(dialog) {
		var teamId = dialog.find('.form-field-team-id').val();
		var teamName = dialog.find('.form-field-team-name').val();
		var receivers = dialog.find('.form-field-receivers').val();
		var mima = dialog.find('.form-field-mima').val();

		if (teamId=="" || teamName=="" || receivers=="" || mima=="") {
			alert("参数不能为空!");
			return;
		}

		$.post('/monitor/healthcheck/addteaminfo', {
               teamId : teamId,
               teamName : teamName,
               receivers : receivers,
               mima: mima
           }, function(json) {
           	var data = JSON.parse(json);
           	if (data.result == 'success') {
           		// 在页面上新加
				var tr = createTeamInfoTr(
					teamId, teamName, receivers);
				$('#team-cfg-table-tbody').append(tr);
				dialog.modal('hide');
			} else {
				alert(data.data);
			}
		});
	}

	/**
	 * 编辑team cfg
	 */
	function teamCfgEditBtnClickHandler(teamCfgTr) {
		var teamId = teamCfgTr.find('.teamId').text();
		var teamName = teamCfgTr.find('.teamName a').text();
		var receivers = teamCfgTr.find('.receivers').val();

		var dialog = $('.team-cfg-dialog-template').clone();
		dialog.removeClass('team-cfg-dialog-template');

		dialog.find('.form-field-team-id').val(teamId);
		dialog.find('.form-field-team-id').attr('disabled','disabled');;
		dialog.find('.form-field-team-name').val(teamName);
		dialog.find('.form-field-receivers').val(receivers);

		dialog.find('.form-btn-save').on('click', function() {
			updateTeamCfg(dialog);
		});

		// 初始化tooltip
		dialog.find('[data-toggle="tooltip"]').tooltip()
		dialog.modal('show');
	}

	/**
	*  密码确认
	*/
     function passwordConfirmBtnClickHandler(teamCfgTr) {
		var teamId = teamCfgTr.find('.teamId').text();

		var dialog = $('.password-confirm-dialog-template').clone();
		dialog.removeClass('password-confirm-dialog-template');

		dialog.find('.form-btn-confirm').on('click', function() {
			confirmPassword(dialog, teamId);
		});

		// 初始化tooltip
		dialog.find('[data-toggle="tooltip"]').tooltip()
		dialog.modal('show');
	}
    function confirmPassword(dialog,teamId) {
        var password = dialog.find('.form-field-password').val();

        if (password=="") {
            alert("密码不能为空!");
            return;
        }

        $.post('/monitor/healthcheck/send4team', {
            teamId : teamId,
            password: password
        }, function(json) {
            var data = JSON.parse(json);
            if (data.result == 'success') {
                alert('发送成功');
            } else {
                alert(data.data);
            }
        });
    }

	function updateTeamCfg(dialog) {
			var teamId = dialog.find('.form-field-team-id').val();
			var teamName = dialog.find('.form-field-team-name').val();
			var receivers = dialog.find('.form-field-receivers').val();
			var mima = dialog.find('.form-field-mima').val();

			if (teamId=="" || teamName=="" || receivers=="" || mima=="") {
				alert("参数不能为空!");
				return;
			}

			$.post('/monitor/healthcheck/updateteaminfo', {
                teamId : teamId,
                teamName : teamName,
                receivers : receivers,
                mima: mima
            }, function(json) {
            	var data = JSON.parse(json);
            	if (data.result == 'success') {
					dialog.modal('hide');
				} else {
					alert(data.data);
				}
			});
	}

});
</script>


</body>

</html>