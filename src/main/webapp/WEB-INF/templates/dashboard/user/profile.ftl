<#assign title="个人资料" />
<#assign header="修改" />

<@override name="breadcrumbs">
<ul class="breadcrumb">
    <li>
        <i class="menu-icon fa fa-tachometer"></i>
        <a href="${ctx}/dashboard">工作台</a>
    </li>
    <li class="active">
        个人
    </li>
</ul>
</@override>

<@override name="content">
<div class="col-xs-12">
    <form class="form-horizontal" role="form" id="user-profile-form" method="post"
          action="${ctx}/dashboard/user/${user.id}/profile">
        <div class="row">
            <div class="form-group">
                <label for="title" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">ID</label>

                <div class="col-xs-12 col-sm-6">
                <span class="block input-icon input-icon-right">
                    <@spring.formInput "user.id" 'class="width-100" readonly' />
                    <i class="ace-icon fa fa-times-circle hide"></i>
                    <i class="ace-icon fa fa-check-circle hide"></i>
                </span>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline"></div>
            </div>

            <div class="form-group">
                <label for="categoryId" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">用户名</label>

                <div class="col-xs-12 col-sm-6">
                <span class="block input-icon input-icon-right">
                    <@spring.formInput "user.username" 'class="width-100" readonly' />
                    <i class="ace-icon fa fa-times-circle hide"></i>
                    <i class="ace-icon fa fa-check-circle hide"></i>
                </span>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline"></div>
            </div>

            <div class="form-group">
                <label for="categoryId" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">真实姓名</label>

                <div class="col-xs-12 col-sm-6">
                <span class="block input-icon input-icon-right">
                    <@spring.formInput "user.realname" 'class="width-100"' />
                    <i class="ace-icon fa fa-times-circle hide"></i>
                    <i class="ace-icon fa fa-check-circle hide"></i>
                </span>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline"></div>
            </div>

            <div class="form-group">
                <label for="categoryId" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">手机号</label>

                <div class="col-xs-12 col-sm-6">
                <span class="block input-icon input-icon-right">
                    <@spring.formInput "user.mobile" 'class="width-100"' />
                    <i class="ace-icon fa fa-times-circle hide"></i>
                    <i class="ace-icon fa fa-check-circle hide"></i>
                </span>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline"></div>
            </div>

            <div class="form-group">
                <label for="categoryId" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">电子邮箱</label>

                <div class="col-xs-12 col-sm-6">
                <span class="block input-icon input-icon-right">
                    <@spring.formInput "user.email" 'class="width-100"' />
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
<script src="${ctx}/static/app/js/dashboard/user/profile.js"></script>
</@override>

<@extends name="../../dashboard/layout.ftl"/>
