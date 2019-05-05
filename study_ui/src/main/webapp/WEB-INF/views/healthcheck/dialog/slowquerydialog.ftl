<#-- 慢查询Sql标记列表(弹窗) -->
<div class="slow-query-sql-mark-edit-dialog-template modal fade" tabindex="-1" role="dialog" aria-labelledby="modal-title" style="display: none">
    <div class="modal-dialog" role="document" style="width: 80%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">慢查询Sql标记配置</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal col-lg-12 slow-sql-cfg-form">
					<div class="form-group">
						<div class="col-md-12 col-sm-6 col-xs-12">
							<div class="x_panel">
								<div class="x_content">
									<table class="table" style="">
										<thead>
										<tr>
											<th>sqlId(checksum)</th>
											<th>状态</th>
											<th>描述(简短描述)</th>
											<th>
												<button type="button" class="btn btn-primary btn-xs form-btn-add-slow-sql-cfg">新增</button>
											</th>
										</tr>
										</thead>
										<tbody id="slow-sql-cfg-table-tbody">
										<#-- slow sql cfgs  -->
										<tr id="slow-sql-cfg-template" class="slow-sql-cfg" style="display: none">
											<td class="sqlId">
												<input class="form_field_sqlId" type="text"/>
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
											<td>
												<button type="button" class="btn btn-danger btn-xs form-btn-del-slow-sql-cfg">删除</button>
											</td>
										</tr>
										</tbody>
									</table>
								</div>
							</div>
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



<script>

//
// iface stat info
//
$(function () {
	var teamId = ${teamId};

	// show slow query cfg info
	$.ajax({
		url: "/monitor/healthcheck/getslowquerycfg",
		data: {"teamId": teamId},
		type: "json",
		method: "get",
		success: function(json) {
			var data = JSON.parse(json);
			if (data.result == 'success') {
				$('#config-group-show-query').find("#form-field-filter-hosts").val('');

				var slowQueryCfg = data.data;
				if (slowQueryCfg == null)
					return;

				$('#config-group-show-query').find("#form-field-leader").val(slowQueryCfg.leader);

				if (slowQueryCfg.filterHosts!=null && slowQueryCfg.filterHosts.length>0) {
					var hosts = slowQueryCfg.filterHosts.join(";");
					$('#config-group-show-query').find("#form-field-filter-hosts").val(hosts);
				}

			} else {
				alert('获取慢查询基本信息失败!');
			}
		},
		error: function(err) {
			console.log("请求慢查询基本信息出错" + err.msg);
		}
	});

	/**
	 * 保存操作
	 */
	$('.config-slow-query-save').on('click', function(){
		$.ajax({
	        url: "/monitor/healthcheck/saveorupdateslowquerycfg",
	        data: {
	        	"teamId":  ${teamId},
	        	"leader": $("#form-field-leader").val(),
	        	"filterHosts": $("#form-field-filter-hosts").val()},
	        type: "json",
	        method: "post",
	        success: function(data){
	            var result = $.parseJSON(data);
	            if(result.result == "success"){
	                alert("更新信息成功");
	            } else {
					alert("更新失败:"+data.data);
	            }
	        },
	        error: function(err){
	        	alert("更新信息出错!" + err.msg);
	            console.log("請求內容出錯 " + err.msg);
	        }
	    })
    });

    /**
     * 标记慢查询sql操作
     */
	$('.config-slow-query-mark').on('click', function(){

		$.get('/monitor/healthcheck/getslowsqlcfgs', {
				teamId : teamId
			}, function(json) {
				var data = JSON.parse(json);
				if (data.result == 'success') {

					var dialog = $('.slow-query-sql-mark-edit-dialog-template').clone();
					dialog.removeClass('slow-query-sql-mark-edit-dialog-template');

					var slowSqlCfgs = data.data;
					drawSlowSqlCfgsTable(slowSqlCfgs, dialog);

					// 初始化tooltip
					dialog.find('[data-toggle="tooltip"]').tooltip()

					bindAddSlowSqlCfgBtn(dialog);
					bindDelSlowSqlCfgBtn(dialog);
					bindSlowSqlCfgsSubmitBtnEvent(dialog, teamId);

					dialog.modal('show');
				} else {
					alert("服务器错误:"+data.data);
				}
			});
	});

	function bindAddSlowSqlCfgBtn(dialog) {
		dialog.find('.form-btn-add-slow-sql-cfg').on('click', function(){
			var cfgTr = $('#slow-sql-cfg-template').clone();
			cfgTr.removeAttr('id');
			cfgTr.show();

			var tbody = dialog.find('#slow-sql-cfg-table-tbody');
			tbody.append(cfgTr);

			bindDelSlowSqlCfgBtn(dialog);
		});
	}

	function bindDelSlowSqlCfgBtn(dialog) {
		dialog.find('.form-btn-del-slow-sql-cfg').on('click', function(){
			$(this).parents('.slow-sql-cfg').remove();
		});
	}

	function drawSlowSqlCfgsTable(slowSqlCfgs, dialog) {
		if (slowSqlCfgs == null)
			return;

		slowSqlCfgs.forEach(function(slowSqlCfg, i) {
			var cfgTr = $('#slow-sql-cfg-template').clone();
			cfgTr.removeAttr('id');
			cfgTr.show();

			cfgTr.find('.sqlId').find('.form_field_sqlId').val(slowSqlCfg.sqlId);
			cfgTr.find('.status').find('.from_field_status').val(slowSqlCfg.status);
			cfgTr.find('.desc').find('.form_field_desc').val(slowSqlCfg.desc);

			var tbody = dialog.find('#slow-sql-cfg-table-tbody');
			tbody.append(cfgTr);
		});
	}

	function bindSlowSqlCfgsSubmitBtnEvent(dialog, teamId) {
		dialog.find('.form-btn-save').on('click', function(){
			var isLegalParams = true;
			var slowSqlCfgs = [];
			dialog.find(".slow-sql-cfg").each(function(i, trCfg) {
				// 过滤slow-sql-cfg-template的display:none模板(临时办法)
				var trId = $(trCfg).attr("id");
				if (trId != null)
					return;

				var sqlId = $(trCfg).find(".sqlId").find(".form_field_sqlId").val();
				var status = $(trCfg).find(".status").find(".from_field_status option:selected").val();
				var desc = $(trCfg).find(".desc").find(".form_field_desc").val();

				if (sqlId=="") {
					isLegalParams = false;
				}

				var slowSqlCfg = {
					"sqlId": sqlId,
					"status": status,
					"desc": desc
				};

				slowSqlCfgs.push(slowSqlCfg);
			});

			if (slowSqlCfgs.length==0 || !isLegalParams) {
				alert("参数不能为空!");
				return;
			}

			$.post('/monitor/healthcheck/saveorupdateslowsqlcfgs', {
    	        teamId : teamId,
            	slowSqlCfgs: JSON.stringify(slowSqlCfgs)
        	}, function(json) {
           		var data = JSON.parse(json);
           		if (data.result == 'success') {
					dialog.modal('hide');
				} else {
					alert("保存Sql标记信息失败("+data.data+")!");
				}
			});
		});
	}
});
</script>