<#assign title="${category.name}">

<@override name="breadcrumbs">
<ul>
    <li><a href="${ctx}/">首页</a></li>
    <li><span>&gt;</span></li>
    <li><a href="${ctx}/article/category/${category.code}" class="active">${category.name}</a></li>
</ul>
</@override>

<@override name="content">
<ul class="category-list">
    <#list page.list as article>
        <li>
            <a href="${ctx}/article/${article.id}">
            ${article.title}<em>【${article.createdTime?datetime}】</em>
            </a>
        </li>
    </#list>
</ul>
</@override>

<@override name="script">
<script src="${ctx}/static/app/js/web/article/index.js"></script>
</@override>

<@extends name="../web-layout.ftl"/>