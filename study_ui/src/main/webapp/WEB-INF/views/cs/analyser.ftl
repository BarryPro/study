<!-- 问题解决方案弹窗 -->
<div class="biz-logic-dialog-template modal fade" tabindex="-1" role="dialog" aria-labelledby="modal-title" style="display: none">
    <div class="modal-dialog" role="document" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">问题智能诊断</h4>
            </div>

            <div class="modal-body">

                <!-- Requirement params -->
                <div class="container-fluid">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>参数录入 <small></small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <form id="requirement-form" data-parsley-validate class="form-horizontal form-label-left">
                                <div id="requirement-str-input-div" class="form-group">
                                    <label class="requirement-formm-label col-sm-3 control-label">订单Id:</label>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input id="requirement-form-input" type="text" class="form-control">
                          					<span class="input-group-btn">
                                            	<button id="requirement-form-button" type="button" class="btn btn-primary">诊断</button>
                                        	</span>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- error -->
                <div id="answer-error-div" class="answer-error-div container-fluid" style="display: none">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>错误 <small></small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div id="answer-error-content-div" class="alert alert-danger alert-dismissible fade in" role="alert">
                                <strong><span id="answer-error-span"></span></strong>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- conclusion -->
                <div id="conclusion-div" class="conclusion-div container-fluid" style="display: none">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>结论 <small></small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="alert alert-success alert-dismissible fade in" role="alert">
                                <strong><span id="conclusion-span"></span></strong>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- wiki -->
                <div id="wiki-div" class="wiki-div container-fluid" style="display: none;">
                    <div class="x_panel">
                        <a id="wiki-href" href="javascript:void(0)" style="text-decoration:none;">
                            <h4 class="panel-title"><i id="wiki-href-i" class="fa fa-plus-square-o"></i> 业务逻辑说明</h4>
                        </a>
                        <div id="wiki-iframe-div" class="" role="tabpanel" style="display: none">
                            <iframe id="wiki-iframe" src=""
                                    width="100%" height="500px" marginheight="0" frameborder="0">
                            </iframe>
                        </div>
                    </div>
                </div>

                <!-- proof-datas -->
                <div id="proof-datas-div" class="proof-datas-div container-fluid" style="display: none;">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>数据证明</h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <ul id="proof-datas-ul" class="to_do">
                                <li id="proff-datas-li" style="display: none"></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- messure - suggestion -->
                <div id="messure-suggestion-div" class="messure-suggestion-div container-fluid" style="display: none;">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>解决建议</h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="alert alert-info alert-dismissible fade in" role="alert">
                                <strong><span id="messure-suggestion-content-span"></span></strong>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- messure - resolver -->
                <div id="messure-resolver-div" class="messure-resolver-div container-fluid" style="display: none;">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>一键化解决 <small></small></h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="form-group">
                                <div class="">
                                    <button id="messure-resolver-form-button" type="button"
											class="btn btn-info btn-lg"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>