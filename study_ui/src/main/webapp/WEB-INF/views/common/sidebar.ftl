<#macro sidebar active="">
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">

		<#-- side title -->
        <div class="navbar nav_title" style="border: 0;">
            <a href="/" class="site_title"><i class="fa fa-users"></i> <span>订单管理平台</span></a>
        </div>
        <div class="clearfix"></div>

        <!-- menu prile quick info -->
        <div class="profile">
            <div class="profile_pic">
				<#if _sso_avatar_url??>
                    <img src="${_sso_avatar_url}" alt="..." class="img-circle profile_img">
				<#else>
                    <img src="/static/images/imgMT.jpg" alt="..." class="img-circle profile_img">
				</#if>
			</div>
            <div class="profile_info">
                <span>Welcome</span>
				<#if _sso_user_info??>
					<h2>${_sso_user_info.name!}</h2>
				<#else>
					<h2>游客</h2>
				</#if>
            </div>
        </div>
        <!-- /menu prile quick info -->

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>功能列表</h3>
				<#-- 固定为二级菜单 -->
                <ul class="nav side-menu">
					<#if _sso_nemus??>
						<#list _sso_nemus as menu>
                            <li><a><i class="fa ${menu.url}"></i> ${menu.title} <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu" style="display: none">
									<#list menu.menus as subMenu>
                                        <li><a id="menu-${subMenu.id}" href="${subMenu.url}">${subMenu.title}</a></li>
									</#list>
                                </ul>
                            </li>
						</#list>
					</#if>
                </ul>
            </div>
        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
        </div>
        <!-- /menu footer buttons -->
    </div>
</div>
</#macro>