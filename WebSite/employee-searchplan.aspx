<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master.Master" AutoEventWireup="true" CodeBehind="employee-searchplan.aspx.cs" Inherits="WebSite.employee_searchplan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Employee Dashboard</a>
    </div>
    <ul class="nav navbar-nav">
       <li><a href="EmployeeDashboard.aspx">Profile</a></li>
      <li class="active"><a href="#">Search Plan</a></li>
      <li><a href="employee-applyplan.aspx">Apply Plan</a></li>
    <li><a href="#">Review Claims</a></li>
    </ul>
  </div>
</nav>
    <div id="search-plan" class="container">
    
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
<asp:PlaceHolder ID="PlaceHolderEmpSearchPlan" runat="server"></asp:PlaceHolder>
</div>
   
<div class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2016- Property Insurance Management System
     
      </p>
    </div>
</div>
</asp:Content>
