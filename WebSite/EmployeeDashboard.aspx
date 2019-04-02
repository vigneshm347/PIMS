<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master.Master" AutoEventWireup="true" CodeBehind="EmployeeDashboard.aspx.cs" Inherits="WebSite.EmployeeDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Employee Dashboard</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Profile</a></li>
      <li><a href="employee-searchplan.aspx">Search Plan</a></li>
      <li><a href="employee-applyplan.aspx">Apply Plan</a></li>
    <li><a href="#">Review Claims</a></li>
    </ul>
  </div>
</nav>

    <div class="container">
        <h3>Profile: Edit simply by hitting the "Edit" Button</h3>
        <asp:GridView AutoGenerateColumns="False" CssClass="table table-responsive" ID="GridViewEmployeeProfile" runat="server" OnRowCancelingEdit="GridView1_RowCancelingEdit" CellPadding="6" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
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

                <asp:TemplateField HeaderText="Name">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ename" runat="server" Text='<%#Eval("uname") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_ename" MaxLength="50" runat="server" Text='<%#Eval("uname") %>'></asp:TextBox>  
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

            </Columns>
        </asp:GridView>
    </div>

</asp:Content>
