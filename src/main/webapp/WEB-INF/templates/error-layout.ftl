<#assign ctx="${(rca.contextPath)!''}">

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title><@spring.message "app.name"/> - ${title!''}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <meta name="renderer" content="webkit">

    <!-- basic styles -->
    <link rel="stylesheet" href="${ctx}/static/ace/assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="${ctx}/static/ace/assets/css/font-awesome.css"/>
    <link rel="stylesheet" href="${ctx}/static/ace/assets/css/jquery.gritter.css"/>

    <!-- fonts -->
    <link rel="stylesheet" href="${ctx}/static/ace/assets/css/ace-fonts.css"/>

    <!-- skins -->
    <link rel="stylesheet" href="${ctx}/static/ace/assets/css/ace-skins.css"/>

    <!-- ace styles -->
    <link rel="stylesheet" href="${ctx}/static/ace/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${ctx}/static/ace/assets/css/ace-part2.css" class="ace-main-stylesheet"/>
    <![endif]-->

    <link rel="stylesheet" href="${ctx}/static/ace/assets/css/ace-rtl.css"/>

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="${ctx}/static/ace/assets/css/ace-ie.css"/>
    <![endif]-->

    <link rel="stylesheet" href="${ctx}/static/app/css/app.css"/>
<@block name="style"/>

    <!--[if lte IE 8]>
    <script src="${ctx}/static/libs/html5shiv.min.js"></script>
    <script src="${ctx}/static/libs/respond.min.js"></script>
    <![endif]-->
</head>

<body class="${bodyClass!"no-skin"}">

<#include "navbar.ftl">

<div class="main-container" id="main-container">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="page-content">
                <div class="main-content">
                    <div class="main-content-inner">
                        <div class="page-content">
                            <div class="row">
                                <div class="col-sm-offset-2 col-sm-8 col-sm-offset-2">
                                    <div class="error-container">
                                        <div class="well">
                                            <h1 class="grey lighter smaller">
                            <span class="blue bigger-125">
                                <i class="ace-icon fa fa-sitemap"></i>
                                错误
                            </span>
                                            </h1>

                                            <hr/>

                                        <@block name = "error" />

                                            <hr/>
                                            <div class="space"></div>

                                            <div class="center">
                                                <a href="javascript:history.back()" class="btn btn-grey">
                                                    <i class="ace-icon fa fa-arrow-left"></i>
                                                    返回
                                                </a>
                                                <a href="/dashboard" class="btn btn-primary">
                                                    <i class="ace-icon fa fa-tachometer"></i>
                                                    工作台
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<#include "footer.ftl">

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
</div>

<script src="${ctx}/static/libs/jquery/jquery.min.js"></script>
<script src="${ctx}/static/libs/bootstrap/bootstrap.min.js"></script>
<script src="${ctx}/static/ace/assets/js/ace-extra.min.js"></script>
<script src="${ctx}/static/ace/assets/js/ace-elements.min.js"></script>
<script src="${ctx}/static/ace/assets/js/ace.min.js"></script>
<@block name="script"/>
</body>
</html>