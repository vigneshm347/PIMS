<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true"
    CodeBehind="ApplyPlan.aspx.cs" Inherits="PropertyInsurance.ApplyPlan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .goLink
        {
            text-decoration: none;
            color: #000;
            font-weight: 500;
            font-size: 15px;
            padding: 10px;
        }
        .goLink:hover
        {
            text-decoration: underline;
            color: #16a085;
            font-size: 15px;
            font-weight: 500;
            padding: 10px;
        }
    </style>
    <div class="row">
        <nav class="nav-layout">
<div class="nav-header">ADMIN<span class="glyphicon glyphicon-cog"><span></div>
<div class="items">
<ul class="item-group" type="none">
<li class="item-list"><span class="glyphicon glyphicon-signal"></span><a href="admin.aspx">Statistics</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-search"></span><a  href="search-plan.aspx">Search Plan</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-file"></span><a href="#">Apply Plan</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="add-customer.aspx">Add Customer</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="add-employee.aspx">Add Employee</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="manage-users.aspx">Manage Users</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="manage-employee.aspx">Manage Employee</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="add-new-plan.aspx">Manage plan</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="add-new-policy.aspx">Add new Policy</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="manage-policy.aspx">Manage Policy</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-file"></span><a href="paymentGateway.aspx" target="_blank">Premium Payment</a><span class=" arrow 	glyphicon glyphicon-menu-right"></span></li>
</ul>
</div>
</nav>
    </div>
    <div class="well well-sm">
        <h5>
            Welcome to Property Insurance Management System, Admin Panel</h5>
    </div>
    <div id="content">
    </div>
    <div id="mobile-view" class="well well-sm">
        Add Customer</div>
    <div class="collapse">
        <ul class="collapse-list" type="none">
            <li class="collapse-item-list"><a href="admin.aspx"><span class="glyphicon glyphicon-signal">
            </span></a></li>
            <li class="collapse-item-list"><a href="search-plan.aspx"><span class="glyphicon glyphicon-search">
            </span></a></li>
            <li class="collapse-item-list"><a href="#"><span class="glyphicon glyphicon-file"></span>
            </a></li>
            <li class="collapse-item-list"><a href="add-customer.aspx"><span class="glyphicon glyphicon-plus-sign">
            </span></a></li>
            <li><a href="paymentGateway.aspx" target="_blank"><span class="glyphicon glyphicon-eye-open">
            </span></a></li>
        </ul>
    </div>
    <div id="customer-add">
        <label>
            <span style="color: #FF0000;">* Note : The search is based on less than or equal to
                the given data</span></label>
        <div class="row">
            <div class="col-lg-6 col-sm-12 col-xs-12">
                <label for="annual">
                    Product Type</label>
                <asp:DropDownList ID="ddlprodtype" ClientIDMode="Static" CssClass="form-control"
                    runat="server">
                    <asp:ListItem Value="empty">--Select--</asp:ListItem>
                    <asp:ListItem Value="car">Car</asp:ListItem>
                    <asp:ListItem Value="home">Home</asp:ListItem>
                    <asp:ListItem Value="bike">Bike</asp:ListItem>
                </asp:DropDownList>
                <br />
            </div>
            <div class="col-lg-3 col-sm-12 col-xs-12">
                <label for="dependents">
                    Number Of Dependents</label>
                <asp:TextBox ID="txtdependents" required="true" runat="server" TextMode="Number" ClientIDMode="Static"
                    CssClass="form-control"></asp:TextBox><br />
            </div>
            <div class="col-lg-3 col-sm-12 col-xs-12">
                <label for="age">
                    Age</span></label>
                <asp:TextBox ID="txtcage" TextMode="Number" required="true" CssClass="form-control"
                    ClientIDMode="Static" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
        </div>
        <div class="row">
            <div class="col-lg-6 col-sm-12 col-xs-12">
                <asp:Button ID="btnapply" runat="server" ClientIDMode="Static" class="btn btn-warning register"
                    Text="Find appropriate plans..." OnClick="btnapply_Click" />
            </div>
        </div>
        <asp:Label ID="lblnote" runat="server" ClientIDMode="Static"></asp:Label>
        <asp:PlaceHolder ID="phplans" runat="server"></asp:PlaceHolder>
    </div>
</asp:Content>
