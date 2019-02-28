<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="stats.aspx.cs" Inherits="PropertyInsurance.stats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="row">
<nav class="nav-layout">
<div class="nav-header">ADMIN<span class="glyphicon glyphicon-cog"><span></div>
<div class="items">
<ul class="item-group" type="none">
<li class="item-list"><span class="glyphicon glyphicon-signal"></span><a href="#">Statistics</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-search"></span><a  href="search-plan.aspx">Search Plan</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-file"></span><a href="ApplyPlan.aspx">Apply Plan</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="add-customer.aspx">Add Customer</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-file"></span><a href="paymentGateway.aspx" target="_blank">Premium Payment</a><span class=" arrow 	glyphicon glyphicon-menu-right"></span></li>
</ul>
</div>
</nav>
</div>

<div class="well well-sm"><h5>Welcome to Property Insurance Management System, Admin Panel</h5><span class="logout"><asp:Button ID="Button1" class=" btn-danger btn btn-sm" runat="server"  Text="LOGOUT"></asp:Button></span></div>
<div id="content"></div>

<div id="mobile-view" class="well well-sm">Statistics</div>
<div class="collapse">
<ul class="collapse-list" type="none" >
<li class="collapse-item-list"><a href="#"><span class="glyphicon glyphicon-signal"></span></a></li>
<li class="collapse-item-list"><a href="search-plan.aspx"><span class="glyphicon glyphicon-search"></span></a></li>
<li class="collapse-item-list"><a href="ApplyPlan.aspx"><span class="glyphicon glyphicon-file"></span></a></li>
<li class="collapse-item-list"><a href="add-customer.aspx"><span class="glyphicon glyphicon-plus-sign"></span></a></li>
<li ><a href="paymentGateway.aspx"><span class="glyphicon glyphicon-eye-open"></span></a></li>
</ul>
</div>
</body>

<div class="row statistics">
<span class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
<div class="user-count"><i class="fa fa-users" aria-hidden="true"></i></div>
<label>Users Registered</label>
</span>

<span class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
<div class="policy-count"><i class="fa fa-shopping-cart" aria-hidden="true"></i></div>
<label>Policies Issued</label>
</span>

<span class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
<div class="plans-bank-count"><i class="fa fa-globe" aria-hidden="true"></i></div>
<label>Plans Available</label>
</span>
</div>


</div>
</asp:Content>
