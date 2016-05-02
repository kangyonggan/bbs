<div id="header">
    <div class="navbar navbar-default">
        <div class="navbar-container">
            <div class="navbar-header pull-left">
                <a href="${ctx}/" class="navbar-brand">
                    <small>
                        <i class="fa fa-leaf"></i>
                    <@spring.message "app.name"/>
                    </small>
                </a>
            </div>

            <div class="navbar-buttons navbar-header pull-right" role="navigation">
                <#if !token??>
                    <a href="${ctx}/login">登录</a>
                    | <a href="${ctx}/register">注册</a>
                <#else>
                    欢迎: <a href="${ctx}/dashboard">${token.realname}</a>
                </#if>
            </div>
        </div>
    </div>
</div>