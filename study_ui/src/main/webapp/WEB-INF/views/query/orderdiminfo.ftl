<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>其他维度查询</title>

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
                        <h3>不同维度查询</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>根据支付号查询工具 <small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
							<#if error_payid??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_payid!}
                            </div>
							</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/query/orderotherdiminfo/querybypayid" method="post">
                                    <div class="form-group">
                                        <label for="orderId" class="control-label col-md-3 col-sm-3 col-xs-12">支付交易号 <span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="payId" name="payId" class="form-control col-md-7 col-xs-12"
                                                   placeholder="支付out_no" value="${payId!}"/>
                                        </div>
                                        <div class="clearfix"></div>
                                        <br />
                                    <div class="ln_solid"></div>
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </div>
                                </form>
								<#if result_payid??>
                                    <div class="x_panel" style="overflow: scroll">
                                        <div class="x_title">
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
                                            <h4 class="sub-header" style="color: green;margin-left: 393px;">订单支付表</h4>
                                            <table class="table table-orderPayRecords">
                                                <thead>
                                                <tr>
                                                    <th>id</th>
                                                    <th>wm_poi_id</th>
                                                    <th>wm_order_id</th>
                                                    <th>trade_no</th>
                                                    <th>user_id</th>
                                                    <th>pay_account</th>
                                                    <th>pay_type</th>
                                                    <th>pay_route</th>
                                                    <th>pay_method</th>
                                                    <th>bank_type</th>
                                                    <th>pay_total</th>
                                                    <th>pay_time</th>
                                                    <th>pay_expire</th>
                                                    <th>status</th>
                                                    <th>reason</th>
                                                    <th>wm_order_ip</th>
                                                    <th>wm_order_uuid</th>
                                                    <th>ctime</th>
                                                    <th>utime</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th>${orderPayRecord.id}</th>
                                                        <th>${orderPayRecord.wm_poi_id}</th>
                                                        <th>${orderPayRecord.wm_order_id}</th>
                                                        <th>${orderPayRecord.trade_no!}</th>
                                                        <th>${orderPayRecord.user_id}</th>
                                                        <th>${orderPayRecord.pay_account!}</th>
                                                        <th>${orderPayRecord.pay_type!}</th>
                                                        <th>${orderPayRecord.pay_route!}</th>
                                                        <th>${orderPayRecord.pay_method!}</th>
                                                        <th>${orderPayRecord.bank_type!}</th>
                                                        <th>${orderPayRecord.pay_total?c}</th>
                                                        <th>${orderPayRecord.pay_time}<br/>[${orderPayRecord.pay_time_view}]</th>
                                                        <th>${orderPayRecord.pay_expire}</th>
                                                        <th>${orderPayRecord.status}</th>
                                                        <th>${orderPayRecord.reason!}</th>
                                                        <th>${orderPayRecord.wm_order_ip}</th>
                                                        <th>${orderPayRecord.wm_order_uuid!}</th>
                                                        <th>${orderPayRecord.ctime}<br/>[${orderPayRecord.ctime_view}]</th>
                                                        <th>${orderPayRecord.utime}<br/>[${orderPayRecord.utime_view}]</th>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
								</#if>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>根据申请退款号查询工具 <small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        <#if error_applyid??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_applyid!}
                            </div>
                        </#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/query/orderotherdiminfo/querybyapplyrefundid" method="post">
                                    <div class="form-group">
                                        <label for="orderId" class="control-label col-md-3 col-sm-3 col-xs-12">申请退款表ID<span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="applyRefundId" name="applyRefundId" class="form-control col-md-7 col-xs-12"
                                                   placeholder="申请退款表ID" value="${applyRefundId!}"/>
                                        </div>
                                        <div class="clearfix"></div>
                                        <br />
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </div>
                                </form>
                            <#if result_applyid??>
                                <div class="x_panel" style="overflow: scroll">
                                    <div class="x_title">
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <h4 class="sub-header" style="color: green;margin-left: 393px;">订单申请退款表</h4>
                                        <table class="table table-orderApplyRefundRecords">
                                            <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>wm_poi_id</th>
                                                <th>wm_order_id</th>
                                                <th>user_id</th>
                                                <th>money</th>
                                                <th>part_refund</th>
                                                <th>apply_type</th>
                                                <th>apply_uid</th>
                                                <th>apply_reason</th>
                                                <th>res_type</th>
                                                <th>res_uid</th>
                                                <th>res_reason</th>
                                                <th>wm_order_ip</th>
                                                <th>wm_order_uuid</th>
                                                <th>ctime</th>
                                                <th>utime</th>
                                                <th>refund_type</th>
                                                <th>iteminfo</th>
                                                <th>reason_ext</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th>${orderApplyRefundRecord.id}</th>
                                                    <th>${orderApplyRefundRecord.wm_poi_id}</th>
                                                    <th>${orderApplyRefundRecord.wm_order_id}</th>
                                                    <th>${orderApplyRefundRecord.user_id}</th>
                                                    <th>${orderApplyRefundRecord.money?c}</th>
                                                    <th>${orderApplyRefundRecord.part_refund!}</th>
                                                    <th>${orderApplyRefundRecord.apply_type}</th>
                                                    <th>${orderApplyRefundRecord.apply_uid}</th>
                                                    <th>${orderApplyRefundRecord.apply_reason!}</th>
                                                    <th>${orderApplyRefundRecord.res_type}</th>
                                                    <th>${orderApplyRefundRecord.res_uid}</th>
                                                    <th>${orderApplyRefundRecord.res_reason!}</th>
                                                    <th>${orderApplyRefundRecord.wm_order_ip}</th>
                                                    <th>${orderApplyRefundRecord.wm_order_uuid!}</th>
                                                    <th>${orderApplyRefundRecord.ctime}<br/>[${orderApplyRefundRecord.ctime_view}]</th>
                                                    <th>${orderApplyRefundRecord.utime}<br/>[${orderApplyRefundRecord.utime_view}]</th>
                                                    <th>${orderApplyRefundRecord.refund_type}</th>
                                                    <th>${orderApplyRefundRecord.iteminfo!}</th>
                                                    <th>${orderApplyRefundRecord.reason_ext!}</th>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </#if>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>根据退款号查询工具 <small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        <#if error_refundid??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error_refundid!}
                            </div>
                        </#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/query/orderotherdiminfo/querybyrefundid" method="post">
                                    <div class="form-group">
                                        <label for="orderId" class="control-label col-md-3 col-sm-3 col-xs-12">退款表ID<span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="refundId" name="refundId" class="form-control col-md-7 col-xs-12"
                                                   placeholder="退款表ID" value="${refundId!}"/>
                                        </div>
                                        <div class="clearfix"></div>
                                        <br />
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="submit" class="btn btn-primary">Submit</button>
                                            </div>
                                        </div>
                                </form>
                            <#if result_refundid??>
                                <div class="x_panel" style="overflow: scroll">
                                    <div class="x_title">
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <h4 class="sub-header" style="color: green;margin-left: 393px;">订单退款表</h4>
                                        <table class="table table-orderRefundRecords">
                                            <thead>
                                            <tr>
                                                <th>id</th>
                                                <th>wm_poi_id</th>
                                                <th>wm_order_id</th>
                                                <th>user_id</th>
                                                <th>wm_pay_record_id</th>
                                                <th>wm_apply_refund_record_id</th>
                                                <th>trade_no</th>
                                                <th>refund_no</th>
                                                <th>refund_type</th>
                                                <th>refund_total</th>
                                                <th>refund_time</th>
                                                <th>status</th>
                                                <th>reason</th>
                                                <th>wm_order_ip</th>
                                                <th>wm_order_uuid</th>
                                                <th>accept_time</th>
                                                <th>refund_flow</th>
                                                <th>ctime</th>
                                                <th>utime</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th>${orderRefundRecord.id}</th>
                                                    <th>${orderRefundRecord.wm_poi_id}</th>
                                                    <th>${orderRefundRecord.wm_order_id}</th>
                                                    <th>${orderRefundRecord.user_id}</th>
                                                    <th>${orderRefundRecord.wm_pay_record_id}</th>
                                                    <th>${orderRefundRecord.wm_apply_refund_record_id}</th>
                                                    <th>${orderRefundRecord.trade_no!}</th>
                                                    <th>${orderRefundRecord.refund_no!}</th>
                                                    <th>${orderRefundRecord.refund_type!}</th>
                                                    <th>${orderRefundRecord.refund_total?c}</th>
                                                    <th>${orderRefundRecord.refund_time}<br/>[${orderRefundRecord.refund_time_view}]</th>
                                                    <th>${orderRefundRecord.status}</th>
                                                    <th>${orderRefundRecord.reason!}</th>
                                                    <th>${orderRefundRecord.wm_order_ip}</th>
                                                    <th>${orderRefundRecord.wm_order_uuid!}</th>
                                                    <th>${orderRefundRecord.accept_time}<br/>[${orderRefundRecord.accept_time_view}]</th>
                                                    <th>${orderRefundRecord.refund_flow}</th>
                                                    <th>${orderRefundRecord.ctime}<br/>[${orderRefundRecord.ctime_view}]</th>
                                                    <th>${orderRefundRecord.utime}<br/>[${orderRefundRecord.utime_view}]</th>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </#if>
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

</body>

</html>