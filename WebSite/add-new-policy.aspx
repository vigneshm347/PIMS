<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="add-new-policy.aspx.cs" Inherits="WebSite.add_new_policy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style type="text/css">
        label.error
        {
            color: Red;
            font-size: 10px;
        }
    </style>
        <script type="text/javascript">    
$(document).ready(function(){ 
jQuery.validator.addMethod("emailmatch", 
function(value, element){ return this.optional(element) || /^[a-zA-Z0-9._.\s]+@[a-zA-Z0-9.\s]+\.[a-zA-Z..\s]{2,5}$/i.test(value);
},'Invalid Email format');
jQuery.validator.addMethod("custidCheck",
function(value,element){return this.optional(element) || /^[0-9]+$/.test(value);
},'Customer ID should only be numbers');
jQuery.validator.addMethod("policyNumCheck",
function(value,element){return this.optional(element) || /^PL\/[A-Z0-9]{6,10}$/.test(value);
},'Invalid Policy Number.');
jQuery.validator.addMethod("nameCheck",
function(value,element){return this.optional(element) || /^[A-Za-z][A-Za-z ]+$/.test(value);
},'Invalid Name.');

//Script that runs validation for form

$("#form1").validate({
             rules: {
            <%=txtPolicyName.UniqueID %>:{
            required: true,
            nameCheck: true
            },
             <%=txtPolicyFeature.UniqueID %>:{
            required: true
             
            },
             <%=txtPolicyBenefit.UniqueID %>:{
            required: true,
            maxlength: 300,
            minlength: 20
            },
           <%=txtBenefitIllus.UniqueID %>:{
               required: true,
               maxlength: 300,
               minlength: 20
            },
             <%=txtEligibleAge.UniqueID %>:{
            required: true,
            emaicustidCheck: true
            },
        
            <%=txtMaxDependents.UniqueID %>:{
            required: true,
            maxlength: 2,
            minlength: 1
           
             },
            <%=ddlType.UniqueID %>:{
                required: true,
                

            },
             <%=ddlCustomers.UniqueID %>:{
            required: true
            }
             },
             messages:{
            
             <%=txtPolicyName.UniqueID %>:{
            required: "Policy Name cannot be empty"
       
            },
             <%=txtPolicyFeature.UniqueID %>:{
            required: "Policy Feature cannot be empty"
            },
             <%=txtPolicyBenefit.UniqueID %>:{
                 required: "Policy Benefit cannot be empty",
                 maxlength: "Please Enter Maximum 300 characters",
                 mixlength: "Please Enter Minimum of 20 characters"
            },
            <%=txtBenefitIllus.UniqueID %>:{
            required: "Benefit Illustration number cannot be empty",
             maxlength:"Please Enter Maximum 300 characters",
             mixlength:"Please Enter Minimum of 20 characters"
            },

            <%=txtMaxDependents.UniqueID %>:{
                required: "Dependents cannot be empty",
                maxlength: "Please Enter Maximum 2 characters",
                mixlength: "Please Enter Minimum of 1 characters"
            },
            <%=ddlType.UniqueID %>:{
            required: "Product Type cannot be empty"
            },
             <%=ddlCustomers.UniqueID %>:{
            required: "Required"
            }
             },
             errorPlacement: function(error, element)
             {
          
             error.insertAfter(element);
             }
           
         });
     });
    </script>
    <style type="text/css">
        .error
        {
            color: red;
            font-size: 14px;
        }
    </style>

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
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="#">Add new Policy</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
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
            <li class="item-list"><span class="glyphicon glyphicon-plus-sign">
            </span><a href="manage-users.aspx">Manage Users</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
            <li><a href="paymentGateway.aspx" target="_blank"><span class="glyphicon glyphicon-eye-open">
            </span></a></li>
        </ul>
    </div>
    </body>
    <div id="customer-add">
        <div class="row">
            <div class="col-lg-4 col-sm-12 col-xs-12">
                <label for="txtPolicyName">
                    Policy Name</label>
                <asp:TextBox ID="txtPolicyName" autocomplete="off" CssClass="form-control" ClientIDMode="Static"
                    runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-sm-12 col-xs-12">
                <label for="txtPolicyFeature">
                    Policy Feature</label>
                <asp:TextBox ID="txtPolicyFeature" autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                <asp:Label ID="lblemailerr" runat="server"></asp:Label><br />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-12 col-xs-12">
                <label for="txtPolicyBenefit">
                    Policy Benefit</label>
                <asp:TextBox ID="txtPolicyBenefit" autocomplete="off"  runat="server" ClientIDMode="Static"
                    CssClass="form-control"></asp:TextBox><br />
            </div>

        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-12 col-xs-12">
                <label for="txtBenefitIllus">
                    Benefit Illustration</label>
                <asp:TextBox ID="txtBenefitIllus" autocomplete="off" CssClass="form-control"
                    ClientIDMode="Static" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-12 col-xs-12">
                <label for="txtEligibleAge">
                    Eligible age</label>
                <asp:TextBox ID="txtEligibleAge" CssClass="form-control" TextMode="Number" autocomplete="off" ClientIDMode="Static"
                    runat="server"></asp:TextBox>
                <asp:Label ID="Label1" ClientIDMode="Static" runat="server"></asp:Label><br />
            </div>
            <div class="col-lg-3 col-sm-12 col-xs-12">
                <label for="txtMaxDependents">
                    Maximum Dependents</label>
                <asp:TextBox ID="txtMaxDependents" TextMode="Number" autocomplete="off" MaxLength="6" CssClass="form-control"
                    ClientIDMode="Static" runat="server"></asp:TextBox><br />
            </div>
            <div class="col-lg-3 col-sm-12 col-xs-12">
                <label for="ddlCustomers">
                    City</label>
                    <asp:DropDownList ID = "ddlCustomers" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="col-lg-3 col-sm-12 col-xs-12">
                <label for="city">
                    Product Type</label>
                    <asp:DropDownList ID = "ddlType" runat="server" CssClass="form-control">
                         <asp:ListItem Enabled="true" Text="Select Product" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="Car" Value="car"></asp:ListItem>
                            <asp:ListItem Text="Home" Value="home"></asp:ListItem>
                            <asp:ListItem Text="Bike" Value="bike"></asp:ListItem>
                    </asp:DropDownList>
            </div>
        </div>
       <div class="row">
            <div class="col-lg-6 col-sm-12 col-xs-12">
                <asp:Button ID="btnsubmit" class="btn btn-success register" ClientIDMode="Static"
                    runat="server" Text="Add Customer" OnClick="btnsubmit_Click" />&nbsp;&nbsp;<asp:Label
                        ID="lblmailerror" runat="server"></asp:Label>
            </div>
        </div>
        
    </div>
</asp:Content>
