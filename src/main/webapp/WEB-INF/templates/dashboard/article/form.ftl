<#assign title="发表帖子" />
<#assign header="发帖" />

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
<div class="col-xs-12">
    <form class="form-horizontal" role="form" id="article-create-form" method="post"
          action="${ctx}/dashboard/article/save">
        <div class="row">
            <div class="form-group">
                <label for="title" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">标题</label>

                <div class="col-xs-12 col-sm-6">
                <span class="block input-icon input-icon-right">
                    <@spring.formInput "article.title" 'class="width-100"' />
                    <i class="ace-icon fa fa-times-circle hide"></i>
                    <i class="ace-icon fa fa-check-circle hide"></i>
                </span>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline"></div>
            </div>

            <div class="form-group">
                <label for="categoryId" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">栏目</label>

                <div class="col-xs-12 col-sm-6">
                <span class="block input-icon input-icon-right">
                    <select name="categoryId" id="categoryId" class="form-control">
                        <option value="">-- 请选择栏目 --</option>
                        <#list categories as category>
                            <option value="${category.id}">${category.name}</option>
                        </#list>
                    </select>
                    <i class="ace-icon fa fa-times-circle hide"></i>
                    <i class="ace-icon fa fa-check-circle hide"></i>
                </span>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline"></div>
            </div>

            <div class="form-group">
                <label for="body" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">内容</label>

                <div class="col-xs-12 col-sm-6">
                <span class="block input-icon input-icon-right">
                    <textarea id="body" name="body" style="width:100%;height:260px;"></textarea>
                    <i class="ace-icon fa fa-times-circle hide"></i>
                    <i class="ace-icon fa fa-check-circle hide"></i>
                </span>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline"></div>
            </div>
        </div>

        <div class="clearfix form-actions">
            <div class="col-md-offset-4 col-md-8">
                <button class="btn btn-info" data-toggle="form-submit" data-loading-text="正在保存...">
                    <i class="ace-icon fa fa-check bigger-110"></i>
                    <@spring.message "app.button.save"/>
                </button>

                &nbsp; &nbsp; &nbsp;
                <button class="btn" type="reset">
                    <i class="ace-icon fa fa-undo bigger-110"></i>
                    <@spring.message "app.button.cancel"/>
                </button>
            </div>
        </div>
    </form>
</div>
</@override>

<@override name="script">
<script src="${ctx}/static/app/js/dashboard/article/form.js"></script>
</@override>

<@extends name="../../dashboard/layout.ftl"/>
