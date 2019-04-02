<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="manage-policy.aspx.cs" Inherits="WebSite.manage_policy" %>
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
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="add-new-plan.aspx">Manage plan</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="add-new-policy.aspx">Add new Policy</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="#">Manage Policy</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
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
            <div style="position:absolute; left: 15%">
            <asp:UpdatePanel UpdateMode="Always" runat="server">
            <ContentTemplate>

                <asp:GridView
                CssClass="table table-bordered" 
                ID="GridViewPolicyInfo" 
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
                OnRowUpdating="OnRowUpdating">
                    <Columns>
                    <asp:TemplateField HeaderText="Policy Name" ItemStyle-Width="150">
                        <ItemTemplate>
                            <asp:Label ID="policyname" runat="server" Text='<%# Eval("policy_name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPolicyName" runat="server" Text='<%# Eval("policy_name") %>' Width="140"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Policy Feature">
                            <ItemTemplate>
                                <asp:Label ID="policyfeature" runat="server" Text='<%# Eval("policy_feature") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPolicyFeature" runat="server" Text='<%# Eval("policy_feature") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Policy Benefit">
                            <ItemTemplate>
                                <asp:Label ID="policybenefit" runat="server" Text='<%# Eval("policy_benefit") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPolicyBenefit" runat="server" Text='<%# Eval("policy_benefit") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Benefit Illustration">
                            <ItemTemplate>
                                <asp:Label ID="benefitillustration" runat="server" Text='<%# Eval("benefit_illustration") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBenefitIllustration" runat="server" Text='<%# Eval("benefit_illustration") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Eligible">
                            <ItemTemplate>
                                <asp:Label ID="eligible" runat="server" Text='<%# Eval("eligible") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtElig" runat="server" Text='<%# Eval("eligible") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Max Dependent">
                            <ItemTemplate>
                                <asp:Label ID="maxdependent" runat="server" Text='<%# Eval("max_dependent") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMaxDependent" runat="server" Text='<%# Eval("max_dependent") %>' Width="140"></asp:TextBox>
                            </EditItemTemplate>
                    </asp:TemplateField>
                    
                        <asp:CommandField ButtonType="Link" ControlStyle-CssClass="btn btn-danger" ShowEditButton="true" ItemStyle-Width="150" />
                    
                    </Columns>
                    <pagerstyle backcolor="lightBlue"
                      verticalalign="Bottom"
                      horizontalalign="Center"/>
                </asp:GridView>

            </ContentTemplate>
            </asp:UpdatePanel>
</asp:Content>
