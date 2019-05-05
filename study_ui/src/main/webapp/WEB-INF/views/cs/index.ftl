<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Home</title>

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
				<h3>订单客服门户页</h3>
            </div>
		</div>
        <#-- env selector -->
        <div id="env_selector" class="btn-group btn-group-sm" style="float: right">
            <a href="http://order-admin.waimai.sankuai.com/cs/" class="btn btn-default" type="button">线上</a>
            <a href="http://10.21.170.71:8433/cs/" class="btn btn-default" type="button">线下</a>
            <a href="http://10.20.119.33:8433/cs/" class="btn btn-default" type="button">test</a>
            <a href="http://10.4.243.155:8433/cs/" class="btn btn-default" type="button">&nbsp;beta&nbsp;</a>
            <a href="http://orderadmin.waimai.st.sankuai.com/cs/" class="btn btn-default" type="button">备机</a>
            <#--<a href="http://127.0.0.1:8080/cs/" class="btn btn-default" type="button">本地</a>-->
        </div>
		<div class="clearfix"></div>

		<div class="row">

            <!-- 订单中心数据操作工具 -->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2><i class="fa fa-wrench"></i> 订单常用工具汇总</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="accordion" id="accordion3" role="tablist">
                            <div class="panel">
                                <a class="panel-heading collapsed" role="tab" id="headingSecond" data-toggle="collapse" data-parent="#accordion" href="#collapseThird" aria-expanded="false" aria-controls="collapseThird">
                                    <h4 class="panel-title">常用操作工具</h4>
                                </a>
                                <div id="collapseThird" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSecond">
                                    <div class="panel-body">
                                        <table id="order-utils-table" class="table table-striped">
                                            <tbody id="order-utils-tbody">

                                            <tr id="order-utils-tr" style="display: none">
                                                <th scope="row" class="id" data-id="">1</th>
                                                <td class="name">sdfsdfsdfs</td>
                                                <td>
                                                    <button type="button" style="margin-bottom: 3px"
                                                            class="btn btn-primary btn-xs form-btn-order-utils-dialog">
                                                        使用</button>
                                                </td>
                                            </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 订单中心业务逻辑汇总 -->
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2><i class="fa fa-book"></i> 订单中心业务逻辑汇总 <small>(建议使用ctrl+F搜索)</small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="accordion" id="accordion1" role="tablist">
                            <div class="panel">
                                <a class="panel-heading collapsed" role="tab" id="headingSecond" data-toggle="collapse" data-parent="#accordion" href="#collapseSecond" aria-expanded="false" aria-controls="collapseSecond">
                                    <h4 class="panel-title">业务逻辑列表</h4>
                                </a>
                                <div id="collapseSecond" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSecond">
                                    <div class="panel-body">
                                        <table id="order-logics-table" class="table table-striped">
                                            <tbody id="order-logics-tbody">

                                            <tr id="order-logics-tr" style="display: none">
                                                <th scope="row" class="id" data-id="">1</th>
                                                <td class="name">sdfsdfsdfs</td>
                                                <td>
                                                    <button type="button" style="margin-bottom: 3px"
                                                            class="btn btn-primary btn-xs form-btn-order-logics-dialog">
                                                        查阅</button>
                                                </td>
                                            </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

			<!-- 常见问题汇总 -->
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2><i class="fa fa-align-left"></i> 常见问题汇总 <small>(建议使用ctrl+F搜索)</small></h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<div class="accordion" id="accordion" role="tablist">
							<div class="panel">
								<a class="panel-heading collapsed" role="tab" id="headingOne" style="text-decoration:none;" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
									<h4 class="panel-title"><i class="fa fa-angle-double-down"></i> 问题列表</h4>
								</a>
								<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<table id="common-biz-logics" class="table table-striped">
											<thead>
											<tr>
												<th>#</th>
												<th>问题描述</th>
												<th>诊断工具</th>
												<!--<th>Username</th>-->
											</tr>
											</thead>
											<tbody id="common-biz-logics-tbody">

											<tr id="common-biz-logics-tr" style="display: none">
												<th scope="row" class="id" data-id=""></th>
												<td class="name"></td>
												<td>
													<button type="button" style="margin-bottom: 3px"
															class="btn btn-primary btn-xs form-btn-solution-dialog">
														诊断</button>
												</td>
											</tr>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 人工客服 -->
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2><i class="fa fa-user-md"></i> 人工客服</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>

					<div class="x_content">
                        <p>记录问题，稍后由订单中心RD人工进行答复</p>

                        <div id="wizard_verticle" class="form_wizard wizard_verticle">
                            <ul class="list-unstyled wizard_steps anchor">
                                <li>
                                    <a href="#step-11" class="selected" isdone="1" rel="1">
                                        <span class="step_no">1</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#step-22" class="disabled" isdone="0" rel="2">
                                        <span class="step_no">2</span>
                                    </a>
                                </li>
                            </ul>

                            <div class="stepContainer">
                                <div id="step-11" class="wizard_content" style="display: block;">
                                    <h2 class="StepTitle">1. 是否有现成工具可解决问题?</h2>
                                    <p>请核实本页面是否已有工具可以解决您当前问题。(本门户页集成了订单中心常见业务逻辑和问题解决方法)</p>
                                </div>
                                <div id="step-22" class="wizard_content" style="display: none;">
                                    <h2 class="StepTitle">2. 填写问题简要描述</h2>
                                    <p>请用简洁话语描述当前问题。问题提交后订单中心RD会第一时间与您联系，进行解决。</p>
                                    <button id="question-btn" type="button" class="btn btn-info btn-lg"> 反馈问题 </button>
                                </div>
                            </div>
                        </div>
						<!-- End SmartWizard Content -->
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

<!-- 自定义弹窗 -->
<#include "analyser.ftl">
<#include "logics.ftl">
<#include "question-form.ftl">

<#include "../common/allscripts.ftl">

<!-- self define -->
<script src="/static/js/admin/cs/biz-logic-solution.js"></script>
<script src="/static/js/admin/cs/order-logics.js"></script>
<script src="/static/js/admin/cs/question-form.js"></script>

<#-- Wizard -->
<script type="text/javascript" src="/static/js/wizard/jquery.smartWizard.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        // Smart Wizard
        $('#wizard').smartWizard();
    });

    $(document).ready(function() {
        // Smart Wizard
        $('#wizard_verticle').smartWizard({
            transitionEffect: 'slide',
            labelNext: '下一步',
            labelPrevious: '上一步',
            includeFinishButton: false
        });

    });
</script>


<script type="text/javascript">
$(function () {

    /**
     * env selector
     */
    var currentHost = window.location.hostname;
    $('#env_selector').find('a').each(function() {
        if (this.href.indexOf(currentHost) != -1) {
            $(this).removeClass();
            $(this).addClass('btn btn-primary');
        }
    });

    /**
     * load all utils
     */
    $.ajax({
        url: "/cs/getorderopenutils",
        data: {},
        type: "json",
        method: "get",
        success: function (data) {
            var _data = $.parseJSON(data);
            var msg = _data.result;
            if (msg == "failed") {
                return alert(_data.data);
            }
            var utils = _data.data;
            showOrderOpenUtils(utils);
        },
        error: function (err) {
            alert("获取常用工具出错!" + err.msg);
        }
    });

    function showOrderOpenUtils(utils) {
        var utilHost = window.location.host;

        utils.forEach(function(util, i) {
            var tr = $('#order-utils-tr').clone();
            tr.removeAttr('id');
            tr.show();

            tr.find('.id').text(i);
            tr.find('.name').text(util.desc);

            tr.find('.form-btn-order-utils-dialog').on("click", function() {
                window.open('http://'+utilHost + util.uri);
            });
            $('#order-utils-tbody').append(tr);
        });
    }

    /**
     * load all order logics
     */
    $.ajax({
        url: "/cs/getorderlogicwikis",
        data: {},
        type: "json",
        method: "get",
        success: function(data){
            var _data = $.parseJSON(data);
            var msg = _data.result;
            if (msg == "failed") {
                alert(_data.data);
                return;
            }
            var wikis = _data.data;
            showOrderLogicWikis(wikis);
        },
        error: function(err){
            alert("获取常见业务逻辑出错!" + err.msg);
        }
    });

    function showOrderLogicWikis(wikis) {
        wikis.forEach(function(wiki, i) {
            var tr = $('#order-logics-tr').clone();
            tr.removeAttr('id');
            tr.show();

            tr.find('.id').text(i);
            tr.find('.id').attr("data-id", wiki.wikiId);
            tr.find('.name').text(wiki.desc);

            var wikiPageUrl = "http://wiki.sankuai.com/pages/viewpage.action?pageId=";
            tr.find('.form-btn-order-logics-dialog').on("click", function() {
                if (wiki.isBigPage) {
                    window.open(wikiPageUrl+wiki.wikiId);
                    return false;
                } else {
                    drawOrderLogicDialog(wiki);
                }
            });
            $('#order-logics-tbody').append(tr);
        });
    }

    /**
     * load all common logics problems
     */
    $.ajax({
        url: "/cs/getcommonbizlogics",
        data: {},
        type: "json",
        method: "get",
        success: function(data){
            var _data = $.parseJSON(data);
            var msg = _data.result;
            if (msg == "failed") {
                alert(_data.data);
                return;
            }
            var logicses = _data.data;
            showCommonBizLogics(logicses);
        },
        error: function(err){
            alert("获取常见业务问题出错!" + err.msg);
        }
    });

    function showCommonBizLogics(logicses) {
        logicses.forEach(function(logic, i) {
            var tr = $('#common-biz-logics-tr').clone();
            tr.removeAttr('id');
            tr.show();

            tr.find('.id').text(i);
            tr.find('.id').attr("data-id", logic.id);
            tr.find('.name').text(logic.name);

            tr.find('.form-btn-solution-dialog').on("click", function() {
                drawSolutionDialog(logic.id);
            });
            $('#common-biz-logics-tbody').append(tr);
        });
    }

    /**
     * human cs
     */
    $('#question-btn').on("click", function() {
        showQuestionForm();
    });


});
</script>

</body>

</html>