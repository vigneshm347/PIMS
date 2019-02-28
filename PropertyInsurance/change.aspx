<%@ Page Title="" Language="C#" MasterPageFile="~/userPage.Master" AutoEventWireup="true"
    CodeBehind="change.aspx.cs" Inherits="PropertyInsurance.change" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="well well-sm">
        Change Password</div>
    <div class="container">
        <div class="alert alert-danger">
            <strong>Note!</strong> Password should be a minimum of 8 characters and maximum
            of 20 characters<br />
            <strong>Remember!</strong> Your Password should contain at least 1 special chars
            and at least 1 number
        </div>
    </div>
    <div class="container">
        <br />
        <br />
        <br />
        <br />
        <div class="password-change">
            <div class="row">
                <div class="col-lg-4">
                    <label for="txtnew">
                        <b>Enter New Password :</b> &nbsp;</label>
                    <asp:TextBox ID="txtnew" required="true" MaxLength="20" TextMode="Password" ClientIDMode="Static"
                        CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="Label1" ClientIDMode="Static" runat="server"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <label for="txtnewcon">
                        <b>Re-enter New Password :</b> &nbsp;</label>
                    <asp:TextBox ID="txtnewcon" MaxLength="20" required="true" TextMode="Password" ClientIDMode="Static"
                        CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regpass" ControlToValidate="txtnewcon"
                        ForeColor="Red" ValidationExpression="^(?=.*[0-9])(?=.*[!@#$%^&*.()-_+='';:><,?/])(?=.*[A-Za-z]).{8,}$"
                        runat="server" ErrorMessage="Invalid Password !"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="compass" ForeColor="Red" ControlToValidate="txtnewcon"
                        ControlToCompare="txtnew" Operator="Equal" Type="String" runat="server" ErrorMessage="Password don't match"></asp:CompareValidator>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-4">
                    <asp:Button ID="btnchange" ClientIDMode="Static" CssClass="btn btn-info" runat="server"
                        Text="Update Password" OnClick="btnchange_Click" />
                </div>
            </div>
        </div>
        <asp:Label ID="Label2" ClientIDMode="Static" runat="server"></asp:Label>
    </div>
</asp:Content>
