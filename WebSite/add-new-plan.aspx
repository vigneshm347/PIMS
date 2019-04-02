<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="add-new-plan.aspx.cs" Inherits="WebSite.add_new_plan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class="row">
<nav class="nav-layout">
<div class="nav-header">ADMIN<span class="glyphicon glyphicon-cog"><span></div>
<div class="items">
<ul class="item-group" type="none">
<li class="item-list"><span class="glyphicon glyphicon-signal"></span><a href="admin.aspx">Statistics</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-search"></span><a  href="search-plan.aspx">Search Plan</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-file"></span><a href="ApplyPlan.aspx">Apply Plan</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="add-customer.aspx">Add Customer</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="add-employee.aspx">Add Employee</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="manage-users.aspx">Manage Users</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="manage-employee.aspx">Manage Employee</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="#">Manage plan</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
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
            <li class="collapse-item-list"><a href="ApplyPlan.aspx"><span class="glyphicon glyphicon-file">
            </span></a></li>
            <li class="collapse-item-list"><a href="#"><span class="glyphicon glyphicon-plus-sign">
            </span></a></li>
            <li><a href="paymentGateway.aspx" target="_blank"><span class="glyphicon glyphicon-eye-open">
            </span></a></li>
        </ul>
    </div>
            <asp:ScriptManager runat="server" ID="scriptManager" EnablePartialRendering="true" EnablePageMethods="true" />
            <div style="position:absolute; left: 40%">
            <asp:UpdatePanel UpdateMode="Always" runat="server">
            <ContentTemplate>

            <asp:GridView 
                CssClass="table table-bordered" 
                ID="GridViewPlanInfo" 
                runat="server" 
                PageSize = "6"
                AllowPaging ="true"
                AutoGenerateColumns="false" 
                ShowFooter="true"
                nRowDataBound="OnRowDataBound"
                DataKeyNames="id" 
                OnRowEditing="OnRowEditing" 
                OnRowCancelingEdit="OnRowCancelingEdit"
                OnPageIndexChanging = "OnPaging"
                OnRowUpdating="OnRowUpdating"
                >
                <Columns>
                    <asp:TemplateField HeaderText="Name" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="planname" runat="server" Text='<%# Eval("plan_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPlanName" runat="server" Text='<%# Eval("plan_name") %>' Width="140"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Premium Amount">
                            <ItemTemplate>
                                <asp:Label ID="premiumamt" runat="server" Text='<%# Eval("premium_amt") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPremiumAmt" runat="server" Text='<%# Eval("premium_amt") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-danger" ShowEditButton="true" ItemStyle-Width="150" />
                </Columns>
            <pagerstyle backcolor="lightBlue"
              verticalalign="Bottom"
              horizontalalign="Center"/>
            </asp:GridView>
            <table class="table table-striped">
            <tr>
                <td style="width: 150px">
                    Plan Name<br />
                    <asp:TextBox CssClass="form-control" MaxLength="50" ID="txtPlanName" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    Country:<br />
                    <asp:TextBox CssClass="form-control" MaxLength="10" ID="txtPremiumAmt" runat="server" Width="140" />
                </td>
                <td style="width: 150px">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add" OnClick="Insert" />
                </td>
            </tr>
        </table>
        </ContentTemplate>
        </asp:UpdatePanel>
        </div>   
</asp:Content>

