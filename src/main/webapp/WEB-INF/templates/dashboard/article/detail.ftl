<#assign title="发表帖子">
<#assign header="详情">

<@override name="breadcrumbs">
<ul class="breadcrumb">
    <li>
        <i class="menu-icon fa fa-tachometer"></i>
        <a href="${ctx}/dashboard">工作台</a>
    </li>
    <li class="active">
        帖子
    </li>
</ul>
</@override>

<@override name="content">
<div class="row">
    <div class="col-sm-10 col-sm-offset-1">
        <!-- #section:pages/invoice -->
        <div class="widget-box transparent">
            <div class="widget-header widget-header-large">
                <h3 class="widget-title grey lighter">
                    <i class="ace-icon fa fa-leaf green"></i>
                ${article.title}
                </h3>

                <div class="widget-toolbar no-border invoice-info">
                    <span class="invoice-info-label">状态:</span>
                    <span class="blue"><#include "status.ftl"></span>

                    <br>
                    <span class="invoice-info-label">发表时间:</span>
                    <span class="red">${article.createdTime?date}</span>
                </div>

                <div class="widget-toolbar hidden-480">
                    <a href="${ctx}/dashboard/article/${article.id}/export">
                        <i class="ace-icon fa fa-print"></i>
                    </a>
                </div>

                <!-- /section:pages/invoice.info -->
            </div>

            <div class="widget-body">
                <div class="widget-main padding-24">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
                                    <b>帖子信息</b>
                                </div>
                            </div>

                            <div>
                                <ul class="list-unstyled spaced">
                                    <li>
                                        <i class="ace-icon fa fa-caret-right blue"></i>
                                        楼主:
                                        <b class="red">${article.username}</b>
                                    </li>

                                    <li>
                                        <i class="ace-icon fa fa-caret-right blue"></i>
                                        栏目:
                                        <b class="red">${article.categoryName}</b>
                                    </li>

                                    <li>
                                        <i class="ace-icon fa fa-caret-right blue"></i>
                                        回复数量:
                                        <b class="red">${article.hits}</b>
                                    </li>

                                    <li>
                                        <i class="ace-icon fa fa-caret-right blue"></i>
                                        是否置顶:
                                        <b class="red">${(article.top==1)?string('是', '否')}</b>
                                    </li>

                                    <li>
                                        <i class="ace-icon fa fa-caret-right blue"></i>
                                        置顶时间:
                                        <b class="red">
                                            <#if article.top==1>
                                                ${article.topTime?datetime}
                                            </#if>
                                        </b>
                                    </li>

                                    <li>
                                        <i class="ace-icon fa fa-caret-right blue"></i>
                                        最后更新时间:
                                        <b class="red">
                                        ${article.updatedTime?datetime}
                                        </b>
                                    </li>
                                </ul>
                            </div>
                        </div><!-- /.col -->

                        <div class="col-sm-6">
                            <div class="row">
                                <div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
                                    <b>楼主信息</b>
                                </div>
                            </div>

                            <div>
                                <ul class="list-unstyled  spaced">
                                    <li>
                                        <i class="ace-icon fa fa-caret-right green"></i>
                                        用户名:
                                        <b class="red">${user.username}</b>
                                    </li>
                                    <li>
                                        <i class="ace-icon fa fa-caret-right green"></i>
                                        手机号:
                                        <b class="red">${user.mobile!''}</b>
                                    </li>
                                    <li>
                                        <i class="ace-icon fa fa-caret-right green"></i>
                                        电子邮箱:
                                        <b class="red">${user.email!''}</b>
                                    </li>
                                    <li>
                                        <i class="ace-icon fa fa-caret-right green"></i>
                                        用户状态:
                                        <b class="red"><#include "../../admin/user/status.ftl"></b>
                                    </li>

                                    <li>
                                        <i class="ace-icon fa fa-caret-right blue"></i>
                                        用户创建时间:
                                        <b class="red">
                                        ${user.createdTime?datetime}
                                        </b>
                                    </li>

                                    <li>
                                        <i class="ace-icon fa fa-caret-right blue"></i>
                                        最后更新时间:
                                        <b class="red">
                                        ${user.updatedTime?datetime}
                                        </b>
                                    </li>
                                </ul>
                            </div>
                        </div><!-- /.col -->
                    </div><!-- /.row -->

                    <div class="space"></div>

                    <div class="row">
                        <div class="col-sm-12">
                            <h4 class="widget-title text-muted smaller">
                                <i class="ace-icon fa orange"></i>
                                楼主(<a href="${ctx}/admin/user/${user.id}" data-toggle="modal"
                                      data-target="#myModal">${user.realname}</a>)
                            </h4>
                            <div class="hr hr8 hr-dotted"></div>
                        </div>

                        <div class="col-sm-12 well">
                        ${article.body}
                        </div>
                    </div>

                    <div class="space-10"></div>

                    <#list replies as reply>
                        <div class="row reply-div">
                            <div class="col-sm-12">
                                <h4 class="widget-title text-muted smaller">
                                    <i class="ace-icon fa orange"></i>
                                    <a href="${ctx}/">${reply.username}</a> 在 ${reply.createdTime?datetime} 评论:
                                </h4>
                                <div class="widget-toolbar action-buttons">
                                    <a href="${ctx}/dashboard/article/${article.id}" data-action="reload">
                                        <i class="ace-icon fa fa-refresh blue"></i>
                                    </a>
                                    &nbsp;
                                    <a href="javascript:" data-url="${ctx}/reply/${reply.id}/delete" class="pink reply-delete">
                                        <i class="ace-icon fa fa-trash-o"></i>
                                    </a>
                                </div>
                                <div class="hr hr8 hr-dotted"></div>
                            </div>

                            <div class="col-sm-12 well">
                            ${reply.body}
                            </div>
                        </div>

                        <div class="space-10"></div>
                    </#list>

                    <div class="hr hr8 hr-double hr-dotted"></div>

                    <div class="space-20"></div>

                    <div class="center">
                        <a href="javascript:history.back()" class="btn">
                            <i class="ace-icon fa fa-arrow-left"></i>
                            返回
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- /section:pages/invoice -->
    </div>
</div>
</@override>

<@override name="script">
<script src="${ctx}/static/app/js/dashboard/article/detail.js"></script>
</@override>

<@extends name="../../dashboard/layout.ftl"/>