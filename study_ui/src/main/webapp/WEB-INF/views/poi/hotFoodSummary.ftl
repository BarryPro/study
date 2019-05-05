<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>商家热门菜品统计</title>

    <!-- Bootstrap core CSS -->
    <#--<link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">-->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/dashboard.css" rel="stylesheet">

    <link rel="stylesheet" href="/static/css/bootstrap-datetimepicker.min.css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
	<script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<style></style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/orderadmin/">订单统计平台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">About us</a></li>
                <li><a href="#">Help</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="/orderadmin/">Home</a></li>
                <li class="active"><a href="/orderadmin/stats/">数据统计 <span class="sr-only">(current)</span></a></li>
                <li><a href="/orderadmin/orderinfo/">订单详情</a></li>
                <li><a href="/orderadmin/poifoodsummary/">热门菜品统计查询</a></li>
                <li><a href="/orderadmin/hello">hello</a></li>
            </ul>
        </div>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<!-- content of page -->
			<div class="alert alert-warning" role="alert">
				<strong>注意:</strong> 只能查询七天内的统计数据
			</div>
			<h1 class="page-header">热门菜品统计查询</h1>
			<#if error??>
				<div class="alert alert-danger" role="alert">
					<strong>error: </strong>${error!}
				</div>
			</#if>
			<div class="container">
				<form class="form-horizontal" role="form" method="get" target="_blank" action="/orderadmin/poifoodsummary/getFoodSummary">
					<div class="form-group">
						<label for="start" class="col-md-1 control-label">开始时间</label>
						<div class="col-md-3">
							<div class='input-group date' id='datetimepickerStart'>
								<input type="text" class="form-control" name="startDate"
									   id="startDate" placeholder="20160101">
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-remove"></span>
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="end" class="col-md-1 control-label">结束时间</label>
						<div class="col-md-3">
							<div class='input-group date' id='datetimepickerEnd'>
								<input type="datetime" class="form-control" name="endDate"
									   id="endDate" placeholder="20160107">
								<span class="input-group-addon">
									<span class="glyphicon glyphicon-remove"></span>
									<span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="token" class="col-md-1 control-label">POI IDs</label>
						<div class="col-md-3">
							<input type="text" class="form-control" name="poiIdStr"
								   id="poiIdStr" placeholder="poiIds" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-3">
							<button class="btn btn-lg btn-primary btn-block" type="submit">GO</button>
						</div>
					</div>
				</form>
			</div>
		</div>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<#--<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>-->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script type="text/javascript" src="/static/js/moment-with-locales.js"></script>
<script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap-datetimepicker.min.js"></script>

<!-- Menu Toggle Script -->
<script>

	$('#datetimepickerStart').datetimepicker({
		format: 'yyyymmdd',
		autoclose: true,
		minView: 2,
		todayBtn: true,
		todayHighlight: true,
		endDate: new Date()
	});

	$('#datetimepickerEnd').datetimepicker({
		format: 'yyyymmdd',
		autoclose: true,
		minView: 2,
		todayBtn: true,
		todayHighlight: true,
		endDate: new Date()
	});
</script>
</body>
</html>
