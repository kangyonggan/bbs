<#if user.status == "unlock">
<a href="javascript:" data-role="status-user"
   data-url="${ctx}/dashboard/user/${user.id}/lock">
    <span class="label label-success arrowed-in">未锁定</span>
</a>
<#elseif user.status == "lock">
<a href="javascript:" data-role="status-user"
   data-url="${ctx}/dashboard/user/${user.id}/unlock">
    <span class="label label-danger arrowed-in">已锁定</span>
</a>
</#if>