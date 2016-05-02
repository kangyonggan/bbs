<#assign ctx="${(rca.contextPath)!''}">

<tr id="article-${article.id}">
    <td>${article.id}</td>
    <td>
        <a href="${ctx}/dashboard/article/${article.id}">${article.title}</a>
    </td>
    <td>${article.categoryName!''}</td>
    <td><#include "status.ftl"></td>
    <td>${article.username!''}</td>
    <td>${article.createdTime?datetime}</td>
    <td>
        <div class="hidden-sm hidden-xs btn-group">
            <a class="btn btn-xs btn-info" href="${ctx}/dashboard/article/${article.id}">
                <i class="ace-icon fa fa-info-circle bigger-120"></i>
            </a>
            <a class="btn btn-xs btn-danger" title="${article.title}" data-role="delete-article"
               data-url="${ctx}/dashboard/article/${article.id}/delete">
                <i class="ace-icon fa fa-trash-o bigger-120"></i>
            </a>
        </div>
    </td>
</tr>