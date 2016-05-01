<@override name="page-style">
    <@block name="style"/>
</@override>

<@override name="main">
    <#include "../sidebar.ftl">
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <@block name="breadcrumbs"/>
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                ${header!''}
                    <span class="pull-right inline">
                        <@block name="button" />
                        </span>
                </h1>
            </div>

            <div class="row">
                <@block name="content"/>
            </div>
        </div>
    </div>
</div>
</@override>

<@override name="page-script">
    <@block name="script"/>
</@override>
<@extends name="../layout.ftl"/>