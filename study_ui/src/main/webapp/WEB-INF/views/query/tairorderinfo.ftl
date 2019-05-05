<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>订单查询</title>

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
                        <h3>订单TAIR查询</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>TAIR查询工具 <small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
							<#if error??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${error!}
                            </div>
							</#if>
                            <div class="x_content">
                                <br />
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/query/tairorderinfo/querybyid" method="post">
                                    <div class="form-group">
                                        <label for="orderId" class="control-label col-md-3 col-sm-3 col-xs-12">订单ID <span class="required"></span></label>
                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                            <input type="text" id="orderId" name="orderId" class="form-control col-md-7 col-xs-12"
                                                   placeholder="非展示ID" value="${orderId!}"/>
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
								<#if result??>
                                    <div class="x_panel" style="overflow: scroll">
                                        <div class="x_title">
                                            <ul class="nav navbar-right panel_toolbox">
                                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="x_content">
											<table class="table table-orderById">
                                                <h4 class="sub-header" style="color: green;margin-left: 406px;">订单表</h4>
												<thead>
												<tr>
													<th>id</th>
													<th>wm_order_id_view</th>
													<th>wm_poi_id</th>
													<th>user_id</th>
													<th>status</th>
													<th>pay_status</th>
													<th>logistics_status</th>
													<th>order_time</th>
													<th>ctime</th>
													<th>utime</th>
													<th>
														<a id="btn-detail" href="javascript:;">详情</a>
													</th>
												</tr>
												</thead>
												<tbody>
												<tr>
													<td class="">${orderInfoVo.orderById.id}</td>
													<td class="">${orderInfoVo.orderById.wm_order_id_view}</td>
													<td class="">${orderInfoVo.orderById.wm_poi_id}</td>
													<td class="">${orderInfoVo.orderById.user_id}</td>
													<td class="">${orderInfoVo.orderById.status}</td>
													<td class="">${orderInfoVo.orderById.pay_status}</td>
													<td class="">${orderInfoVo.orderById.logistics_status}</td>
													<td class="">${orderInfoVo.orderById.order_time}<br/>[${orderInfoVo.orderById.order_time_view}]</td>
													<td class="">${orderInfoVo.orderById.ctime}<br/>[${orderInfoVo.orderById.ctime_view}]</td>
													<td class="">${orderInfoVo.orderById.utime}<br/>[${orderInfoVo.orderById.utime_view}]</td>
												</tr>
												</tbody>
											</table>

											<div class="order_detail" style="display: none">
                                                <div class="">
                                                    ${wmorder}
                                                </div>
                                            </div>
                                            <div class="table-orderDetail">
                                                <h4 class="sub-header" style="color: green;margin-left: 406px;">订单详情表</h4>
                                                <table class="table table-orderDetail">
                                                    <thead>
                                                    <tr>
                                                        <th>id</th>
                                                        <th>wm_order_id</th>
                                                        <th>wm_food_id</th>
                                                        <th>food_price</th>
                                                        <th>unit</th>
                                                        <th>count</th>
                                                        <th>box_num</th>
                                                        <th>box_price</th>
                                                        <th>food_name</th>
                                                        <th>order_time</th>
                                                        <th>origin_food_price</th>
                                                        <th>cart_id</th>
                                                        <th>spec</th>
                                                        <th>attrIds</th>
                                                        <th>attrValues</th>
                                                        <th>wm_food_spu_id</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
													<#list orderInfoVo.orderDetails as orderDetail>
														<tr>
															<th>${orderDetail.id}</th>
															<th>${orderDetail.wm_order_id}</th>
															<th>${orderDetail.wm_food_id}</th>
															<th>${orderDetail.food_price?c}</th>
															<th>${orderDetail.unit!}</th>
															<th>${orderDetail.count}</th>
															<th>${orderDetail.box_num?c}</th>
															<th>${orderDetail.box_price?c}</th>
															<th>${orderDetail.food_name!}</th>
															<th>${orderDetail.order_time}<br/>[${orderDetail.order_time_view!}]</th>
															<th>${orderDetail.origin_food_price?c}</th>
															<th>${orderDetail.cart_id}</th>
															<th>${orderDetail.spec!}</th>
															<th>
																<#list orderDetail.attrIds as attrId>
																	${attrId},
																</#list>
															</th>
															<th>
																<#list orderDetail.attrValues as attrValue>
																	${attrValue},
																</#list>
															</th>
															<th>${orderDetail.wm_food_spu_id}</th>
														</tr>
													</#list>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div class="table-orderExtras">
                                                <h4 class="sub-header" style="color: green;margin-left: 393px;">订单优惠信息表</h4>
                                                <table class="table table-orderExtras">
                                                    <thead>
                                                    <tr>
                                                        <th>id</th>
                                                        <th>wm_order_id</th>
                                                        <th>wm_poi_id</th>
                                                        <th>reduce_fee</th>
                                                        <th>gift_name</th>
                                                        <th>ctime</th>
                                                        <th>utime</th>
                                                        <th>wm_act_poi_id</th>
                                                        <th>remark</th>
                                                        <th>wm_act_policy_id</th>
                                                        <th>type</th>
                                                        <th>discharge_detail</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
														<#list orderInfoVo.orderExtras as orderExtra>
                                                        <tr>
															<th>${orderExtra.id}</th>
															<th>${orderExtra.wm_order_id}</th>
															<th>${orderExtra.wm_poi_id}</th>
															<th>${orderExtra.reduce_fee?c}</th>
															<th>${orderExtra.gift_name!}</th>
															<th>${orderExtra.ctime}<br/>[${orderExtra.ctime_view}]</th>
															<th>${orderExtra.utime}<br/>[${orderExtra.utime_view}]</th>
															<th>${orderExtra.wm_act_poi_id}</th>
															<th>${orderExtra.remark!}</th>
															<th>${orderExtra.wm_act_policy_id}</th>
															<th>${orderExtra.type}</th>
															<th>${orderExtra.discharge_detail!}</th>
                                                        </tr>
														</#list>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div class="table-orderBextra">
                                                <h4 class="sub-header" style="color: green;margin-left: 393px;">订单bextra信息表</h4>
                                                <table class="table table-orderBextra">
                                                    <thead>
                                                    <tr>
                                                        <th>id</th>
                                                        <th>wm_order_id</th>
                                                        <th>wm_poi_id</th>
                                                        <th>wm_poi_order_push_day</th>
                                                        <th>wm_poi_order_push_dayseq</th>
                                                        <th>order_effective_time</th>
                                                        <th>ctime</th>
                                                        <th>utime</th>
                                                        <th>valid</th>
                                                        <th>common_ext</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                        <#if orderInfoVo.wmOrderBextra ??>
                                                        <tr>
                                                            <th>${orderInfoVo.wmOrderBextra.id}</th>
                                                            <th>${orderInfoVo.wmOrderBextra.wm_order_id}</th>
                                                            <th>${orderInfoVo.wmOrderBextra.wm_poi_id}</th>
                                                            <th>${orderInfoVo.wmOrderBextra.wm_poi_order_push_day}</th>
                                                            <th>${orderInfoVo.wmOrderBextra.wm_poi_order_push_dayseq}</th>
                                                            <th>${orderInfoVo.wmOrderBextra.order_effective_time}<br/>[${orderInfoVo.wmOrderBextra.order_effective_time_view}]</th>
                                                            <th>${orderInfoVo.wmOrderBextra.ctime}<br/>[${orderInfoVo.wmOrderBextra.ctime_view}]</th>
                                                            <th>${orderInfoVo.wmOrderBextra.utime}<br/>[${orderInfoVo.wmOrderBextra.utime_view}]</th>
                                                            <th>${orderInfoVo.wmOrderBextra.valid}</th>
                                                            <th>${orderInfoVo.wmOrderBextra.common_ext!}</th>
                                                        </tr>
                                                        </#if>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div class="table-orderBextra">
                                                <h4 class="sub-header" style="color: green;margin-left: 393px;">订单spam信息表</h4>
                                                <table class="table table-orderBextra">
                                                    <thead>
                                                    <tr>
                                                        <th>id</th>
                                                        <th>wm_order_id</th>
                                                        <th>wm_order_time</th>
                                                        <th>wm_order_uuid</th>
                                                        <th>wm_order_ip</th>
                                                        <th>user_actual_longitude</th>
                                                        <th>user_actual_latitude</th>
                                                        <th>wm_appversion</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                        <#if orderInfoVo.orderSpam ??>
                                                        <tr>
                                                            <th>${orderInfoVo.orderSpam.id}</th>
                                                            <th>${orderInfoVo.orderSpam.wm_order_id}</th>
                                                            <th>${orderInfoVo.orderSpam.wm_order_time}<br/>[${orderInfoVo.orderSpam.wm_order_time_view}]</th>
                                                            <th>${orderInfoVo.orderSpam.wm_order_uuid!}</th>
                                                            <th>${orderInfoVo.orderSpam.wm_order_ip!}</th>
                                                            <th>${orderInfoVo.orderSpam.user_actual_longitude}</th>
                                                            <th>${orderInfoVo.orderSpam.user_actual_latitude}</th>
                                                            <th>${orderInfoVo.orderSpam.wm_appversion!}</th>
                                                        </tr>
                                                        </#if>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div class="table-orderOpRemark">
                                                <h4 class="sub-header" style="color: green;margin-left: 393px;">订单操作记录表</h4>
                                                <table class="table table-orderOpRemark">
                                                    <thead>
                                                    <tr>
                                                        <th>id</th>
                                                        <th>wm_order_id</th>
                                                        <th>wm_remark_id</th>
                                                        <th>deal_uid</th>
                                                        <th>deal_uname</th>
                                                        <th>deal_op_type</th>
                                                        <th>deal_op_role</th>
                                                        <th>ctime</th>
                                                        <th>utime</th>
                                                        <th>valid</th>
                                                        <th>remark</th>
                                                        <th>wm_remark_secondary_id</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                        <#list orderInfoVo.orderOpRemarks as orderOpRemark>
                                                        <tr>
                                                            <th>${orderOpRemark.id}</th>
                                                            <th>${orderOpRemark.wm_order_id}</th>
                                                            <th>${orderOpRemark.wm_remark_id}</th>
                                                            <th>${orderOpRemark.deal_uid}</th>
                                                            <th>${orderOpRemark.deal_uname}</th>
                                                            <th>${orderOpRemark.deal_op_type}</th>
                                                            <th>${orderOpRemark.deal_op_role}</th>
                                                            <th>${orderOpRemark.ctime}<br/>[${orderOpRemark.ctime_view!}]</th>
                                                            <th>${orderOpRemark.utime}<br/>[${orderOpRemark.utime_view!}]</th>
                                                            <th>${orderOpRemark.valid}</th>
                                                            <th>${orderOpRemark.remark}</th>
                                                            <th>${orderOpRemark.wm_remark_secondary_id}</th>
                                                        </tr>
                                                        </#list>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div class="table-orderStatusHises">
                                                <h4 class="sub-header" style="color: green;margin-left: 393px;">订单状态变更表</h4>
                                                <table class="table table-orderStatusHises">
                                                    <thead>
                                                    <tr>
                                                        <th>id</th>
                                                        <th>wm_order_id</th>
                                                        <th>status</th>
                                                        <th>pay_status</th>
                                                        <th>logistics_status</th>
                                                        <th>op_type</th>
                                                        <th>op_uid</th>
                                                        <th>ctime</th>
                                                        <th>utime</th>
                                                        <th>valid</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
														<#list orderInfoVo.orderStatusHiss as orderStatusHis>
                                                        <tr>
															<th>${orderStatusHis.id}</th>
															<th>${orderStatusHis.wm_order_id}</th>
															<th>${orderStatusHis.status}</th>
															<th>${orderStatusHis.pay_status}</th>
															<th>${orderStatusHis.logistics_status}</th>
															<th>${orderStatusHis.op_type}</th>
															<th>${orderStatusHis.op_uid}</th>
															<th>${orderStatusHis.ctime}<br/>[${orderStatusHis.ctime_view!}]</th>
															<th>${orderStatusHis.utime}<br/>[${orderStatusHis.utime_view!}]</th>
															<th>${orderStatusHis.valid}</th>
                                                        </tr>
														</#list>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div class="table-orderPayRecords">
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
														<#list orderInfoVo.orderPayRecords as orderPayRecord>
                                                        <tr>
                                                            <th>${orderPayRecord.id}</th>
                                                            <th>${orderPayRecord.wm_poi_id}</th>
                                                            <th>${orderPayRecord.wm_order_id}</th>
                                                            <th>${orderPayRecord.trade_no}</th>
                                                            <th>${orderPayRecord.user_id}</th>
                                                            <th>${orderPayRecord.pay_account}</th>
                                                            <th>${orderPayRecord.pay_type}</th>
                                                            <th>${orderPayRecord.pay_route}</th>
                                                            <th>${orderPayRecord.pay_method}</th>
                                                            <th>${orderPayRecord.bank_type}</th>
                                                            <th>${orderPayRecord.pay_total?c}</th>
                                                            <th>${orderPayRecord.pay_time}<br/>[${orderPayRecord.pay_time_view}]</th>
                                                            <th>${orderPayRecord.pay_expire}</th>
                                                            <th>${orderPayRecord.status}</th>
                                                            <th>${orderPayRecord.reason}</th>
                                                            <th>${orderPayRecord.wm_order_ip}</th>
                                                            <th>${orderPayRecord.wm_order_uuid}</th>
                                                            <th>${orderPayRecord.ctime}<br/>[${orderPayRecord.ctime_view}]</th>
                                                            <th>${orderPayRecord.utime}<br/>[${orderPayRecord.utime_view}]</th>
                                                        </tr>
														</#list>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div class="table-orderApplyRefundRecords">
                                                <h4 class="sub-header" style="color: green;margin-left: 393px;">订单申请退款表</h4>
                                                <table class="table table-orderApplyRefundRecords">
                                                    <thead>
                                                    <tr>
                                                        <th>id</th>
                                                        <th>wm_poi_id</th>
                                                        <th>wm_order_id</th>
                                                        <th>user_id</th>
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
                                                        <th>money</th>
                                                        <th>refundFoodItemInfolist</th>
                                                        <th>part_refund</th>
                                                        <th>reason_type</th>
                                                        <th>pictures</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
													<#list orderInfoVo.orderApplyRefundRecords as orderApplyRefundRecord>
                                                    <tr>
                                                        <th>${orderApplyRefundRecord.id}</th>
                                                        <th>${orderApplyRefundRecord.wm_poi_id}</th>
                                                        <th>${orderApplyRefundRecord.wm_order_id}</th>
                                                        <th>${orderApplyRefundRecord.user_id}</th>
                                                        <th>${orderApplyRefundRecord.apply_type}</th>
                                                        <th>${orderApplyRefundRecord.apply_uid}</th>
                                                        <th>${orderApplyRefundRecord.apply_reason}</th>
                                                        <th>${orderApplyRefundRecord.res_type}</th>
                                                        <th>${orderApplyRefundRecord.res_uid}</th>
                                                        <th>${orderApplyRefundRecord.res_reason}</th>
                                                        <th>${orderApplyRefundRecord.wm_order_ip}</th>
                                                        <th>${orderApplyRefundRecord.wm_order_uuid}</th>
                                                        <th>${orderApplyRefundRecord.ctime}<br/>[${orderApplyRefundRecord.ctime_view}]</th>
                                                        <th>${orderApplyRefundRecord.utime}<br/>[${orderApplyRefundRecord.utime_view}]</th>
                                                        <th>${orderApplyRefundRecord.refund_type!}</th>
                                                        <th>${orderApplyRefundRecord.money?c}</th>
                                                        <th>${orderApplyRefundRecord.refundFoodItemInfolist_view!}</th>
                                                        <th>${orderApplyRefundRecord.part_refund!}</th>
                                                        <th>${orderApplyRefundRecord.reason_type!}</th>
                                                        <th>${orderApplyRefundRecord.pictures_view!}</th>
                                                    </tr>
													</#list>
                                                    </tbody>
                                                </table>
                                            </div>

                                            <div class="table-orderRefundRecords">
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
													<#list orderInfoVo.orderRefundRecords as orderRefundRecord>
                                                    <tr>
                                                        <th>${orderRefundRecord.id}</th>
                                                        <th>${orderRefundRecord.wm_poi_id}</th>
                                                        <th>${orderRefundRecord.wm_order_id}</th>
                                                        <th>${orderRefundRecord.user_id}</th>
                                                        <th>${orderRefundRecord.wm_pay_record_id}</th>
                                                        <th>${orderRefundRecord.wm_apply_refund_record_id}</th>
                                                        <th>${orderRefundRecord.trade_no}</th>
                                                        <th>${orderRefundRecord.refund_no}</th>
                                                        <th>${orderRefundRecord.refund_type}</th>
                                                        <th>${orderRefundRecord.refund_total?c}</th>
                                                        <th>${orderRefundRecord.refund_time}<br/>[${orderRefundRecord.refund_time_view}]</th>
                                                        <th>${orderRefundRecord.status}</th>
                                                        <th>${orderRefundRecord.reason}</th>
                                                        <th>${orderRefundRecord.wm_order_ip}</th>
                                                        <th>${orderRefundRecord.wm_order_uuid}</th>
                                                        <th>${orderRefundRecord.accept_time}<br/>[${orderRefundRecord.accept_time_view}]</th>
                                                        <th>${orderRefundRecord.refund_flow}</th>
                                                        <th>${orderRefundRecord.ctime}<br/>[${orderRefundRecord.ctime_view}]</th>
                                                        <th>${orderRefundRecord.utime}<br/>[${orderRefundRecord.utime_view}]</th>
                                                    </tr>
													</#list>
                                                    </tbody>
                                                </table>
                                            </div>

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

<script type="text/javascript">
$(function(){
	var detail_show = false;

	$("#btn-detail").on("click", function(){
		detail_show = !detail_show;
		if(detail_show) {
			$(".order_detail").show();
		} else {
			$(".order_detail").hide();
		}
	})
});
</script>

</body>

</html>