<#assign title="帖子管理">
<#assign header="帖子管理">

<#assign status = RequestParameters.status!'' />
<#assign title2 = RequestParameters.title!'' />
<#assign categoryName = RequestParameters.categoryName!'' />
<#assign username = RequestParameters.username!'' />

<@override name="breadcrumbs">
<ul class="breadcrumb">
    <li>
        <i class="menu-icon fa fa-tachometer"></i>
        <a href="${ctx}/admin">后台</a>
    </li>
    <li class="active">
        帖子
    </li>
</ul>
</@override>

<@override name="content">
<div class="col-sm-12">
    <form class="form-inline" method="get" novalidate>
        <div class="form-group">
            <select name="status" class="form-control">
                <option value="">-- 全部状态 --</option>
                <#list enums["com.kangyonggan.constants.PublishedStatusEnum"]?values as enum>
                    <option value="${enum.status}" <#if status=='${enum.status}'>selected</#if>>${enum.value}</option>
                </#list>
            </select>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="title" value="${title2}" placeholder="标题"/>
        </div>

        <div class="form-group">
            <input type="text" class="form-control" name="categoryName" value="${categoryName}" placeholder="栏目"/>
        </div>

        <div class="form-group">
            <input type="text" class="form-control" name="username" value="${username}" placeholder="发表人"/>
        </div>

        <button class="btn btn-purple btn-sm">
            搜索
            <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
        </button>
    </form>
</div>

<div class="space-24"></div>

<div class="col-xs-12">
    <table id="article-table" class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>ID</th>
            <th>标题</th>
            <th>栏目名称</th>
            <th>状态</th>
            <th>发表人</th>
            <th>发表时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
            <#if (page.list)?size gt 0>
                <#list page.list as article>
                    <#include "article-tr.ftl"/>
                </#list>
            <#else>
            <tr>
                <td colspan="20">
                    <div class="empty">暂无查询记录</div>
                </td>
            </tr>
            </#if>
        </tbody>
    </table>
    <@c.pagination url="${ctx}/admin/article" param="status=${status}&title=${title2}&categoryName=${categoryName}&username=${username}"/>
</div>
</@override>

<@override name="script">
<script src="${ctx}/static/app/js/admin/article/index.js"></script>
</@override>

<@extends name="../../dashboard/layout.ftl"/>