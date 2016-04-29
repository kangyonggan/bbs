<#assign title="工作台">

<@override name="breadcrumbs">
<ul class="breadcrumb">
    <li>
        <i class="ace-icon fa fa-home home-icon"></i>
        <a href="#">Home</a>
    </li>
    <li class="active">Dashboard</li>
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

            Welcome to
            <strong class="green">
                Ace
                <small>(v1.3.3)</small>
            </strong>,
            the lightweight, feature-rich and easy to use admin template.
        </div>
    </div>
</div>
</@override>

<@extends name="../layout.ftl"/>