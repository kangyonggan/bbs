<#assign title="后台">
<#assign header="后台">

<@override name="breadcrumbs">
<ul class="breadcrumb">
    <li class="active">
        <i class="menu-icon fa fa-tachometer"></i>
        后台
    </li>
</ul>
</@override>

<@override name="content">
<div class="row">
    <div class="col-xs-12">
        <div class="alert alert-block alert-success">
            <button type="button" class="close" data-dismiss="alert">
                <i class="ace-icon fa fa-times"></i>
            </button>

            <i class="ace-icon fa fa-check green"></i>

            欢迎进入
            <strong class="green">
                <@spring.message "app.name" />
                <small><@spring.message "app.version"/></small>
            </strong>,
            您可以在从左边选取菜单进行操作.
        </div>
    </div>
</div>
</@override>

<@override name="script">
<script src="${ctx}/static/app/js/admin/index/index.js"></script>
</@override>

<@extends name="../../dashboard/layout.ftl"/>