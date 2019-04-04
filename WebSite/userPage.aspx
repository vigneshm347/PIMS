<%@ Page Title="" Language="C#" MasterPageFile="~/userPage.Master" AutoEventWireup="true" CodeBehind="userPage.aspx.cs" Inherits="PropertyInsurance.userPage1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="HiddenField1" ClientIDMode="Static" runat="server" />

	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Your Wall</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#">Home</a></li>
      <li><a href="user-searchplan.aspx">Search Plan</a></li>
      <li><a href="paymentGateway.aspx" target="_blank">Premium Payment</a></li>
      <li><a href="new-claim.aspx">New Claim</a></li>
        <li><a href="view-claim.aspx">View Claims</a></li>
        <li><a href="add-property.aspx">Add Property</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><asp:Button ID="btnlogout" runat="server" CssClass="btn btn-link" Text="Logout" 
              onclick="btnlogout_Click"></asp:Button> </li>
    </ul>
  </div>
</nav>

<div id="content-div" >
<asp:PlaceHolder ID="phuserinfo" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder ID="phpolinfo" runat="server"></asp:PlaceHolder>
</div>

<div class="row">

</div>

<div class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2016- Property Insurance Management System
     
      </p>

    </div>
    </div>
</asp:Content>
