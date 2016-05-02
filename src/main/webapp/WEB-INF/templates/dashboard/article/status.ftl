<#if article.status == "published">
<span class="label label-success arrowed-in">已发布</span>
<#elseif article.status == "unpublished">
<span class="label label-primary arrowed-in">未发布</span>
<#elseif article.status == "unpublished">
<span class="label label-danger arrowed-in">回收站</span>
</#if>