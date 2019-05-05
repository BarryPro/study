<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Vp系统监控</title>

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
                <h3>vp系统监控流</h3>
            </div>
            <div class="title_right"></div>
        </div>
        <div class="clearfix"></div>
        <br>

        <div class="x_panel">
            <div class="x_content">
                <div class="x_panel">
                    <div class="x_content">
                        <ul class="list-unstyled timeline">
                            <li>
                                <div class="block">
                                    <div class="tags">
                                        <div class="tag">
                                            <span>订单量监控</span>
                                        </div>
                                    </div>
                                    <div class="block_content">
                                        <h2 class="title">大盘监控</h2>
                                        <div class="byline"><span>暂无</span></div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="block">
                                    <div class="tags">
                                        <div class="tag"><span>接口监控</span></div>
                                    </div>
                                    <div class="block_content">
                                        <h2 class="title">
                                            <a href="http://falcon.sankuai.com/screen/17703">
                                                核心接口qps监控(falcon)</a></h2>
                                        <br>
                                        <h2 class="title">
                                            <a href="http://falcon.sankuai.com/screen/17703">
                                                接口qps监控(cat)</a></h2>
                                        <br>
                                        <h2 class="title">
                                            <a href="http://falcon.sankuai.com/screen/19380">
                                                异步系统支付回调qps监控</a></h2>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="block">
                                    <div class="tags">
                                        <div class="tag"><span>机器监控</span></div>
                                    </div>
                                    <div class="block_content">
                                        <h2 class="title">
                                            <a href="http://falcon.sankuai.com/screen/19283">
                                                服务器监控</a></h2>
                                    </div>
                                    <div class="byline"><span>服务器cpu，jvm</span></div>
                                </div>
                            </li>
                            <li>
                                <div class="block">
                                    <div class="tags">
                                        <div class="tag"><span>消息系统监控</span></div>
                                    </div>
                                    <div class="block_content">
                                        <h2 class="title">
                                            <a href="http://falcon.sankuai.com/screen/19298">
                                                mq消息监控</a></h2>
                                    </div>
                                    <div class="byline"><span>发送耗时,流控,积压</span></div>
                                    <div class="block_content">
                                        <h2 class="title">
                                            <a href="http://falcon.sankuai.com/screen/19284">
                                                trans消息处理监控</a></h2>
                                    </div>
                                    <br>
                                    <div class="block_content">
                                        <h2 class="title">
                                            <a href="http://falcon.sankuai.com/screen/19287">
                                                async消息处理监控</a></h2>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="block">
                                    <div class="tags">
                                        <div class="tag"><span>数据层监控</span></div>
                                    </div>
                                    <div class="block_content">
                                        <h2 class="title">
                                            <a href="http://falcon.sankuai.com/screen/19288">
                                                mysql监控</a></h2>
                                    </div>
                                    <div class="byline"><span>数据库读,主库写,慢查询,主从延迟</span></div>
                                    <div class="block_content">
                                        <h2 class="title"><a href="http://falcon.sankuai.com/screen/7674">
                                            tair监控</a></h2>
                                    </div>
                                    <div class="byline">
                                        <span>外卖公用tair监控</span>
                                    </div>
                                    <div class="block_content">
                                        <h2 class="title"><a>squirrel监控</a></h2>
                                    </div>
                                    <div class="byline"><span>暂无</span></div>
                                </div>
                            </li>
                        </ul>
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


</body>

</html>
