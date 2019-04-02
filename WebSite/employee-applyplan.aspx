<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master.Master" AutoEventWireup="true" CodeBehind="employee-applyplan.aspx.cs" Inherits="WebSite.employee_applyplan" %>
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
        <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Employee Dashboard</a>
    </div>
    <ul class="nav navbar-nav">
    <li><a href="EmployeeDashboard.aspx">Profile</a></li>
      <li><a href="employee-searchplan.aspx">Search Plan</a></li>
      <li class="active"><a href="#">Apply Plan</a></li>
    <li><a href="#">Review Claims</a></li>
    </ul>
  </div>
</nav>
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
        <asp:PlaceHolder ID="employeeplans" runat="server"></asp:PlaceHolder>
    </div>

</asp:Content>
