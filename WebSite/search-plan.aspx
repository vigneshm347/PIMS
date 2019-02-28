<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true"
    CodeBehind="search-plan.aspx.cs" Inherits="PropertyInsurance.search_plan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <nav class="nav-layout">
<div class="nav-header">ADMIN<span class="glyphicon glyphicon-cog"><span></div>
<div class="items">
<ul class="item-group" type="none">
<li class="item-list"><span class="glyphicon glyphicon-signal"></span><a href="admin.aspx">Statistics</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-search"></span><a  href="#">Search Plan</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-file"></span><a href="ApplyPlan.aspx">Apply Plan</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a  href="add-customer.aspx">Add Customer</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
 <li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a  href="manage-users.aspx">Manage users</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-file"></span><a href="paymentGateway.aspx" target="_blank">Premium Payment</a><span class=" arrow 	glyphicon glyphicon-menu-right"></span></li>
</ul>
</div>
</nav>
    </div>
    <div class="well well-sm">
        <h5>
            Welcome to Property Insurance Management System, Admin Panel</h5>
    </div>
    <div id="mobile-view" class="well well-sm">
        Search Plan</div>
    <div class="collapse">
        <ul class="collapse-list" type="none">
            <li class="collapse-item-list"><a href="admin.aspx"><span class="glyphicon glyphicon-signal">
            </span></a></li>
            <li class="collapse-item-list"><a href="#"><span class="glyphicon glyphicon-search">
            </span></a></li>
            <li class="collapse-item-list"><a href="ApplyPlan.aspx"><span class="glyphicon glyphicon-file">
            </span></a></li>
            <li class="collapse-item-list"><a href="add-customer.aspx"><span class="glyphicon glyphicon-plus-sign">
            </span></a></li>
            <li><a href="paymentGateway.aspx" target="_blank"><span class="glyphicon glyphicon-eye-open">
            </span></a></li>
        </ul>
    </div>
    <div id="search-plan" class="container">
        <h4>
            Choose one from the given....</h4>
        <div class="row">
            <div class="col-lg-4 col-md-8 col-sm-12 col-xs-12">
                <form>
                <div style="display: inline;">
                    <asp:DropDownList ID="ddlproduct" ClientIDMode="Static" CssClass="items form-control"
                        runat="server">
                        <asp:ListItem Value="empty">--Select--</asp:ListItem>
                        <asp:ListItem Value="car">Car</asp:ListItem>
                        <asp:ListItem Value="home">Home</asp:ListItem>
                        <asp:ListItem Value="bike">Bike</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Button ID="btnsearch" ClientIDMode="Static" CssClass="btn btn-success" runat="server"
                        Text="Search Available Plans" OnClick="btnsearch_Click" />
                </div>
                </form>
                <br />
                <asp:PlaceHolder ID="phplansrch" runat="server"></asp:PlaceHolder>
            </div>
        </div>
    </div>
</asp:Content>
