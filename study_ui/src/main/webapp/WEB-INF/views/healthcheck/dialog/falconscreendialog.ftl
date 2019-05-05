<#-- Falcon Screen -->
<#-- screen阈值配置列表(弹窗) -->
<div class="falcon-screen-cfg-dialog-template modal fade" tabindex="-1" role="dialog" aria-labelledby="modal-title" style="display: none">
    <div class="modal-dialog" role="document" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改Falcon Screen配置</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal col-lg-12 falcon-screen-cfg-form">
                        <div class="form-group">
                            <label class="col-lg-1 control-label">SID</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control form-field-sid" disabled="disabled" placeholder="Screen页面URL中的数字即为SID">
                            </div>
                            <button type="button" class="btn btn-default form-btn-sync-cfg">同步配置项</button>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">名称</label>
                            <div class="col-lg-11">
                                <input type="text" class="form-control form-field-name"/>
                            </div>
                        </div>
                        <div class="form-group form-empty-cfgs">
                            <label class="col-lg-1 control-label"></label>
                            <div class="col-lg-10">
                                输入SID并点击“同步配置项”按钮获取最新监控项。
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

<#-- 单条阈值配置 -->
<div class="form-group falcon-screen-cfg-dialog-counter falcon-screen-cfg-dialog-counter-template" style="display: none">
    <label class="col-lg-3 control-label form-field-counter"></label>
    <div class="col-lg-4">
        <label class="col-lg-6 control-label">阈值类型</label>
        <div class="col-lg-6">
            <select class="form-control" data-toggle="tooltip" data-placement="bottom" title="目前仅支持此选项，未来支持同比环比等">
                <option selected="selected">指标值大于</option>
            </select>
        </div>
    </div>
    <div class="col-lg-4">
        <label class="col-lg-3 control-label">阈值</label>
        <div class="col-lg-6">
            <input type="text" class="form-control form-field-threshold"/>
        </div>
    </div>
</div>


<script>
//
// screen info
//
$(function () {
    var teamId = ${teamId};

	// screen 添加操作
    $('.config-falcon-screen-create').on('click', function(){
        var dialog = $('.falcon-screen-cfg-dialog-template').clone();
        dialog.removeClass('falcon-screen-cfg-dialog-template');
        dialog.find('.form-field-sid').removeAttr('disabled');
        dialog.find('.form-empty-cfgs').show();
        bindFalconSubmitBtnEvent(dialog, teamId);
        bindSyncFalconGraphInfosBtnEvent(dialog, teamId);
        dialog.modal('show');
    });

    // 编辑某个falcon screen配置
    $('.config-falcon-screen-edit').on("click", document, function(){
        var screenRoot = $(this).parents(".config-falcon-screen");
        var sid = screenRoot.data("falcon-sid");
        var screenName = screenRoot.find('.config-header-title').text();
        $.get('/monitor/healthcheck/getscreenthreholdcfgs', {
            teamId : teamId,
            screenId : sid
        }, function(json){
            var data = JSON.parse(json);
            if(data.result == 'success') {
                var dialog = $('.falcon-screen-cfg-dialog-template').clone();
                dialog.removeClass('falcon-screen-cfg-dialog-template');
                dialog.find('.form-field-sid').val(sid);
                dialog.find('.form-field-name').val(screenName);

                for(var i in data.data) {
                    var counter = data.data[i];
                    var counterRow = $('.falcon-screen-cfg-dialog-counter-template').clone();
                    counterRow.removeClass('falcon-screen-cfg-dialog-counter-template');
                    counterRow.show();
                    counterRow.find('.form-field-counter').text(counter.gName);
                    counterRow.find('.form-field-threshold').val(counter.tValue).data('gid', counter.gId);
                    counterRow.data('gid', counter.gId);
                    dialog.find('.falcon-screen-cfg-form').append(counterRow);
                }

                // 初始化tooltip
                dialog.find('[data-toggle="tooltip"]').tooltip()

                bindFalconSubmitBtnEvent(dialog, teamId);
                bindSyncFalconGraphInfosBtnEvent(dialog, teamId);
                dialog.modal('show');
            } else {
                alert('连接失败，请重试或联系管理员。');
            }
        });
    });

    function bindFalconSubmitBtnEvent(dialog, teamId) {
        dialog.find('.form-btn-save').on('click', function(){
            var sid = dialog.find('.form-field-sid').val();
            var screenName = dialog.find('.form-field-name').val();
            $.post('/monitor/healthcheck/saveorupdatescreencfg', {
                teamId : teamId,
                screenId : sid,
                screenName : screenName
            }, function() {
                var screenNode = $('.config-falcon-screen[data-falcon-sid=' + sid + '] .config-header-title');
                // 如果页面上有该screen，则更新名称
                if(screenNode.length == 0) {
                    var html =
                        '<div class="config-falcon-screen" data-falcon-sid="' + sid + '">' +
                        '<span class="config-header-title">' + screenName + '</span>' +
                        '<span class="config-header-option">' +
                            '<a href="javascript:void(0)" class="config-falcon-screen-delete">删除</a>' +
                            '<button class="btn btn-info btn-sm config-falcon-screen-edit" type="button" style="margin-bottom: 6px; margin-right: 3px; float: right">配置图片阈值</button>' +
                        '</span></div>';

                        $('#config-falcon-screens').append($(html));
                } else {
                    screenNode.text(screenName);
                }

                // 提交阈值到服务器
                var graphThreholdCfgs = [];
                dialog.find('.falcon-screen-cfg-dialog-counter').each(function(){
                    graphThreholdCfgs.push({
                        gId : $(this).find('.form-field-threshold').data('gid'),
                        gName : $(this).find('.form-field-counter').text(),
                        tType : 0,  //目前这是固定值0
                        tValue : $(this).find('.form-field-threshold').val()
                    });
                });

                $.post('/monitor/healthcheck/saveorupdatethreholdcfgs4screen', {
                    teamId : teamId,
                    screenId : sid,
                    graphThreholdCfgs : JSON.stringify(graphThreholdCfgs)
                }, function(json){
                    var data = JSON.parse(json);
                    if(data.result == 'success') {
                        dialog.modal('hide');
                    }
                });
            });
        });
    }

    function bindSyncFalconGraphInfosBtnEvent(dialog, teamId) {
        dialog.find('.form-btn-sync-cfg').on('click', function(){
            var sid = dialog.find('.form-field-sid').val();

            $.get('/monitor/healthcheck/syncthreholdcfgs4screen', {
                teamId : teamId,
                screenId : sid
            }, function(json){
                var data = JSON.parse(json);
                if(data.result == 'success') {
                    var gIds = [];
                    //var counterNodes = dialog.find('.falcon-screen-cfg-dialog-counter');

					dialog.find('.falcon-screen-cfg-dialog-counter').remove();
                    // 同步指标名称

                    for(var i in data.data) {
						var counter = data.data[i];
                    	var counterRow = $('.falcon-screen-cfg-dialog-counter-template').clone();
                    	counterRow.removeClass('falcon-screen-cfg-dialog-counter-template');
                    	counterRow.show();
                    	counterRow.find('.form-field-counter').text(counter.gName);
                    	counterRow.find('.form-field-threshold').val(counter.tValue).data('gid', counter.gId);
                    	counterRow.data('gid', counter.gId);
                    	dialog.find('.falcon-screen-cfg-form').append(counterRow);
                    }
                    // 初始化tooltip
                	dialog.find('[data-toggle="tooltip"]').tooltip()

                	bindFalconSubmitBtnEvent(dialog, teamId);
                	bindSyncFalconGraphInfosBtnEvent(dialog, teamId);
                	dialog.modal('show');
                } else {
                	alert('同步web数据失败');
                }
            });
        });
    }

    /**
     * 删除某个Falcon配置
     */
     $('.config-falcon-screen-delete').on("click", document, function() {
     	if (!confirm('确认删除?')) {
     		return;
     	}

		var falconScreenDiv = $(this).parents(".config-falcon-screen");
     	var screenId = falconScreenDiv.data('falcon-sid');

     	$.post('/monitor/healthcheck/delscreencfg', {
			teamId: teamId,
			screenId: screenId,
		}, function(json) {
			var data = JSON.parse(json);
			if (data.result == 'success') {
				falconScreenDiv.remove();
			} else {
				alert('删除失败!');
			}
     	});
     });
});

</script>