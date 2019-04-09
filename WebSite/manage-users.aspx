<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="manage-users.aspx.cs" Inherits="WebSite.manage_users" %>
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
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="#">Manage Users</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
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
            <li class="collapse-item-list"><a href="ApplyPlan.aspx"><span class="glyphicon glyphicon-file">
            </span></a></li>
            <li class="collapse-item-list"><a href="#"><span class="glyphicon glyphicon-plus-sign">
            </span></a></li>
            <li><a href="paymentGateway.aspx" target="_blank"><span class="glyphicon glyphicon-eye-open">
            </span></a></li>
        </ul>
    </div>
    <div id="search-plan" class="container">
         <asp:GridView CssClass="table table-responsive" ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" CellPadding="6" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="id">
       <Columns>
           <asp:TemplateField>
               <ItemTemplate>
                   <asp:Button CssClass="btn btn-info" ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit"/>
               </ItemTemplate>
                <EditItemTemplate>  
                        <asp:Button CssClass="btn btn-primary" margin="10px" ID="btn_Update" runat="server" Text="Update" CommandName="Update"/>  
                        <asp:Button CssClass="btn btn-danger" ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel"/>  
                </EditItemTemplate>
           </asp:TemplateField>
            <asp:TemplateField HeaderText="ID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("id") %>'></asp:Label>  
                    </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User ID">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_userid" runat="server" Text='<%#Eval("user_id") %>'></asp:Label>  
                    </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_uname" runat="server" Text='<%#Eval("uname") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_uname" MaxLength="50" runat="server" Text='<%#Eval("uname") %>'></asp:TextBox>  
                    </EditItemTemplate>  
            </asp:TemplateField> 
            <asp:TemplateField HeaderText="Email">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("emailid") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_email" MaxLength="50" runat="server" Text='<%#Eval("emailid") %>'></asp:TextBox>  
                    </EditItemTemplate>  
            </asp:TemplateField>

           <asp:TemplateField HeaderText="Mobile">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_mobile" runat="server" Text='<%#Eval("mobile") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_mobile" ClientIDMode="Static" MaxLength="10" runat="server" Text='<%#Eval("mobile") %>'></asp:TextBox>  
                    </EditItemTemplate>  
            </asp:TemplateField>

           <asp:TemplateField HeaderText="Pincode">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_pincode" runat="server" Text='<%#Eval("pincode") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_pincode" MaxLength="6" runat="server" Text='<%#Eval("pincode") %>'></asp:TextBox>  
                    </EditItemTemplate>  
            </asp:TemplateField>

           <asp:TemplateField HeaderText="Address">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_address" runat="server" Text='<%#Eval("address") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_address" MaxLength="100" runat="server" Text='<%#Eval("address") %>'></asp:TextBox>  
                    </EditItemTemplate>  
            </asp:TemplateField>
           
                       <asp:TemplateField HeaderText="Status">  
                           <ItemTemplate>
                                <asp:Label ID="lbl_isactive" runat="server" Text='<%#Eval("isActive") %>'></asp:Label>  
                           </ItemTemplate>
                    <EditItemTemplate>  
                        <asp:DropDownList ID="ddlisactive" runat="server" ClientIDMode="Static">
                            <asp:ListItem Enabled="true" Text="ACTIVATE" Value="active"></asp:ListItem>
                            <asp:ListItem Text="DE-ACTIVATE" Value="inactive"></asp:ListItem>
                        </asp:DropDownList>
                       
                    </EditItemTemplate>  
            </asp:TemplateField> 
       </Columns>

   </asp:GridView>
    
    </div>
    </body>
  

     <div>      
    </div>  

    
</asp:Content>

