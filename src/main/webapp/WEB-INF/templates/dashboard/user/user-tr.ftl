<#assign ctx="${(rca.contextPath)!''}">

<tr id="user-${user.id}">
    <td>${user.id}</td>
    <td>
        <a href="${ctx}/dashboard/user/${user.id}" data-toggle="modal" data-target="#myModal">${user.username}</a>
    </td>
    <td>${user.realname!''}</td>
    <td><#include "status.ftl"></td>
    <td>${user.mobile!''}</td>
    <td>${user.email!''}</td>
    <td>${user.createdtime?datetime}</td>
    <td>
        <div class="hidden-sm hidden-xs btn-group">
            <a class="btn btn-xs btn-info" href="${ctx}/dashboard/user/${user.id}" data-toggle="modal"
               data-target="#myModal">
                <i class="ace-icon fa fa-info-circle bigger-120"></i>
            </a>
            <a class="btn btn-xs btn-warning" href="${ctx}/dashboard/user/${user.id}/edit" data-toggle="modal"
               data-target="#myModal">
                <i class="ace-icon fa fa-pencil bigger-120"></i>
            </a>
            <a class="btn btn-xs btn-danger" title="${user.username}" data-role="delete-user"
               data-url="${ctx}/dashboard/user/${user.id}/delete">
                <i class="ace-icon fa fa-trash-o bigger-120"></i>
            </a>
        </div>
    </td>
</tr>