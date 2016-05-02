<#assign ctx="${(rca.contextPath)!''}">

<#macro pagination url param="">
    <#if (page.list)?? && page.total gt 0>
    <div class="pull-right">
        <ul class="pagination">
            <li><a href="javascript:" class="page-info">第 ${page.startRow}~${page.endRow} 条, 共 ${page.total} 条, 第 ${page.pageNum} 页,
                共 ${page.pages} 页</a></li>
        </ul>
    </div>
    <div class="pull-left">
        <ul class="pagination">
            <li>
                <a href="${url}?p=1<#if param?has_content>&${param}</#if>">
                    <i class="ace-icon fa fa-angle-double-left"></i>
                </a>
            </li>
            <li>
                <#if page.hasPreviousPage>
                    <a href="${url}?p=${page.prePage}<#if param?has_content>&${param}</#if>">
                        <i class="ace-icon fa fa-angle-left"></i>
                    </a>
                <#else>
                    <a href="${url}?p=1<#if param?has_content>&${param}</#if>">
                        <i class="ace-icon fa fa-angle-left"></i>
                    </a>
                </#if>
            </li>

            <#list page.navigatepageNums as nav>
                <li <#if nav == page.pageNum>class="active"</#if>>
                    <a href="${url}?p=${nav}<#if param?has_content>&${param}</#if>">${nav}</a>
                </li>
            </#list>

            <li>
                <#if page.hasNextPage>
                    <a href="${url}?p=${page.nextPage}<#if param?has_content>&${param}</#if>">
                        <i class="ace-icon fa fa-angle-right"></i>
                    </a>
                <#else>
                    <a href="${url}?p=${page.lastPage}<#if param?has_content>&${param}</#if>">
                        <i class="ace-icon fa fa-angle-right"></i>
                    </a>
                </#if>
            </li>
            <li>
                <a href="${url}?p=${page.lastPage}<#if param?has_content>&${param}</#if>">
                    <i class="ace-icon fa fa-angle-double-right"></i>
                </a>
            </li>
        </ul>
    </div>
    </#if>
</#macro>

<#macro menu_admin_tree>
<ul class="nav nav-list">
    <li id="admin">
        <a href="${ctx}/admin">
            <i class="menu-icon fa fa-tachometer"></i>
            <span class="menu-text"> 后台 </span>
        </a>

        <b class="arrow"></b>
    </li>

    <li class="" id="user-admin">
        <a href="" class="dropdown-toggle">
            <i class="menu-icon fa fa-users"></i>
            <span class="menu-text"> 用户 </span>

            <b class="arrow fa fa-angle-down"></b>
        </a>

        <b class="arrow"></b>

        <ul class="submenu">
            <li class="" id="user-admin-manage">
                <a href="${ctx}/admin/user">
                    <i class="menu-icon fa fa-caret-right"></i>
                    用户管理
                </a>

                <b class="arrow"></b>
            </li>
        </ul>
    </li>

    <li class="" id="article-admin">
        <a href="#" class="dropdown-toggle">
            <i class="menu-icon fa fa-pencil-square-o"></i>
            <span class="menu-text"> 帖子 </span>

            <b class="arrow fa fa-angle-down"></b>
        </a>

        <b class="arrow"></b>

        <ul class="submenu">
            <li class="" id="article-admin-manage">
                <a href="${ctx}/admin/article">
                    <i class="menu-icon fa fa-caret-right"></i>
                    帖子管理
                </a>

                <b class="arrow"></b>
            </li>
        </ul>
    </li>
</ul>
</#macro>

<#macro menu_dashboard_tree>
<ul class="nav nav-list">
    <li id="dashboard">
        <a href="${ctx}/dashboard">
            <i class="menu-icon fa fa-tachometer"></i>
            <span class="menu-text"> 工作台 </span>
        </a>

        <b class="arrow"></b>
    </li>

    <li class="" id="article-dashboard">
        <a href="#" class="dropdown-toggle">
            <i class="menu-icon fa fa-pencil-square-o"></i>
            <span class="menu-text"> 帖子 </span>

            <b class="arrow fa fa-angle-down"></b>
        </a>

        <b class="arrow"></b>

        <ul class="submenu">
            <li class="" id="article-dashboard-manage">
                <a href="${ctx}/dashboard/article">
                    <i class="menu-icon fa fa-caret-right"></i>
                    发表帖子
                </a>

                <b class="arrow"></b>
            </li>
        </ul>
    </li>

    <li class="" id="user-dashboard">
        <a href="#" class="dropdown-toggle">
            <i class="menu-icon fa fa-user"></i>
            <span class="menu-text"> 个人 </span>

            <b class="arrow fa fa-angle-down"></b>
        </a>

        <b class="arrow"></b>

        <ul class="submenu">
            <li class="" id="user-dashboard-profile">
                <a href="${ctx}/dashboard/user/${token.id}/profile">
                    <i class="menu-icon fa fa-caret-right"></i>
                    个人资料
                </a>

                <b class="arrow"></b>
            </li>

            <#--<li class="" id="user-profile-logo">-->
                <#--<a href="${ctx}/dashboard/user/${token.id}/logo">-->
                    <#--<i class="menu-icon fa fa-caret-right"></i>-->
                    <#--我的头像-->
                <#--</a>-->

                <#--<b class="arrow"></b>-->
            <#--</li>-->

            <li class="" id="user-dashboard-password">
                <a href="${ctx}/dashboard/user/${token.id}/password">
                    <i class="menu-icon fa fa-caret-right"></i>
                    修改密码
                </a>

                <b class="arrow"></b>
            </li>
        </ul>
    </li>
</ul>
</#macro>