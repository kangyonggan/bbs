<#assign title="首页">

<@override name="web-style">
<link rel="stylesheet" href="${ctx}/static/app/css/unslider.css"/>
</@override>

<@override name="main">
<div id="main">
    <div class="banner" style="background: lightyellow;">
        <div class="slider">
            <ul>
                <li><img src="${ctx}/static/app/images/slider01.jpg"/></li>
                <li><img src="${ctx}/static/app/images/slider02.jpg"/></li>
                <li><img src="${ctx}/static/app/images/slider03.jpg"/></li>
            </ul>
        </div>
    </div>
    <div style="width: 200px; float: left;">
        <div class="block" style="background: lightseagreen;">
            <a class="block-category" href="${ctx}/article/category/1001">校园生活</a>
        </div>
        <div class="block" style="background: lightblue;">
            <a class="block-category" href="${ctx}/article/category/1002">娱乐八卦</a>
        </div>
    </div>
    <div class="hi-block" style="background: lightcoral;">
        <a class="block-category" href="${ctx}/article/category/1004">校花校草</a>
    </div>
    <div class="big-block" style="background: mediumpurple;">
        <a class="block-category" href="${ctx}/article/category/1005">学习交流</a>
    </div>
    <div class="big-block" style="background: chocolate;">
        <a class="block-category" href="${ctx}/article/category/1006">莲蓬鬼话</a>
    </div>
    <div class="block" style="background: forestgreen;">
        <a class="block-category" href="${ctx}/article/category/1003">情感天地</a>
    </div>
</div>
</@override>

<@override name="web-script">
<script src="${ctx}/static/libs/jquery/unslider.min.js"></script>
<script src="${ctx}/static/app/js/web/index/index.js"></script>
</@override>

<@extends name="../layout.ftl"/>