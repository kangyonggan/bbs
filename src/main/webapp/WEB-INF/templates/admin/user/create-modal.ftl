<@override name="modal-title"><#if !user.id??>添加<#else>编辑</#if>用户</@override>

<@override name="modal-body">
<form class="form-horizontal" role="form" id="user-create-form" method="post"
    <#if !user.id??>
      action="${ctx}/admin/user/save"
    <#else>
      action="${ctx}/admin/user/${user.id}/update"
    </#if>>
    <div class="row">
        <div class="form-group">
            <label for="username" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">用户名</label>

            <div class="col-xs-12 col-sm-6">
                <span class="block input-icon input-icon-right">
                    <@spring.formInput "user.username" 'class="width-100"' />
                    <i class="ace-icon fa fa-times-circle hide"></i>
                    <i class="ace-icon fa fa-check-circle hide"></i>
                </span>
            </div>
            <div class="help-block col-xs-12 col-sm-reset inline"></div>
        </div>

        <#if !user.id??>
            <div class="form-group">
                <label for="password" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">密码</label>

                <div class="col-xs-12 col-sm-6">
                <span class="block input-icon input-icon-right">
                    <@spring.formInput "user.password" 'class="width-100"' />
                    <i class="ace-icon fa fa-times-circle hide"></i>
                    <i class="ace-icon fa fa-check-circle hide"></i>
                </span>
                </div>
                <div class="help-block col-xs-12 col-sm-reset inline"></div>
            </div>
        </#if>

        <div class="form-group">
            <label for="realname" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">真实姓名</label>

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
            <label for="mobile" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">手机号</label>

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
            <label for="email" class="col-xs-12 col-sm-3 col-md-3 control-label no-padding-right">电子邮箱</label>

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
</form>
</@override>

<@override name="modal-footer">
<button class="btn btn-sm" data-dismiss="modal">
    <i class="ace-icon fa fa-times"></i>
    <@spring.message "app.button.cancel"/>
</button>

<button class="btn btn-sm btn-primary" id="user-create-btn"
        data-loading-text="正在保存..." data-toggle="form-submit" data-target="#user-create-form">
    <i class="ace-icon fa fa-check"></i>
    <@spring.message "app.button.save"/>
</button>
<script src="${ctx}/static/app/js/admin/user/create-modal.js"></script>
</@override>

<@extends name="../../modal-layout.ftl"/>