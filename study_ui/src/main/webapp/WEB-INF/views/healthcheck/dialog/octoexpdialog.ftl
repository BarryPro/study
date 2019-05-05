<#-- OCTO Exp -->

<#-- Octo Exp新建(弹窗) -->
<div class="octo-exp-create-cfg-dialog-template modal fade" tabindex="-1" role="dialog" aria-labelledby="modal-title" style="display: none">
    <div class="modal-dialog" role="document" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新建Octo异常配置</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal col-lg-12 octo-exp-cfg-form">
                        <div class="form-group">
                            <label class="col-lg-1 control-label">appkey</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control form-field-appkey"
                                       disabled="disabled" placeholder="octo中标识每个服务的appkey"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">名称</label>
                            <div class="col-lg-11">
                                <input type="text" class="form-control form-field-name"/>
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

<#-- Octo Exp编辑(弹窗) -->
<div class="octo-exp-edit-cfg-dialog-template modal fade" tabindex="-1" role="dialog" aria-labelledby="modal-title" style="display: none">
    <div class="modal-dialog" role="document" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">编辑Octo异常配置</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal col-lg-12 octo-exp-cfg-form">
                        <div class="form-group">
                            <label class="col-lg-1 control-label">appkey</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control form-field-appkey"
                                        placeholder="octo中标识每个服务的appkey"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">名称</label>
                            <div class="col-lg-11">
                                <input type="text" class="form-control form-field-name"/>
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


<#-- Octo异常阈值编辑配置列表(弹窗) -->
<div class="octo-exp-threhold-edit-cfg-dialog-template modal fade" tabindex="-1" role="dialog" aria-labelledby="modal-title" style="display: none">
    <div class="modal-dialog" role="document" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改Octo异常阈值配置</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal col-lg-12 octo-exp-cfg-form">
                        <div class="form-group">
                            <label class="col-lg-1 control-label">appkey</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control form-field-appkey" disabled="disabled"/>
                            </div>
                            <button type="button" class="btn btn-default form-btn-sync-octo-exp-cfg">同步配置项</button>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">名称</label>
                            <div class="col-lg-11">
                                <input type="text" class="form-control form-field-name" disabled="disabled"/>
                            </div>
                        </div>
                        <div class="form-group form-empty-cfgs">
                            <label class="col-lg-1 control-label"></label>
                            <div class="col-lg-10">
                                输入appkey并点击“同步配置项”按钮获取最新监控项。
                            </div>
                        </div>
						<#-- threholds cfgs -->
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

<#-- 单条octo异常阈值配置 -->
<div class="form-group octo-exp-cfg-dialog-counter octo-exp-cfg-dialog-counter-template" style="display: none">
    <label class="col-lg-3 control-label form-field-counter"></label>
    <div class="col-lg-4">
        <label class="col-lg-6 control-label">阈值类型</label>
        <div class="col-lg-6">
            <select class="form-control" data-toggle="tooltip" data-placement="bottom" title="">
                <option selected="selected">同比/环比</option>
            </select>
        </div>
    </div>
    <div class="col-lg-4">
        <label class="col-lg-3 control-label">阈值%</label>
        <div class="col-lg-6">
            <input type="text" class="form-control form-field-threshold"/>
        </div>
    </div>
</div>


<script>
//
// octo exp info
//
$(function () {
    var teamId = ${teamId};

	// all octo exp infos
	$.ajax({
		url: "/monitor/healthcheck/getalloctoexpcfgs",
		data: {"teamId": teamId},
		type: "json",
		method: "get",
		success: function(json){
			var data = JSON.parse(json);
			if (data.result == 'success') {
				var octoExpCfgs = data.data;

				octoExpCfgs.forEach(function(cfg) {
					// 新增
					var octoExpInfoDiv = createOctoExpInfoDiv(teamId, cfg.appKey, cfg.name)

					$('#config-octo-exps').append(octoExpInfoDiv);
				});

			} else {
				alert('获取octo exp配置失败!');
			}
		},
        error: function(err){
        	console.log("请求小组Octo异常信息出错" + err.msg);
        }
    });

	function createOctoExpInfoDiv(teamId, appKey, name) {
		var octoExpInfoDiv = $('#config-octo-exp').clone();
		octoExpInfoDiv.removeAttr('id');
		octoExpInfoDiv.show();
		octoExpInfoDiv.find('.config-header-title').text(name);
		octoExpInfoDiv.find('.config-header-appkey').text(appKey);

		bindOctoExpDelBtnEvent(octoExpInfoDiv, teamId);
		bindOctoExpEditBtnEvent(octoExpInfoDiv, teamId);
		bindOctoExpThreholdCfgBtnEvent(octoExpInfoDiv, teamId);

		return octoExpInfoDiv;
	}

	/**
	 * Octo异常添加/新建操作
	 */
    $('.config-octo-exp-create').on('click', function(){
        var dialog = $('.octo-exp-create-cfg-dialog-template').clone();
        dialog.removeClass('octo-exp-create-cfg-dialog-template');
        dialog.find('.form-field-appkey').removeAttr('disabled');
        dialog.find('.form-empty-cfgs').show();
        bindOctoExpCreateBtnEvent(dialog, teamId);
        dialog.modal('show');
    });

    function bindOctoExpCreateBtnEvent(dialog, teamId) {
        dialog.find('.form-btn-save').on('click', function() {
            var appkey = dialog.find('.form-field-appkey').val();
            var name = dialog.find('.form-field-name').val();

            $.post('/monitor/healthcheck/saveoctoexpcfg', {
                teamId : teamId,
                appkey : appkey,
                name : name
            }, function(json) {
            	var data = JSON.parse(json);
            	if (data.result == 'success') {
            		// 在页面上新加
					var octoExpInfoDiv = createOctoExpInfoDiv(teamId, appkey, name);

                    $('#config-octo-exps').append(octoExpInfoDiv);
					dialog.modal('hide');
				} else {
					alert('appkey已存在!');
				}
			});
         });
    }

    /**
     * 编辑某个Octo异常配置
     */
    function bindOctoExpEditBtnEvent(octoExpInfoDiv, teamId) {
		octoExpInfoDiv.find('.config-octo-exp-edit').on("click", document, function(){
			var octoExpCfgDiv = $(this).parents(".config-item");
			var appkey = octoExpCfgDiv.find('.config-header-appkey').text();
			var name = octoExpCfgDiv.find('.config-header-title').text();

			var dialog = $('.octo-exp-edit-cfg-dialog-template').clone();
			dialog.removeClass('octo-exp-edit-cfg-dialog-template');
			dialog.find('.form-field-appkey').val(appkey);
			dialog.find('.form-field-name').val(name);

			// 初始化tooltip
			dialog.find('[data-toggle="tooltip"]').tooltip()

			bindOctoExpUpdateBtnEvent(dialog, teamId, appkey);
			dialog.modal('show');
		});
    }

	function bindOctoExpUpdateBtnEvent(dialog, teamId, oldAppKey) {
        dialog.find('.form-btn-save').on('click', function() {
            var appkey = dialog.find('.form-field-appkey').val();
            var name = dialog.find('.form-field-name').val();

            $.post('/monitor/healthcheck/updateoctoexpcfg', {
                teamId : teamId,
                appKey : appkey,
                name : name,
                oldAppKey: oldAppKey,
            }, function(json) {
            	var data = JSON.parse(json);
            	if (data.result == 'success') {
            		// 更新页面
					var appKeySpan = $('#config-octo-exps').find("span:contains('"+oldAppKey+"')");
                	appKeySpan.text(appkey);

                	var appTitleSpan = appKeySpan.parents('.config-item').find('.config-header-title');
					appTitleSpan.text(name);

					dialog.modal('hide');
				} else {
					alert('更新失败,该appkey已经存在!');
				}
			});
         });
    }

    /**
     * 删除某个Octo异常配置
     */
     function bindOctoExpDelBtnEvent(octoExpInfoDiv, teamId) {
		octoExpInfoDiv.find('.config-octo-exp-del').on("click", document, function(){
			var octoExpCfgDiv = $(this).parents(".config-item");
			var appKey = octoExpCfgDiv.find('.config-header-appkey').text();

       		if (!confirm('确认删除?')) {
     		   return;
    		}

            $.post('/monitor/healthcheck/deloctoexpcfg', {
                teamId : teamId,
                appKey : appKey,
            }, function(json) {
            	var data = JSON.parse(json);
            	if (data.result == 'success') {
            		// 在页面上删除
					octoExpCfgDiv.remove();

				} else {
					alert('删除失败!');
				}
			});
		});
    }

	/**
     * 编辑某个Octo异常阈值配置
     */
    function bindOctoExpThreholdCfgBtnEvent(octoExpInfoDiv, teamId) {
		octoExpInfoDiv.find('#config-octo-exp-threhold-cfg').on("click", document, function(){
			var octoExpCfgDiv = $(this).parents(".config-item");
			var appkey = octoExpCfgDiv.find('.config-header-appkey').text();
			var serviceName = octoExpCfgDiv.find('.config-header-title').text();
			$.get('/monitor/healthcheck/getoctoexpthreholdcfgs4app', {
				teamId : teamId,
				appkey : appkey
			}, function(json){
				var data = JSON.parse(json);
				if(data.result == 'success') {
					var dialog = $('.octo-exp-threhold-edit-cfg-dialog-template').clone();
					dialog.removeClass('octo-exp-threhold-edit-cfg-dialog-template');
					dialog.find('.form-field-appkey').val(appkey);
					dialog.find('.form-field-name').val(serviceName);

					for(var i in data.data) {
						var counter = data.data[i];
						var counterRow = $('.octo-exp-cfg-dialog-counter-template').clone();
						counterRow.removeClass('octo-exp-cfg-dialog-counter-template');
						counterRow.show();
						counterRow.find('.form-field-counter').text(counter.metric);
						counterRow.find('.form-field-threshold').val(counter.tValue);
						dialog.find('.octo-exp-cfg-form').append(counterRow);
					}

					// 初始化tooltip
					dialog.find('[data-toggle="tooltip"]').tooltip()

					bindOctoExpSubmitBtnEvent(dialog, teamId);
					bindSyncOctoExpInfosBtnEvent(dialog, teamId);
					dialog.modal('show');
				} else {
					alert('连接失败，请重试或联系管理员。');
				}
			});
		});
    }

    function bindOctoExpSubmitBtnEvent(dialog, teamId) {
        dialog.find('.form-btn-save').on('click', function(){
            var appkey = dialog.find('.form-field-appkey').val();
            var name = dialog.find('.form-field-name').val();

            // 提交阈值到服务器
            var threholdCfgs = [];
            dialog.find('.octo-exp-cfg-dialog-counter').each(function(){
                threholdCfgs.push({
                    metric : $(this).find('.form-field-counter').text(),
                    tType : 3,  //目前这是固定值3
                    tValue : $(this).find('.form-field-threshold').val()
                });
            });

            $.post('/monitor/healthcheck/saveorupdateoctoexpthreholdcfgs4app', {
                teamId : teamId,
                appkey : appkey,
                threholdCfgs : JSON.stringify(threholdCfgs)
            }, function(json){
                var data = JSON.parse(json);
                if(data.result == 'success') {
                    dialog.modal('hide');
                } else {
                	alert('刷新失败，请重试!');
                }
            });

        });
    }

	function bindSyncOctoExpInfosBtnEvent(dialog, teamId) {
        dialog.find('.form-btn-sync-octo-exp-cfg').on('click', function(){
            var appkey = dialog.find('.form-field-appkey').val();

            $.get('/monitor/healthcheck/syncthreholdcfgs4app', {
                teamId : teamId,
                appkey : appkey
            }, function(json){
                var data = JSON.parse(json);
                if(data.result == 'success') {
                    var gIds = [];

					dialog.find('.octo-exp-cfg-dialog-counter').remove();
                    // 同步指标名称

                    for(var i in data.data) {
						var counter = data.data[i];
                    	var counterRow = $('.octo-exp-cfg-dialog-counter-template').clone();
                    	counterRow.removeClass('octo-exp-cfg-dialog-counter-template');
                    	counterRow.show();
                    	counterRow.find('.form-field-counter').text(counter.metric);
                    	counterRow.find('.form-field-threshold').val(counter.tValue); //.data('gid', counter.gId);
                    	//counterRow.data('gid', counter.gId);
                    	dialog.find('.octo-exp-cfg-form').append(counterRow);
                    }
                    // 初始化tooltip
                	dialog.find('[data-toggle="tooltip"]').tooltip()

                	bindSyncOctoExpInfosBtnEvent(dialog, teamId);
                	dialog.modal('show');
                } else {
                	alert('同步web数据失败');
                }
            });
        });
    }
});

</script>