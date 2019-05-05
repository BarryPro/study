<#-- Iface Stat -->

<#-- Iface Stat配置(新建/更新弹窗) -->
<div class="iface-stat-cfg-dialog-template modal fade" tabindex="-1" role="dialog" aria-labelledby="modal-title" style="display: none">
    <div class="modal-dialog" role="document" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Iface统计配置</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal col-lg-12 iface-stat-cfg-form">
                        <div class="form-group">
                            <label class="col-lg-1 control-label">appkey</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control form-field-appkey"
                                       placeholder="octo中标识每个接口服务的appkey"/>
                            </div>
                            <button type="button" class="btn btn-default form-btn-sync-iface-stat-service-cfg">同步Service配置</button>
						</div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">名称</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control form-field-name"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-1">Services</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input type="text" class="form-control form-field-serivces"/>
                            </div>
                        </div>
                        <div class="form-group">
							<label class="col-lg-1 control-label">接口指标</label>
							<div class="col-lg-2">
								<span class="label label-info form-field-metrics">qps</span>
								<span class="label label-info form-field-metrics">tp95</span>
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


<#-- Iface异常阈值编辑配置列表(弹窗) -->
<div class="iface-stat-threhold-edit-cfg-dialog-template modal fade" tabindex="-1" role="dialog" aria-labelledby="modal-title" style="display: none">
    <div class="modal-dialog" role="document" style="width: 80%">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改Iface接口阈值配置</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal col-lg-12 iface-stat-cfg-form">
                        <div class="form-group">
                            <label class="col-lg-1 control-label">appkey</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control form-field-appkey" disabled="disabled"/>
                            </div>
                            <button type="button" class="btn btn-default form-btn-sync-service-threhold-cfg">同步配置项</button>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">名称</label>
                            <div class="col-lg-4">
                                <input type="text" class="form-control form-field-name" disabled="disabled"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-1">Services</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input type="text" class="form-control form-field-serivces" disabled="disabled"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-1 control-label">接口指标</label>
                            <div class="col-lg-2">
                                <span class="label label-info form-field-metrics">qps</span>
                                <span class="label label-info form-field-metrics">tp95</span>
                            </div>
                        </div>

						<#-- service threhold cfgs -->
						<div class="form-group">
                            <div class="col-md-12 col-sm-6 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Iface接口阈值配置</h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table class="table" style="">
                                            <thead>
												<tr>
													<th>服务</th>
													<th>接口</th>
													<th>指标</th>
													<th>指标类型</th>
													<th>阈值</th>
												</tr>
                                            </thead>
                                            <tbody id="iface-threhold-cfgs-table-tbody">

												<#-- iface threhold cfgs tr template -->
                                                <tr id="iface-threhold-cfgs-template" class="iface-threhold-cfgs" style="display: none">
                                                    <td class="service" data-service=""></td>
                                                    <td class="iface" data-iface=""></td>
                                                    <td class="metric"></td>
                                                    <td class="threhold-type" data-threhold-type="3">
                                                        <select>
                                                            <option selected="selected">同比/环比</option>
                                                        </select>
                                                    </td>
                                                    <td class="threhold">
														<input class="form_field_threhold" type="text"/>
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

	// show all iface stat infos
	$.ajax({
		url: "/monitor/healthcheck/getallifacestatcfgs",
		data: {"teamId": teamId},
		type: "json",
		method: "get",
		success: function(json) {
			var data = JSON.parse(json);
			if (data.result == 'success') {
				var ifaceStatCfgs = data.data;

				ifaceStatCfgs.forEach(function(cfg) {
					var ifaceStatInfoDiv = createIfaceStatInfoDiv(
						teamId, cfg.appKey, cfg.name,
						cfg.services.join(","), cfg.metrics.join(","));
					$('#config-iface-stats').append(ifaceStatInfoDiv);
				});
			} else {
				alert('获取iface stat配置失败!');
			}
		},
		error: function(err) {
			console.log("请求小组Iface异常信息出错" + err.msg);
		}
	});

	function createIfaceStatInfoDiv(teamId, appKey, name, servicesStr, metricsStr) {
		var ifaceStatDiv = $('#config-iface-stat').clone();
		ifaceStatDiv.removeAttr('id');
		ifaceStatDiv.show();
		ifaceStatDiv.find('.config-header-title').text(name);
		ifaceStatDiv.find('.config-header-appkey').text(appKey);
		ifaceStatDiv.find('.config-header-services').text(servicesStr);
		ifaceStatDiv.find('.config-header-metrics').text(metricsStr);

		bindIfaceStatDelBtnEvent(ifaceStatDiv, teamId);
		bindIfaceStatEditBtnEvent(ifaceStatDiv, teamId);
		bindIfaceStatThreholdCfgBtnEvent(ifaceStatDiv, teamId);

		return ifaceStatDiv;
	}

	/**
	 * Iface添加/新建操作
	 */
	$('.config-iface-stat-create').on('click', function(){
        var dialog = $('.iface-stat-cfg-dialog-template').clone();
        dialog.removeClass('iface-stat-cfg-dialog-template');

        bindIfaceStatCreateBtnEvent(dialog, teamId);
        bindSyncIfaceStatServicesBtnEvent(dialog)

        dialog.modal('show');
    });

    function bindSyncIfaceStatServicesBtnEvent(dialog) {
    	dialog.find('.form-btn-sync-iface-stat-service-cfg').on('click', function() {
    		var appKey = dialog.find('.form-field-appkey').val();
    		if (appKey==null || appKey=='') {
    			alert("appkey为空!");
    			return;
    		}

    		$.get('/monitor/healthcheck/syncifacestatservices4app', {
    			appKey : appKey
    		}, function(json) {
				var data = JSON.parse(json);
				if (data.result == 'success') {
					var services = data.data;
					var servicesStr = services.join();
					dialog.find('.form-field-serivces').val(servicesStr);
				} else {
					alert('同步appkey的Services数据失败');
				}
    		});
    	});
    }

    function bindIfaceStatCreateBtnEvent(dialog, teamId) {
        dialog.find('.form-btn-save').on('click', function() {
            var appKey = dialog.find('.form-field-appkey').val();
            var name = dialog.find('.form-field-name').val();
			var servicesStr = dialog.find('.form-field-serivces').val();

			var metrics = [];
			var metricLabels = dialog.find('.form-field-metrics');
			for (var i=0; i<metricLabels.length; i++) {
    			metrics.push(metricLabels[i].innerHTML);
			}

			if (appKey=="" || name=="" || servicesStr=="") {
    			alert("参数不能为空!");
    			return;
    		}

			var services = servicesStr.split(',');

            $.post('/monitor/healthcheck/saveifacestatcfg', {
                teamId : teamId,
                appKey : appKey,
                name : name,
                services: JSON.stringify(services),
                metrics: JSON.stringify(metrics),
            }, function(json) {
            	var data = JSON.parse(json);
            	if (data.result == 'success') {
            		// 在页面上新加
					var div = createIfaceStatInfoDiv(
						teamId, appKey, name, servicesStr, metrics.join(","));
                    $('#config-iface-stats').append(div);
					dialog.modal('hide');
				} else {
					alert(data.data);
				}
			});
         });
    }

    /**
     * 删除某个Iface异常配置
     */
     function bindIfaceStatDelBtnEvent(ifaceStatDiv, teamId) {
		ifaceStatDiv.find('.config-iface-stat-del').on("click", document, function(){
			var appKey = ifaceStatDiv.find('.config-header-appkey').text();

       		if (!confirm('确认删除?')) {
     		   return;
    		}

            $.post('/monitor/healthcheck/delifacestatcfg', {
                teamId : teamId,
                appKey : appKey,
            }, function(json) {
            	var data = JSON.parse(json);
            	if (data.result == 'success') {
            		// 在页面上删除
					ifaceStatDiv.remove();
				} else {
					alert('删除失败!');
				}
			});
		});
     }

	/**
     * 编辑某个Iface异常配置
     */
     function bindIfaceStatEditBtnEvent(ifaceStatDiv, teamId) {
			ifaceStatDiv.find('.config-iface-stat-edit').on("click", document, function(){
			var appKey = ifaceStatDiv.find('.config-header-appkey').text();
			var name = ifaceStatDiv.find('.config-header-title').text();

			var dialog = $('.iface-stat-cfg-dialog-template').clone();
			dialog.removeClass('iface-stat-cfg-dialog-template');
			dialog.find('.form-field-appkey').val(appKey);
			dialog.find('.form-field-appkey').attr("disabled", "disabled");
			dialog.find('.form-field-name').val(name);

			$.get('/monitor/healthcheck/getifacestatcfg4App', {
				teamId : teamId,
    			appKey : appKey
    		}, function(json) {
				var data = JSON.parse(json);
				if (data.result == 'success') {
					var services = data.data.services;
					var servicesStr = services.join();
					dialog.find('.form-field-serivces').val(servicesStr);
				} else {
					alert('同步appkey的Services数据失败');
				}
    		});

			// 初始化tooltip
			dialog.find('[data-toggle="tooltip"]').tooltip()

			bindSyncIfaceStatServicesBtnEvent(dialog);
			bindIfaceStatUpdateBtnEvent(dialog, teamId);
			dialog.modal('show');
		});
     }

	function bindIfaceStatUpdateBtnEvent(dialog, teamId) {
		dialog.find('.form-btn-save').on('click', function() {
            var appKey = dialog.find('.form-field-appkey').val();
            var name = dialog.find('.form-field-name').val();
			var servicesStr = dialog.find('.form-field-serivces').val();
			if (appKey=="" || name=="" || servicesStr=="") {
    			alert("参数不能为空!");
    			return;
    		}

			var services = servicesStr.split(',');

			var metrics = [];
			var metricLabels = dialog.find('.form-field-metrics');
			for (var i=0; i<metricLabels.length; i++) {
    			metrics.push(metricLabels[i].innerHTML);
			}

            $.post('/monitor/healthcheck/updateifacestatcfg', {
                teamId : teamId,
                appKey : appKey,
                name : name,
                services: JSON.stringify(services),
                metrics: JSON.stringify(metrics),
            }, function(json) {
            	var data = JSON.parse(json);
            	if (data.result == 'success') {
            		// 更新页面
					var appKeySpan = $('#config-iface-stats').find("span:contains('"+appKey+"')");
                	appKeySpan.text(appKey);

                	var appTitleSpan = appKeySpan.parents('.config-item').find('.config-header-title');
					appTitleSpan.text(name);

					dialog.modal('hide');
				} else {
					alert('更新失败,该appkey已经存在!');
				}
			});
        });
	}


	//
	// iface stat threhold
	//

	/**
	 * 编辑某个Iface阈值配置
	 */
	function bindIfaceStatThreholdCfgBtnEvent(ifaceStatDiv, teamId) {
		ifaceStatDiv.find('#config-iface-stat-threhold-cfg').on("click", document, function(){
			var appKey = ifaceStatDiv.find('.config-header-appkey').text();
			var name = ifaceStatDiv.find('.config-header-title').text();
			var servicesStr = ifaceStatDiv.find('.config-header-services').text();
			//var metricsStr = ifaceStatDiv.find('.config-header-metrics').text();

			$.get('/monitor/healthcheck/getifacestatthreholdcfgs4app', {
				teamId : teamId,
				appKey : appKey
			}, function(json) {
				var data = JSON.parse(json);
				if (data.result == 'success') {
					var dialog = $('.iface-stat-threhold-edit-cfg-dialog-template').clone();
					dialog.removeClass('iface-stat-threhold-edit-cfg-dialog-template');
					dialog.find('.form-field-appkey').val(appKey);
					dialog.find('.form-field-name').val(name);
					dialog.find('.form-field-serivces').val(servicesStr);

					var serviceThreholdCfgs = data.data;
					drawServiceThreholdCfgsTable(serviceThreholdCfgs, dialog);

					// 初始化tooltip
					dialog.find('[data-toggle="tooltip"]').tooltip()

					bindSyncServiceThreholdCfgsBtnEvent(dialog, teamId);
					bindServiceThreholdCfgsSubmitBtnEvent(dialog, teamId);

					dialog.modal('show');
				} else {
					alert("服务器错误");
				}
			});
		});
	}

	function drawServiceThreholdCfgsTable(serviceThreholdCfgs, dialog) {
		if (serviceThreholdCfgs == null)
			return;

		serviceThreholdCfgs.forEach(function(serviceThreholdCfg, i) {
			var service4Show = "";
			var iface4Show = "";

			var service = serviceThreholdCfg.service;
			var ifaceThreholdCfgs = serviceThreholdCfg.ifaceThreholdCfgs;
			ifaceThreholdCfgs.forEach(function(ifaceThreholdCfg, j) {
				var ifaceThreholdCfg = ifaceThreholdCfgs[j];
				var iface = ifaceThreholdCfg.iface;
				var metricThreholdCfgs = ifaceThreholdCfg.metricThreholdCfgs;

				if (j == 0) {
					service4Show = service;
				} else {
					service4Show = "";
				}

				var tbody = dialog.find('#iface-threhold-cfgs-table-tbody');
				metricThreholdCfgs.forEach(function(metricThreholdCfg, k) {
					var metric = metricThreholdCfg.metric;
					var tValue = metricThreholdCfg.tValue;

					if (k == 0) {
						iface4Show = iface;
					} else {
						iface4Show = "----";
						service4Show = "";
					}

					var cfgTr = $("#iface-threhold-cfgs-template").clone();
					cfgTr.removeAttr('id');
					cfgTr.show();

					// data for show
					cfgTr.find('.service').text(service4Show);
					cfgTr.find('.iface').text(iface4Show);

					// data for use
					cfgTr.find('.service').attr("data-service", service);
					cfgTr.find('.iface').attr("data-iface", iface);
					cfgTr.find('.metric').text(metric);
					cfgTr.find('.threhold').find('.form_field_threhold').val(tValue);

					tbody.append(cfgTr);
				});
			});
		});
	}

	function bindSyncServiceThreholdCfgsBtnEvent(dialog, teamId) {
		dialog.find('.form-btn-sync-service-threhold-cfg').on('click', function(){
			var appkey = dialog.find('.form-field-appkey').val();

			$.get('/monitor/healthcheck/syncservicethreholdcfgs4app', {
                teamId : teamId,
                appKey : appkey
            }, function(json){
                var data = JSON.parse(json);
                if(data.result == 'success') {

					dialog.find('#iface-threhold-cfgs-table-tbody').empty();

                    // 同步指标名称
					var serviceThreholdCfgs = data.data;
					drawServiceThreholdCfgsTable(serviceThreholdCfgs, dialog);

                    // 初始化tooltip
                	dialog.find('[data-toggle="tooltip"]').tooltip()

                	dialog.modal('show');
                } else {
                	alert('同步web数据失败');
                }
            });
		});
	}

	function bindServiceThreholdCfgsSubmitBtnEvent(dialog, teamId) {
		dialog.find('.form-btn-save').on('click', function(){
			var appKey = dialog.find('.form-field-appkey').val();

			var serviceThreholdCfgMap = {};
			dialog.find(".iface-threhold-cfgs").each(function(i, obj) {
				var service = $(obj).find(".service").data("service");
    			var iface = $(obj).find(".iface").data("iface");
    			var metric = $(obj).find(".metric").text();
    			var threhold = $(obj).find(".threhold").find(".form_field_threhold").val();

				// 过滤display=none的iface-threhold-cfgs-template(临时办法)
				if (service == null || service == "")
					return;

				var metricThreholdCfg = {
					"metric" : metric,
					"tType" : 3,
					"tValue" : threhold
				};

				var ifaceThreholdCfgMap = serviceThreholdCfgMap[service];
				if (ifaceThreholdCfgMap == null) {
					ifaceThreholdCfgMap = {};
					serviceThreholdCfgMap[service] = ifaceThreholdCfgMap;
				}

				var metricThreholdCfgs = ifaceThreholdCfgMap[iface];
				if (metricThreholdCfgs == null) {
					metricThreholdCfgs = new Array();
					ifaceThreholdCfgMap[iface] = metricThreholdCfgs;
				}
				metricThreholdCfgs.push(metricThreholdCfg);
			});

			var serviceThreholdCfgs = [];
			for (var serviceKey in serviceThreholdCfgMap) {
  				if (!serviceThreholdCfgMap.hasOwnProperty(serviceKey)) {
    				continue;
  				}

				var ifaceThreholdCfgs = new Array();

				var ifaceThreholdCfgMap = serviceThreholdCfgMap[serviceKey];
				for (var ifaceKey in ifaceThreholdCfgMap) {
					if (!ifaceThreholdCfgMap.hasOwnProperty(ifaceKey)) {
    					continue;
  					}

  					var ifaceThreholdCfg = {};
  					ifaceThreholdCfg["iface"] = ifaceKey;
  					ifaceThreholdCfg["metricThreholdCfgs"] = ifaceThreholdCfgMap[ifaceKey];

  					ifaceThreholdCfgs.push(ifaceThreholdCfg);
				}

				var serviceThreholdCfg = {};
				serviceThreholdCfg["service"] = serviceKey;
				serviceThreholdCfg["ifaceThreholdCfgs"] = ifaceThreholdCfgs;

				serviceThreholdCfgs.push(serviceThreholdCfg);
			}

			if (serviceThreholdCfgs.length == 0) {
				alert("阈值不能为空,请先同步阈值再保存");
				return;
			}

			$.post('/monitor/healthcheck/saveorupdateservicethreholdcfgs4app', {
    	        teamId : teamId,
        	    appKey : appKey,
            	serviceThreholdCfgs: JSON.stringify(serviceThreholdCfgs)
        	}, function(json) {
           		var data = JSON.parse(json);
           		if (data.result == 'success') {
					dialog.modal('hide');
				} else {
					alert("保存阈值配置失败("+data.data+")!");
				}
			});
		});
	}

});
</script>
