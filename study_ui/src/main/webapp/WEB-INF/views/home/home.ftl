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
            <div class="">
                <div class="page-title">
                    <div class="title_left">
                        <h3>简介</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="x_content">
                    <div class="bs-example" data-example-id="simple-jumbotron">
                        <div class="jumbotron">
                            <h1>Welcome board!</h1>
                            <p>订单中心管理平台是订单中心小组内部管理后台，用于处理(查询，修复)各种订单数据，使用sso/upm权限管理。</p>
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