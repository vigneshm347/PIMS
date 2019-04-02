<%@ Page Title="" Language="C#" MasterPageFile="~/userPage.Master" AutoEventWireup="true" CodeBehind="view-claim.aspx.cs" Inherits="WebSite.view_claim" %>
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
      <li><a href="user-searchplan.aspx">Search Plan</a></li>
      <li><a href="paymentGateway.aspx" target="_blank">Premium Payment</a></li>
      <li><a href="new-claim.aspx">New Claim</a></li>
    <li><a href="#">View Claims</a></li>
      
    </ul>
  </div>
</nav>
    <div class="container">
    <asp:GridView ID="GridViewViewClaims" EmptyDataText="No records has been added" CssClass="table table-bordered" runat="server" AutoGenerateColumns="false" AllowPaging="true"
     PageSize="10">
    <Columns>
        <asp:BoundField  DataField="claim_id" HeaderText="Claim Reference #" />
        <asp:BoundField  DataField="accident_date" HeaderText="Claim date" />
        <asp:BoundField  DataField="accident_address" HeaderText="Accident Address" />
        <asp:BoundField  DataField="vin" HeaderText="VIN (If applciable)" />
        <asp:BoundField  DataField="accident_description" HeaderText="Description" />
        <asp:BoundField  DataField="claim_status" HeaderText="STATUS" />
    </Columns>
</asp:GridView>
        </div>
</asp:Content>
