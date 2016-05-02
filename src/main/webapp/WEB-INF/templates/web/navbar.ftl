<div id="navbar">
    <ul>
        <li><a href="${ctx}/">首页</a></li>
    <#list categories as c>
        <li><a href="${ctx}/article/category/${c.code}" <#if c.id==category.id>class="active"</#if>>${c.name}</a></li>
    </#list>
    </ul>
</div>