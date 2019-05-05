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
                        <h3>选择不同环境order_admin</h3>
                    </div>
                    <div class="title_right"></div>
                </div>
                <div class="clearfix"></div>

                <div class="x_content">
                    <div class="bs-example" data-example-id="simple-jumbotron">
                        <div class="jumbotron">
                            <a href="http://orderadmin.waimai.dev.sankuai.com/home/"><p>DEVELOP</p></a>
                            <a href="http://10.20.119.33:8433/home/"><p>QA</p></a>
                            <a href="http://10.4.243.155:8433/home/"><p>BETA</p></a>
                            <a href="http://orderadmin.waimai.st.sankuai.com/home/"><p>STAGE</p></a>
                            <a href="http://order-admin.waimai.sankuai.com/home/"><p>PRODUCTION</p></a>
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