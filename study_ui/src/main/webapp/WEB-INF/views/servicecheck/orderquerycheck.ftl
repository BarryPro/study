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
                        <h3>查询服务检测工具</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>databus服务检测<small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <#if errorDatabus??>
                                <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>error: </strong> ${errorDatabus!}
                                </div>
                            </#if>
                            <div class="x_content">
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/check/orderqueryservicecheck/check4databus" method="post">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" style="margin-left: auto">
                                            <button type="submit" class="btn btn-primary">Check</button>
                                        </div>
                                    </div>
                                </form>
                                <#if successDatabus ??>
                                    <div class="alert alert-success alert-dismissible fade in" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <strong>result: </strong> ${successDatabus!}
                                    </div>
                                </#if>
                                <#if checkfailDatabus??>
                                    <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <strong>error: </strong> 检测不通过！
                                    </div>
                                    <div class="x_panel" style="overflow: scroll">
                                        <div class="x_content">
                                            <table class="table table-orderByMysql">
                                                <thead>
                                                <tr>
                                                    <th>维度</th>
                                                    <th>id</th>
                                                    <th>wm_order_id_view</th>
                                                    <th>wm_poi_id</th>
                                                    <th>user_id</th>
                                                    <th>status</th>
                                                    <th>pay_status</th>
                                                    <th>logistics_status</th>
                                                    <th>order_time</th>
                                                    <th>
                                                        <a id="btn-detail_databus" href="javascript:;">详情</a>
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>数据库</td>
                                                    <#if checkfailDatabus.wmOrder??>
                                                        <td class="">${checkfailDatabus.wmOrder.id}</td>
                                                        <td class="">${checkfailDatabus.wmOrder.wm_order_id_view}</td>
                                                        <td class="">${checkfailDatabus.wmOrder.wm_poi_id}</td>
                                                        <td class="">${checkfailDatabus.wmOrder.user_id}</td>
                                                        <td class="">${checkfailDatabus.wmOrder.status}</td>
                                                        <td class="">${checkfailDatabus.wmOrder.pay_status}</td>
                                                        <td class="">${checkfailDatabus.wmOrder.logistics_status}</td>
                                                        <td class="">${checkfailDatabus.wmOrder.order_time}</td>
                                                    <#else>
                                                        <td class="">null</td>
                                                    </#if>
                                                </tr>
                                                <tr>
                                                    <td>TAIR</td>
                                                    <#if checkfailDatabus.wmOrderTair??>
                                                        <td class="">${checkfailDatabus.wmOrderTair.id}</td>
                                                        <td class="">${checkfailDatabus.wmOrderTair.wm_order_id_view}</td>
                                                        <td class="">${checkfailDatabus.wmOrderTair.wm_poi_id}</td>
                                                        <td class="">${checkfailDatabus.wmOrderTair.user_id}</td>
                                                        <td class="">${checkfailDatabus.wmOrderTair.status}</td>
                                                        <td class="">${checkfailDatabus.wmOrderTair.pay_status}</td>
                                                        <td class="">${checkfailDatabus.wmOrderTair.logistics_status}</td>
                                                        <td class="">${checkfailDatabus.wmOrderTair.order_time}</td>
                                                    <#else>
                                                        <td class="">null</td>
                                                    </#if>
                                                </tr>
                                                <tr>
                                                    <td>ES</td>
                                                    <#if checkfailDatabus.wmOrderEs??>
                                                        <td class="">${checkfailDatabus.wmOrderEs.id}</td>
                                                        <td class="">${checkfailDatabus.wmOrderEs.wm_order_id_view}</td>
                                                        <td class="">${checkfailDatabus.wmOrderEs.wm_poi_id}</td>
                                                        <td class="">${checkfailDatabus.wmOrderEs.user_id}</td>
                                                        <td class="">${checkfailDatabus.wmOrderEs.status}</td>
                                                        <td class="">${checkfailDatabus.wmOrderEs.pay_status}</td>
                                                        <td class="">${checkfailDatabus.wmOrderEs.logistics_status}</td>
                                                        <td class="">${checkfailDatabus.wmOrderEs.order_time}</td>
                                                    <#else>
                                                        <td class="">null</td>
                                                    </#if>
                                                </tr>
                                                </tbody>
                                            </table>

                                            <div class="order_detail_databus" style="display: none">
                                                <div class="row">
                                                    <div class="col-xs-4" style="overflow: scroll">
                                                        <h5 class="sub-header" style=" margin-left: 80px;color: green;">数据库</h5>
                                                    ${orderByMysql}
                                                    </div>
                                                    <div class="col-xs-4" style="overflow: scroll">
                                                        <h5 class="sub-header" style="margin-left: 76px;color: green;">TAIR</h5>
                                                    ${orderByTair}
                                                    </div>
                                                    <div class="col-xs-4" style="text-after-overflow: scroll">
                                                        <h5 class="sub-header" style="margin-left: 71px;color: green;">ES</h5>
                                                    ${orderByEs}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /page content -->
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>datamanager服务检测<small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <#if errorDM??>
                                <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>error: </strong> ${errorDM!}
                                </div>
                            </#if>
                            <div class="x_content">
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/check/orderqueryservicecheck/check4datamanager" method="post">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" style="margin-left: auto">
                                            <button type="submit" class="btn btn-primary">Check</button>
                                        </div>
                                    </div>
                                </form>
                                <#if successDM ??>
                                    <div class="alert alert-success alert-dismissible fade in" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <strong>result: </strong> ${successDM!}
                                    </div>
                                </#if>
                                <#if checkfailDM ??>
                                    <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <strong>error: </strong> 检测不通过！
                                    </div>
                                    <div class="x_content">
                                        <table class="table table-orderByMysql">
                                            <thead>
                                            <tr>
                                                <th>维度</th>
                                                <th>id</th>
                                                <th>wm_order_id_view</th>
                                                <th>wm_poi_id</th>
                                                <th>user_id</th>
                                                <th>status</th>
                                                <th>pay_status</th>
                                                <th>logistics_status</th>
                                                <th>order_time</th>
                                                <th>
                                                    <a id="btn-detail_dm" href="javascript:;">详情</a>
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>admin基础数据</td>
                                                <#if orderByAdmin4DM??>
                                                    <td class="">${admin4DM.id}</td>
                                                    <td class="">${admin4DM.wm_order_id_view}</td>
                                                    <td class="">${admin4DM.wm_poi_id}</td>
                                                    <td class="">${admin4DM.user_id}</td>
                                                    <td class="">${admin4DM.status}</td>
                                                    <td class="">${admin4DM.pay_status}</td>
                                                    <td class="">${admin4DM.logistics_status}</td>
                                                    <td class="">${admin4DM.order_time}</td>
                                                <#else>
                                                    <td class="">null</td>
                                                </#if>
                                            </tr>
                                            <tr>
                                                <td>DM从库</td>
                                                <#if orderByDMdb ??>
                                                    <td class="">${DMdb.id}</td>
                                                    <td class="">${DMdb.wm_order_id_view}</td>
                                                    <td class="">${DMdb.wm_poi_id}</td>
                                                    <td class="">${DMdb.user_id}</td>
                                                    <td class="">${DMdb.status}</td>
                                                    <td class="">${DMdb.pay_status}</td>
                                                    <td class="">${DMdb.logistics_status}</td>
                                                    <td class="">${DMdb.order_time}</td>
                                                <#else>
                                                    <td class="">null</td>
                                                </#if>
                                            </tr>
                                            <tr>
                                                <td>DM tair</td>
                                                <#if orderByDMtair ??>
                                                    <td class="">${DMtair.id}</td>
                                                    <td class="">${DMtair.wm_order_id_view}</td>
                                                    <td class="">${DMtair.wm_poi_id}</td>
                                                    <td class="">${DMtair.user_id}</td>
                                                    <td class="">${DMtair.status}</td>
                                                    <td class="">${DMtair.pay_status}</td>
                                                    <td class="">${DMtair.logistics_status}</td>
                                                    <td class="">${DMtair.order_time}</td>
                                                <#else>
                                                    <td class="">null</td>
                                                </#if>
                                            </tr>
                                            </tbody>
                                        </table>
                                        <div class="order_detail_dm" style="display: none">
                                            <div class="row">
                                                <div class="col-xs-4" style="overflow: scroll">
                                                    <h5 class="sub-header" style=" margin-left: 80px;color: green;">admin基础数据</h5>
                                                ${orderByAdmin4DM}
                                                </div>
                                                <div class="col-xs-4" style="overflow: scroll">
                                                    <h5 class="sub-header" style="margin-left: 76px;color: green;">datamanager从库查询</h5>
                                                ${orderByDMdb}
                                                </div>
                                                <div class="col-xs-4" style="text-after-overflow: scroll">
                                                    <h5 class="sub-header" style="margin-left: 71px;color: green;">datamanager Tair查询</h5>
                                                ${orderByDMtair}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- /page content -->
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>history服务检测<small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <#if errorHis??>
                                <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>error: </strong> ${errorHis!}
                                </div>
                            </#if>
                            <div class="x_content">
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/check/orderqueryservicecheck/check4history" method="post">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" style="margin-left: auto">
                                            <button type="submit" class="btn btn-primary">Check</button>
                                        </div>
                                    </div>
                                </form>
                                <#if successHis ??>
                                    <div class="alert alert-success alert-dismissible fade in" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <strong>result: </strong> ${successHis!}
                                    </div>
                                </#if>
                                <#if checkfailHis ??>
                                    <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <strong>error: </strong> 检测不通过！
                                    </div>
                                    <table class="table table-orderByMysql">
                                        <thead>
                                        <tr>
                                            <th>维度</th>
                                            <th>id</th>
                                            <th>wm_order_id_view</th>
                                            <th>wm_poi_id</th>
                                            <th>user_id</th>
                                            <th>status</th>
                                            <th>pay_status</th>
                                            <th>logistics_status</th>
                                            <th>order_time</th>
                                            <th>
                                                <a id="btn-detail_his" href="javascript:;">详情</a>
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>admin基础数据</td>
                                            <#if admin4His??>
                                                <td class="">${admin4His.id}</td>
                                                <td class="">${admin4His.wm_order_id_view}</td>
                                                <td class="">${admin4His.wm_poi_id}</td>
                                                <td class="">${admin4His.user_id}</td>
                                                <td class="">${admin4His.status}</td>
                                                <td class="">${admin4His.pay_status}</td>
                                                <td class="">${admin4His.logistics_status}</td>
                                                <td class="">${admin4His.order_time}</td>
                                            <#else>
                                                <td class="">null</td>
                                            </#if>
                                        </tr>
                                        <tr>
                                            <td>HIS Tair</td>
                                            <#if HisTair ??>
                                                <td class="">${HisTair.id}</td>
                                                <td class="">${HisTair.wm_order_id_view}</td>
                                                <td class="">${HisTair.wm_poi_id}</td>
                                                <td class="">${HisTair.user_id}</td>
                                                <td class="">${HisTair.status}</td>
                                                <td class="">${HisTair.pay_status}</td>
                                                <td class="">${HisTair.logistics_status}</td>
                                                <td class="">${HisTair.order_time}</td>
                                            <#else>
                                                <td class="">null</td>
                                            </#if>
                                        </tr>
                                        <tr>
                                            <td>HIS ES</td>
                                            <#if HisES ??>
                                                <td class="">${HisES.id}</td>
                                                <td class="">${HisES.wm_order_id_view}</td>
                                                <td class="">${HisES.wm_poi_id}</td>
                                                <td class="">${HisES.user_id}</td>
                                                <td class="">${HisES.status}</td>
                                                <td class="">${HisES.pay_status}</td>
                                                <td class="">${HisES.logistics_status}</td>
                                                <td class="">${HisES.order_time}</td>
                                            <#else>
                                                <td class="">null</td>
                                            </#if>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="order_detail_his" style="display: none">
                                        <div class="row">
                                            <div class="col-xs-4" style="overflow: scroll">
                                                <h5 class="sub-header" style=" margin-left: 80px;color: green;">admin基础数据</h5>
                                                ${orderByAdmin4His}
                                            </div>
                                            <div class="col-xs-4" style="overflow: scroll">
                                                <h5 class="sub-header" style="margin-left: 76px;color: green;">history Tair查询</h5>
                                                ${orderByHisTair}
                                            </div>
                                            <div class="col-xs-4" style="text-after-overflow: scroll">
                                                <h5 class="sub-header" style="margin-left: 71px;color: green;">history ES查询</h5>
                                                ${orderByHisES}
                                            </div>
                                        </div>
                                    </div>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- /page content -->
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>cachemanager服务检测<small></small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        <#if errorCache??>
                            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <strong>error: </strong> ${errorCache!}
                            </div>
                        </#if>
                            <div class="x_content">
                                <form id="demo-form" data-parsley-validate class="form-horizontal form-label-left"
                                      action="/check/orderqueryservicecheck/check4cachemanager" method="post">
                                    <div class="form-group">
                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" style="margin-left: auto">
                                            <button type="submit" class="btn btn-primary">Check</button>
                                        </div>
                                    </div>
                                </form>
                            <#if successCache ??>
                                <div class="alert alert-success alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>result: </strong> ${successCache!}
                                </div>
                            </#if>
                            <#if checkfailCache ??>
                                <div class="alert alert-danger alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <strong>error: </strong> 检测不通过！
                                </div>
                                <table class="table table-orderByMysql">
                                    <thead>
                                    <tr>
                                        <th>维度</th>
                                        <th>id</th>
                                        <th>wm_order_id_view</th>
                                        <th>wm_poi_id</th>
                                        <th>user_id</th>
                                        <th>status</th>
                                        <th>pay_status</th>
                                        <th>logistics_status</th>
                                        <th>order_time</th>
                                        <th>
                                            <a id="btn-detail_cache" href="javascript:;">详情</a>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>admin基础数据</td>
                                        <#if admin4Cache??>
                                            <td class="">${admin4Cache.id}</td>
                                            <td class="">${admin4Cache.wm_order_id_view}</td>
                                            <td class="">${admin4Cache.wm_poi_id}</td>
                                            <td class="">${admin4Cache.user_id}</td>
                                            <td class="">${admin4Cache.status}</td>
                                            <td class="">${admin4Cache.pay_status}</td>
                                            <td class="">${admin4Cache.logistics_status}</td>
                                            <td class="">${admin4Cache.order_time}</td>
                                        <#else>
                                            <td class="">null</td>
                                        </#if>
                                    </tr>
                                    <tr>
                                        <td>Cache Tair</td>
                                        <#if CacheTair ??>
                                            <td class="">${CacheTair.id}</td>
                                            <td class="">${CacheTair.wm_order_id_view}</td>
                                            <td class="">${CacheTair.wm_poi_id}</td>
                                            <td class="">${CacheTair.user_id}</td>
                                            <td class="">${CacheTair.status}</td>
                                            <td class="">${CacheTair.pay_status}</td>
                                            <td class="">${CacheTair.logistics_status}</td>
                                            <td class="">${CacheTair.order_time}</td>
                                        <#else>
                                            <td class="">null</td>
                                        </#if>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="order_detail_cache" style="display: none">
                                    <div class="row">
                                        <div class="col-xs-4" style="overflow: scroll">
                                            <h5 class="sub-header" style=" margin-left: 80px;color: green;">admin基础数据</h5>
                                        ${orderByAdmin4Cache}
                                        </div>
                                        <div class="col-xs-4" style="overflow: scroll">
                                            <h5 class="sub-header" style="margin-left: 76px;color: green;">cachemanager Tair查询</h5>
                                        ${orderByCacheTair}
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
        var detail_show_databus = false;

        $("#btn-detail_databus").on("click", function(){
            detail_show_databus = !detail_show_databus;
            if(detail_show_databus) {
                $(".order_detail_databus").show();
            } else {
                $(".order_detail_databus").hide();
            }
        })

        var detail_show_dm = false;

        $("#btn-detail_dm").on("click", function(){
            detail_show_dm = !detail_show_dm;
            if(detail_show_dm) {
                $(".order_detail_dm").show();
            } else {
                $(".order_detail_dm").hide();
            }
        })

        var detail_show_his = false;

        $("#btn-detail_his").on("click", function(){
            detail_show_his = !detail_show_his;
            if(detail_show_his) {
                $(".order_detail_his").show();
            } else {
                $(".order_detail_his").hide();
            }
        })

        var detail_show_cache = false;

        $("#btn-detail_cache").on("click", function(){
            detail_show_cache = !detail_show_cache;
            if(detail_show_cache) {
                $(".order_detail_cache").show();
            } else {
                $(".order_detail_cache").hide();
            }
        })
    });
</script>

</body>

</html>