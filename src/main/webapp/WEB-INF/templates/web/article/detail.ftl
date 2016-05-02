<#assign title="${article.title}">

<@override name="breadcrumbs">
<ul>
    <li><a href="${ctx}/">首页</a></li>
    <li><span>&gt;</span></li>
    <li><a href="${ctx}/article/category/${category.code}">${category.name}</a></li>
    <li><span>&gt;</span></li>
    <li><a href="${ctx}/article/${article.id}" class="active">${article.title}</a></li>
</ul>
</@override>
<@override name="content">
<div class="article-detail">
    <div class="article-title">${article.title}</div>
    <div class="article-info">
        <div><em>${article.createdTime?datetime}</em> ${article.username}</div>
    </div>
    <div class="article-body">
    ${article.body}
    </div>
</div>

    <#list replies as reply>
    <div class="floor">
        <div>${reply.username} <em>${reply.createdTime?datetime}</em> 评论:</div>
        <p>${reply.body}</p>
    </div>
    </#list>

<form id="reply-form" action="${ctx}/article/${article.id}/reply" method="post" class="form-horizontal">
    <div class="form-group">
        <label for="body" class="col-sm-2 control-label">评论:</label>
        <div class="col-sm-10">
            <textarea id="body" name="body" class="reply-body"></textarea>
        </div>
    </div>
    <div class="form-group text-right col-sm-10">
        <a id="reply" class="btn btn-grey">
            <i class="ace-icon fa fa-check bigger-110"></i>
            <@spring.message "app.button.save"/>
        </a>
    </div>
</form>
</@override>

<@override name="script">
<script src="${ctx}/static/app/js/web/article/detail.js"></script>
</@override>

<@extends name="../web-layout.ftl"/>