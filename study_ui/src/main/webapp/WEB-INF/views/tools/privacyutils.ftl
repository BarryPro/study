<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>三方服务工具</title>

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
                    <h3>三方服务工具</h3>
                </div>
            </div>
            <div class="clearfix"></div>


            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>隐私号开城工具</h2>
                            <div class="clearfix"></div>
                        </div>

                        <div class="x_content">

                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal col-lg-12 privacyphone-cfg-form">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">地区名称</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control privacyphone-cfg-form-field-cityName"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">城市id前缀</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control privacyphone-cfg-form-field-cityId"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">运营商</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                            <#--<input type="text" class="form-control privacyphone-cfg-form-field-isp"/>-->
                                                <select name="channel" class="form-control privacyphone-cfg-form-field-isp">
                                                    <option selected value="ZHONGLIAN">中联</option>
                                                    <option value="DONGXIN">东信</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">号池区号</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control privacyphone-cfg-form-field-areaCode"/>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="privacyphone-cfg-add-button" type="button" class="btn btn-primary form-btn-save">新增</button>
                            </div>

                            <div id="privacyphone-cfgs-show-div">
                                <table id="privacyphone-cfg-table" class="table table-striped privacyphone-cfg-table" style="display: none">
                                    <thead>
                                    <tr>
                                        <th>地区名称</th>
                                        <th>城市id(前缀)</th>
                                        <th>运营商</th>
                                        <th>号池区号</th>
                                        <th>灰度比例</th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>隐私号灰度工具</h2>
                            <div class="clearfix"></div>
                        </div>

                        <div class="x_content">
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal col-lg-12 privacyphone-grey-form">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">城市id前缀</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control privacyphone-grey-form-field-cityId"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">灰度比例</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control privacyphone-grey-form-field-scale"/>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="privacyphone-grey-update-button" type="button" class="btn btn-primary form-btn-save">灰度变更</button>
                                <button id="privacyphone-default-select-update-button" type="button" class="btn btn-primary form-btn-save">默认开启变更</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>隐私号黑名单工具</h2>
                            <div class="clearfix"></div>
                        </div>

                        <div class="x_content">
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal col-lg-12 privacyphone-grey-form">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">城市id前缀</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control privacyphone-school-blacklist-form-field-cityId"/>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="privacyphone-school-blacklist-update-button" type="button" class="btn btn-primary form-btn-save">新增</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>隐私号降级工具</h2>
                            <div class="clearfix"></div>
                        </div>

                        <div class="x_content">
                            <div id="privacyphone-greys-show-div">
                                <table id="privacyphone-grey-table" class="table table-striped privacyphone-grey-table" style="display: none">
                                    <thead>
                                    <tr>
                                        <th>供应商操作</th>
                                        <th>城市id[前缀]</th>
                                        <th>城市名称</th>
                                        <th>号池区号</th>
                                        <th>灰度比例</th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                    <tfoot>

                                    </tfoot>
                                </table>
                                <label>提示</label>
                                <small style="padding: 5px" >
                                    <input type="button" style="background-color: orange;margin: 5px" class="privacy_btn_cricle"/><i style="color: orange">橙色：新订单降级的城市</i>
                                    <input type="button" style="background-color: #cac7c7;margin: 5px" class="privacy_btn_cricle"/><i style="color: #cac7c7">灰色： 全链路降级的城市</i>
                                    <input type="button" style="background-color: #d0c32f;margin: 5px" class="privacy_btn_cricle"/><i style="color: #d0c32f">浅黄： 本次要操作的城市</i>
                                </small>
                                <hr/>
                                <div>

                                    <label>快速勾选操作</label>
                                    <button id="privacyphone-zhonglian-button" type="button"
                                            class="privacy_btn_info privacy_btn_opt">中联
                                    </button>
                                    <button id="privacyphone-dongxin-button" type="button"
                                            class="privacy_btn_info privacy_btn_opt">东信
                                    </button>
                                    <button id="privacyphone-reset-button" type="button"
                                            class="privacy_btn_info privacy_btn_opt">重置
                                    </button>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button id="privacyphone-binding-downgrade-update-button" type="button"
                                        class="privacy_btn_info privacy_btn_opt">新订单切换
                                </button>
                                <button id="privacyphone-binding-calling-downgrade-update-button" type="button"
                                        class="privacy_btn_info privacy_btn_opt">全链路切换
                                </button>
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

        /**
         * 隐私号统一降级
         */
        $('#privacyphone-degrade-form-button').on("click", function() {
            var prefixCityid = $('#privacyphone-prefixcityid-form-input').val();
            var cityIds = $('#privacyphone-cityids-form-input').val();

            if (!prefixCityid && !cityIds) {
                return alert("至少填写一个参数!");
            }

            $.ajax({
                url: "/tools/thirdutils/degrade",
                data: {
                    "prefixCityId": prefixCityid,
                    "cityIds": cityIds
                },
                type: "json",
                method: "post",
                success: function(data){
                    var _data = $.parseJSON(data);
                    var msg = _data.result;
                    if (msg == "failed") {
                        return alert(_data.data);
                    } else {
                        return alert("成功");
                    }

                },
                error: function(err){
                    return alert("js查询订单服务出错!");
                }
            });
        });

        $('#privacyphone-cfg-add-button').on("click", document, function(){
            var cityAreaName = $(".privacyphone-cfg-form-field-cityName").val();
            var cityIdPrefix = $(".privacyphone-cfg-form-field-cityId").val();
            var isp = $(".privacyphone-cfg-form-field-isp").val();
            var areaCode = $(".privacyphone-cfg-form-field-areaCode").val();

            if (!cityAreaName || !cityIdPrefix || !isp || !areaCode) {
                return alert("参数不能为空!");
            }

            $.post('/tools/privacyutils/addopencitycfg', {
                cityAreaName: cityAreaName,
                cityIdPrefix: cityIdPrefix,
                isp: isp,
                phonePoolAreaCode: areaCode
            }, function(json) {
                var data = JSON.parse(json);
                if (data.result != 'success') {
                    return alert(data.data)
                } else {
                    alert("添加成功");

                    // clear
                    $('.privacyphone-cfg-table').each(function (i, obj) {
                        if (obj.style.display != "none")
                            obj.remove();
                    });
                    _showOpenCityCfgs();
                }
            });
        });

        function _fillPrivacyCfgsTable(table, cfgList) {
            var tbody = table.find("tbody");

            cfgList.forEach(function (obj, i) {
                var tr = document.createElement("tr");
                tr.append(_genTd(obj.cityAreaName));
                tr.append(_genTd(obj.cityIdPrefix));
                tr.append(_genTd(obj.ispName));
                tr.append(_genTd(obj.phonePoolAreaCode));
                tr.append(_genTd(obj.greyScale));
                tbody.append(tr);
            });
        }

        function _genTd(value) {
            var td = document.createElement("td");
            td.innerHTML = value;
            return td;
        }


        /**
         * 配置隐私号灰度城市比例
         */
        _showGreyCityCfgs();

        $('#privacyphone-grey-update-button').on("click", document, function(){
            var cityIdPrefix = $(".privacyphone-grey-form-field-cityId").val();
            var scale = $(".privacyphone-grey-form-field-scale").val();

            if (!cityIdPrefix || !scale) {
                return alert("参数不能为空!");
            }

            $.post('/tools/privacyutils/addgreycitycfg', {
                cityIdPrefix: cityIdPrefix,
                scale: scale
            }, function(json) {
                var data = JSON.parse(json);
                if (data.result != 'success') {
                    return alert(data.data)
                } else {
                    alert("更新成功");
                    $(".privacyphone-grey-form-field-cityId").val("");
                    $(".privacyphone-grey-form-field-scale").val("");
                    // clear
                    $('.privacyphone-grey-table').each(function (i, obj) {
                        if (obj.style.display != "none")
                            obj.remove();
                    });
                    _showGreyCityCfgs();
                }
            });
        });

        // 用户默认勾选快速配置
        $('#privacyphone-default-select-update-button').on("click", document, function(){
            var cityIdPrefix = $(".privacyphone-grey-form-field-cityId").val();
            var scale = $(".privacyphone-grey-form-field-scale").val();

            if (!cityIdPrefix || !scale) {
                return alert("参数不能为空!");
            }

            $.post('/tools/privacyutils/adddefaultopencitycfg', {
                cityIdPrefix: cityIdPrefix,
                scale: scale
            }, function(json) {
                var data = JSON.parse(json);
                if (data.result != 'success') {
                    return alert(data.data)
                } else {
                    alert("更新成功");
                    $(".privacyphone-grey-form-field-cityId").val("");
                    $(".privacyphone-grey-form-field-scale").val("");
                    // clear
                    $('.privacyphone-grey-table').each(function (i, obj) {
                        if (obj.style.display != "none")
                            obj.remove();
                    });
                    _showGreyCityCfgs();
                }
            });
        });

        // 修改校园黑名单配置
        $('#privacyphone-school-blacklist-update-button').on("click", document, function(){
            var cityIdPrefix = $(".privacyphone-school-blacklist-form-field-cityId").val();

            if (!cityIdPrefix) {
                return alert("参数不能为空!");
            }

            $.post('/tools/privacyutils/addschoolblacklist', {
                cityIdPrefix: cityIdPrefix
            }, function(json) {
                var data = JSON.parse(json);
                if (data.result != 'success') {
                    return alert(data.data)
                } else {
                    alert("更新成功");
                    $(".privacyphone-school-blacklist-form-field-cityId").val("")
                    // clear
                    $('.privacyphone-grey-table').each(function (i, obj) {
                        if (obj.style.display != "none")
                            obj.remove();
                    });
                    _showGreyCityCfgs();
                }
            });
        });

        var global_supplier_cityId_set = new Set();
        // 查询隐私号配置
        function _showGreyCityCfgs() {
            $.ajax({
                url: "/tools/privacyutils/getgreycitycfgs",
                type: "json",
                method: "get",
                success: function(data){
                    var _data = $.parseJSON(data);
                    var msg = _data.result;
                    if (msg == "failed") {
                        return alert(_data.data);
                    }

                    var cfgList = _data.data;
                    if (!cfgList) {
                        return;
                    }

                    var showTableDiv = $('#privacyphone-greys-show-div');
                    var table = showTableDiv.find('#privacyphone-grey-table').clone();
                    table.removeAttr('id');
                    table.show();
                    _fillPrivacyGreyCfgsTable(table, cfgList);
                    showTableDiv.append(table);
                },
                error: function(err){
                    console.log("请求小组信息出错" + err.msg);
                }
            });
        }

        // 降级后台颜色管理
        var orderDegrade = "orange"; // 表示新订单降级的城市
        var fullDegrade = "#cac7c7"; // 表示全链路降级的城市
        var btnNormal = "#337ab7"; // 操作按钮正常的颜色
        var preSelect = "#d0c32f"; // 表示预先选择的颜色
        // 供应商set
        var supplierSet = new Set(["东信","中联"]);

        // 新订单降级
        $('#privacyphone-binding-downgrade-update-button').on('click', function(){

            // 供应商检测
            if(global_supplier_cityId_set.size == 0){
                return alert('请选择需要切换的供应商！');
            }

            var downgradeCities;
            $('#privacyphone-binding-downgrade-update-button').css("backgroundColor",orderDegrade);
            if(confirm('请确认是否执行新订单降级？')){
                console.log(downgradeCities);
                // $.post('/tools/privacyutils/updateDegradeCitiesForBind', {"cityIdPrefixes" : downgradeCities}, function(data) {
                //     alert('更新成功');
                // });

                // 新订单降级操作后的供应商按钮标识
                $('button').each(function (i,e) {
                    if(global_supplier_cityId_set.has($(e).attr('id'))){
                        // 通过id获取单选框操作
                        var radioId = '#' + $(e).attr("value");
                        // 处理单选框与按钮的双重处理操作
                        if($(radioId).prop("checked")){
                            $(e).css("backgroundColor",orderDegrade);
                        } else {
                            $(e).css("backgroundColor",btnNormal);
                        }
                    }
                });

                // 清空供应商选项
                global_supplier_cityId_set.clear();

                // 清楚操作痕迹
                resetOptBtn();
            } else {
                resetBtn();
            }
        });

        // 全链路降级
        $('#privacyphone-binding-calling-downgrade-update-button').on('click', function(){

            // 供应商检测
            if(global_supplier_cityId_set.size == 0){
                return alert('请选择需要切换的供应商！');
            }

            var downgradeCities;
            $('#privacyphone-binding-calling-downgrade-update-button').css("backgroundColor",fullDegrade);
            if(confirm('请确认是否执行全链路降级？')){
                console.log(downgradeCities);
                // $.post('/tools/privacyutils/updateDegradeCitiesForBindAndCall', {"cityIdPrefixes" : downgradeCities}, function(data) {
                //     var result = JSON.parse(data);
                //     alert('调用结果:\n' + result.data);
                // });

                // 全链路降级操作后的供应商按钮标识
                $('button').each(function (i,e) {
                    if(global_supplier_cityId_set.has($(e).attr('id'))){
                        // 通过id获取单选框操作
                        var radioId = '#' + $(e).attr("value");
                        // 处理单选框与按钮的双重处理操作
                        if($(radioId).prop("checked")){
                            $(e).css("backgroundColor",fullDegrade);
                        } else {
                            $(e).css("backgroundColor",btnNormal);
                        }
                    }
                });

                // 清空供应商选项
                global_supplier_cityId_set.clear();

                // 清楚操作痕迹
                resetOptBtn();
            } else {
                resetBtn();
            }
        });

        function _fillPrivacyGreyCfgsTable(table, cfgList) {
            var tbody = table.find("tbody");

            cfgList.forEach(function (obj, i) {
                var tr = document.createElement("tr");
                // 模拟后端供应商数据
                var supList = new Array();
                supList[0] = "中联";
                supList[1] = "东信";
                var scaleList = new Array();
                scaleList[0] = "50";
                scaleList[1] = "50";
                tr.append(_getBtnTd(supList,i,scaleList,obj.cityIdPrefix));

                tr.append(_genTd(obj.cityIdPrefix));
                tr.append(_genTd(obj.cityName));
                tr.append(_genTd(obj.areaCode));
                tr.append(_genTd(obj.scale));
                tbody.append(tr);
            });
        }

        // 处理供应商与权值按钮
        function _getBtnTd(supList,index,scaleList,cityId){
            var td = document.createElement("td");
            for(var i = 0;i<supList.length;i++){
                var btn = document.createElement("button");
                if (scaleList.length > 0) {
                    btn.innerHTML = supList[i] + " : " + scaleList[i];
                    btn.style.borderRadius = "6px";
                    btn.style.backgroundColor = btnNormal;
                    btn.style.margin = "2px";
                    btn.style.color = "white"
                    btn.value = cityId;
                    btn.id = supList[i]+index;
                    btn.setAttribute("flag","0");
                    td.appendChild(btn)
                }
            }
            return td;
        }

        // 重试操作按钮颜色
        function resetOptBtn(){
            // 重置操作按钮
            $('#privacyphone-binding-downgrade-update-button').css("backgroundColor",btnNormal);
            $('#privacyphone-binding-calling-downgrade-update-button').css("backgroundColor",btnNormal);
            $('#privacyphone-dongxin-button').css("backgroundColor",btnNormal);
            $('#privacyphone-zhonglian-button').css("backgroundColor",btnNormal);
        }

        // 中联快速切换
        $('#privacyphone-zhonglian-button').click(function () {
            $('button').each(function (i,e) {
                if($(e).attr('id').match("中联")){
                    $(e).css("backgroundColor",preSelect);
                }
            });
            // 添加供应商到操作列表
            supplierSet.add("中联");
            $('#privacyphone-zhonglian-button').css("backgroundColor",preSelect);
        });

        // 东信快速勾选
        $('#privacyphone-dongxin-button').click(function () {
            $('button').each(function (i,e) {
                if($(e).attr('id').match("东信")){
                    $(e).css("backgroundColor",preSelect);
                }
            });
            // 添加供应商到操作列表
            supplierSet.add("东信");
            $('#privacyphone-dongxin-button').css("backgroundColor",preSelect);
        });

        // 操作重置
        $('#privacyphone-reset-button').click(function () {
            resetBtn();
        });

        // 按钮操作监控
        $('#privacyphone-greys-show-div').on("click","button",function () {
            var btnID = $(this).attr("id");
            var supplier = btnID.substr(0,2);
            if(supplierSet.has(supplier) && $(this).attr("flag") == "0"){
                var supplier_cityId = supplier+":"+ $(this).attr("value");
                global_supplier_cityId_set.add(supplier_cityId);
                $(this).css("backgroundColor", preSelect);
                $(this).attr("flag","1");
                console.log(global_supplier_cityId_set);
            } else if ($(this).attr("flag") == "1"){
                $(this).css("backgroundColor", btnNormal);
                global_supplier_cityId_set.delete($(this).attr("id"));
                console.log(global_supplier_cityId_set);
            }
        })

        // 重置函数
        function resetBtn(){
            $('.privacyphone-city-binding-downgrade').each(function (i, e) {
                $(e).prop("checked", false);
                $(e).attr("value", "block");
                $(e).attr("supplier", "");
            });

            // 重置的时候要删除以及操作的城市
            global_supplier_cityId_set.clear();
            $('button').each(function (i, e) {
                var supplier = $(e).attr("id").substr(0,2);
                if (supplierSet.has(supplier)) {
                    $(e).css("backgroundColor", btnNormal);
                }
            });
            // 重置操作按钮
            resetOptBtn();
            console.log(global_supplier_cityId_set);
        }
    });
</script>

</body>

</html>