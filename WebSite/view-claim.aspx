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
        <li class="active"><a href="#">View Claims</a></li>
        <li><a href="add-property.aspx">Add Property</a></li>
      
    </ul>
  </div>
</nav>
    <div class="container">
        <div class='panel-group'>
        <div class='panel panel-success'>
        <div class='panel-heading'><h4 class='panel-title'><a data-toggle='collapse' data-parent='#accordion' data-target='#collapseOne' aria-expanded='true' aria-controls='collapseOne' href='#collapseOne'>Accepted Claims: Click to expand</a></h4></div>
        <div id='collapseOne' class='panel-collapse collapse '>
         <div class='panel-body accordion-body'>
            <h3>Approved Claims</h3>
    <asp:GridView ID="GridViewViewAcceptedClaims" EmptyDataText="No records has been added" CssClass="table table-bordered" runat="server" AutoGenerateColumns="false"
     >
    <Columns>
        <asp:BoundField  DataField="claim_id" HeaderText="Claim Reference #" />
        <asp:BoundField  DataField="accident_date" HeaderText="Claim date"  DataFormatString="{0:MM/dd/yyyy}"  />
        <asp:BoundField  DataField="accident_address" HeaderText="Accident Address" />
        <asp:BoundField  DataField="vin" HeaderText="VIN (If applciable)" />
        <asp:BoundField  DataField="accident_description" HeaderText="Description" />
        <asp:BoundField  DataField="claim_status" HeaderText="STATUS" ItemStyle-ForeColor="Green"/>
        <asp:BoundField  DataField="reviewer_comments" HeaderText="COMMENTS" />
    </Columns>
</asp:GridView>
             </div>
            </div>
            </div>
            </div>
         <div class='panel-group'>
        <div class='panel panel-danger'>
        <div class='panel-heading'><h4 class='panel-title'><a data-toggle='collapse' data-parent='#accordion' data-target='#collapsetwo' aria-expanded='true' aria-controls='collapsetwo' href='#collapsetwo'>Rejected Claims: Click to expand</a></h4></div>
        <div id='collapsetwo' class='panel-collapse collapse '>
         <div class='panel-body accordion-body'>
        <h3>Rejected Claims</h3>
        <asp:GridView ID="GridViewViewRejectedClaims" EmptyDataText="No records has been added" CssClass="table table-bordered" runat="server" AutoGenerateColumns="false" >
    <Columns>
        <asp:BoundField  DataField="claim_id" HeaderText="Claim Reference #" />
        <asp:BoundField  DataField="accident_date" HeaderText="Claim date"  DataFormatString="{0:MM/dd/yyyy}"  />
        <asp:BoundField  DataField="accident_address" HeaderText="Accident Address" />
        <asp:BoundField  DataField="vin" HeaderText="VIN (If applciable)" />
        <asp:BoundField  DataField="accident_description" HeaderText="Description" />
        <asp:BoundField  DataField="claim_status" HeaderText="STATUS" ItemStyle-ForeColor="Red"/>
        <asp:BoundField  DataField="reviewer_comments" HeaderText="COMMENTS" />
    </Columns>
</asp:GridView>
             </div>
            </div>
            </div>
             </div>
         <div class='panel-group'>
        <div class='panel panel-info'>
        <div class='panel-heading'><h4 class='panel-title'><a data-toggle='collapse' data-parent='#accordion' data-target='#collapsethree' aria-expanded='true' aria-controls='collapsethree' href='#collapsethree'>Pending Claims: Click to expand</a></h4></div>
        <div id='collapsethree' class='panel-collapse collapse '>
         <div class='panel-body accordion-body'>
        <h3>Pending Claims</h3>
        <asp:GridView ID="GridViewViewPendingClaims" EmptyDataText="No records has been added" CssClass="table table-bordered" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField  DataField="claim_id" HeaderText="Claim Reference #" />
        <asp:BoundField  DataField="accident_date" HeaderText="Claim date"  DataFormatString="{0:MM/dd/yyyy}"  />
        <asp:BoundField  DataField="accident_address" HeaderText="Accident Address" />
        <asp:BoundField  DataField="vin" HeaderText="VIN (If applciable)" />
        <asp:BoundField  DataField="accident_description" HeaderText="Description" />
        <asp:BoundField  DataField="claim_status" HeaderText="STATUS" ItemStyle-ForeColor="Orange"/>
        <asp:BoundField  DataField="reviewer_comments" HeaderText="COMMENTS" />
    </Columns>
</asp:GridView>
             </div>
            </div>
            </div>
             </div>
        </div>
</asp:Content>
