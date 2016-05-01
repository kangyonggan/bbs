<@override name="web-style">
    <@block name="style"/>
</@override>

<@override name="main">

    <#include "navbar.ftl">

<div id="main">
    <div class="breadcrumbs2">
        <span>您当前的位置:</span>
        <@block name="breadcrumbs"/>
    </div>

    <div class="content">
        <@block name="content"/>
    </div>
</div>

    <#include "friend.ftl">
</@override>


<@override name="web-script">
    <@block name="script"/>
</@override>

<@extends name="layout.ftl"/>
