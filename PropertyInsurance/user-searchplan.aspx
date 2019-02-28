<%@ Page Title="" Language="C#" MasterPageFile="~/userPage.Master" AutoEventWireup="true" CodeBehind="user-searchplan.aspx.cs" Inherits="PropertyInsurance.user_searchplan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Your Wall</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="userPage.aspx">Home</a></li>
      <li><a href="#">Search Plan</a></li>
      <li><a href="paymentGateway.aspx" target="_blank">Premium Payment</a></li>
      <li><a href="find-agent.aspx" >Find Agent</a></li>
    
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><li><asp:Button ID="Button1" runat="server" CssClass="btn btn-link" Text="Logout" 
              onclick="Button1_Click"></asp:Button> </li></li>
    </ul>
  </div>
</nav>
<div id="search-plan" class="container">
<h2><i>Welcome,</i></h2>
<p>We have a wide choices of insurance plans that will help you in 
placing your properties in the safe hands.</p>
<h4>Choose one from the given....</h4>
<div class="row">
<div class="col-lg-4 col-md-8 col-sm-12 col-xs-12">
<asp:DropDownList  ID="DropdownList1" ClientIDMode="Static" CssClass="items form-control" runat="server">
<asp:ListItem Value="empty">--Select--</asp:ListItem>
<asp:ListItem Value="car" >Car</asp:ListItem>
<asp:ListItem Value="home" >Home</asp:ListItem>
<asp:ListItem Value="bike" >Bike</asp:ListItem>
</asp:DropDownList><br />
<asp:Button ID="Button2" ClientIDMode="Static" CssClass="btn btn-info" 
        runat="server" Text="Search Available Plans" onclick="Button2_Click"/>
</div>
</div>
</div>
<div class="container">
<asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
</div>
   
<div class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2016- Property Insurance Management System
     
      </p>

    </div>




</div>
</asp:Content>
