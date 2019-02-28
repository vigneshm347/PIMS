<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true"
    CodeBehind="add-customer.aspx.cs" Inherits="PropertyInsurance.add_customer" %>

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
            <%=txtname.UniqueID %>:{
            required: true,
            nameCheck: true
            },
             <%=txtlname.UniqueID %>:{
            required: true
             
            },
             <%=txtpincode.UniqueID %>:{
            required: true,
            maxlength: 6,
            minlength: 6
            },
           <%=txtannual.UniqueID %>:{
            required: true,
            incomeCheck: true
            },
             <%=txtemail.UniqueID %>:{
            required: true,
            emailmatch: true
            },
             <%=txtpolnum.UniqueID %>:{
            required: true,
            policyNumCheck: true
            },
            <%=txtmobile.UniqueID %>:{
            required: true,
            maxlength: 10,
            minlength: 10
           
            },
             <%=txtdob.UniqueID %>:{
            required: true
            }
             },
             messages:{
            
             <%=txtname.UniqueID %>:{
            required: "Name cannot be empty"
       
            },
             <%=txtemail.UniqueID %>:{
            required: "Email cannot be empty"
            },
             <%=txtpolnum.UniqueID %>:{
            required: "Policy number cannot be empty"
            },
            <%=txtmobile.UniqueID %>:{
            required: "Mobile number cannot be empty",
             maxlength:"Please Enter Maximum 6 digits",
            mixlength:"Please Enter Minimum of 6 digits"
            },

            <%=txtannual.UniqueID %>:{
            required: "Annual Income cannot be empty"
            },
            <%=txtpincode.UniqueID %>:{
            required: "Pincode cannot be empty",
            maxlength:"Please Enter Maximum 6 digits",
            mixlength:"Please Enter Minimum of 6 digits"
            },
             <%=txtdob.UniqueID %>:{
            required: "Choose your date of birth"
            }
             },
             errorPlacement: function(error, element)
             {
          
             error.insertAfter(element);
             }
           
         });
     });
// date picker plugin for choosing DOB     
$(document).ready(function () {
$('#txtdob').datepicker(
{
showOn: 'both',
buttonText: '',
changeMonth:true,
changeYear:true,
gotoCurrent: true,
yearRange: '-60:+0',
dateFormat: 'mm/dd/yy',
maxDate : 0
}
);
});


//Web service call using ajax for checking if the current entered customer is a Paper Customer

$(document).ready(function(){
var emailid="";
var mailid="";
var tmp="";
$("#txtpolnum").blur(function(event){
 $('#<%=lblpolerr.ClientID%>').text("");
var policyno = $('#txtpolnum').val();
var cemail = $('#txtemail').val();
if(policyno.length==9)
{
if(cemail.length!=0)
{
$.ajax({
url: 'CheckExistingUser.asmx/IsExistingUser',
data:{ policynum : policyno, email : cemail },
method: 'post',
dataType: 'xml',
success: function(data){
var xml = $(data);
var m = xml.find('string').text();
            console.log(m);
if(m=="false")
{
    $('#<%=lblpolerr.ClientID%>').css("color" , "red");
    $('#<%=lblpolerr.ClientID%>').css("font-weight" , 'bold');
    $('#<%=lblpolerr.ClientID%>').css("font-size" , '11px');
    $('#<%=lblpolerr.ClientID%>').text("Kindly Check EmaiID and associated Policy");
    $('#<%=btnsubmit.ClientID%>').prop("disabled",true);
}
if(m=="true")
{
    $('#<%=lblpolerr.ClientID%>').text("");
    $('#<%=btnsubmit.ClientID%>').prop("disabled",false);
}
   
}
});
}
else
{

     $('#<%=txtemail.ClientID%>').focus();
     $('#<%=txtpolnum.ClientID%>').val(" ");
    $('#<%=btnsubmit.ClientID%>').prop("disabled",true);
}
}
else
{
$('#<%=lblpolerr.ClientID%>').text("");
}
});

});


// Web Service call for checking if the user account already Exist or not
$(document).ready(function(){

$("#txtemail").blur(function(){

var emailid = $("#txtemail").val();
$.ajax({
url: 'IsEmailExist.asmx/EmailExist',
data:{ mailid : emailid },
method: 'post',
dataType: 'xml',
success: function(data){
var xml = $(data);
   var o = xml.find('string').text();
   if(o=="true")
   {
   $('#<%=lblmailerror.ClientID%>').css("color" , "red");
   $('#<%=lblmailerror.ClientID%>').css("font-weight" , 'bold');
   $('#<%=lblmailerror.ClientID%>').css("font-size" , '15px');
   $('#<%=btnsubmit.ClientID%>').prop("disabled",true);
   $('#<%=lblmailerror.ClientID%>').text("Account already exist. Try an other Email ID");
   $('#<%=txtpolnum.ClientID%>').prop("disabled",true);
   $('#<%=lblemailerr.ClientID%>').text("");
   }
   else
   {
   $('#<%=btnsubmit.ClientID%>').prop("disabled",false);
   $('#<%=txtpolnum.ClientID%>').prop("disabled",false);
   $('#<%=lblmailerror.ClientID%>').text("");
   }

}
});
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
<li class="item-list"><span class="glyphicon glyphicon-plus-sign"></span><a href="#">Add Customer</a><span class=" arrow glyphicon glyphicon-menu-right"></span></li>
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
        <asp:Label ID="lblnote" runat="server"><span style="color:red;"><p>**Make sure your policy number starts with "PL/" and number of digits is 6</p></span></asp:Label>
        <div class="row">
            <div class="col-lg-4 col-sm-12 col-xs-12">
                <label for="txtname">
                    First Name</label>
                <asp:TextBox ID="txtname" autocomplete="off" CssClass="form-control" ClientIDMode="Static"
                    runat="server"></asp:TextBox><br />
            </div>
            <div class="col-lg-4 col-sm-12 col-xs-12">
                <label for="txtlname">
                    Last Name</label>
                <asp:TextBox ID="txtlname" autocomplete="off" CssClass="form-control" ClientIDMode="Static"
                    runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-sm-12 col-xs-12">
                <label for="txtemail">
                    Email</label>
                <asp:TextBox ID="txtemail" autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                <asp:Label ID="lblemailerr" runat="server"></asp:Label><br />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-12 col-xs-12">
                <label for="txtmobile">
                    Mobile</label>
                <asp:TextBox ID="txtmobile" autocomplete="off" TextMode="Number" runat="server" ClientIDMode="Static"
                    CssClass="form-control"></asp:TextBox><br />
            </div>
            <div class="col-lg-4 col-sm-12 col-xs-12">
                <label for="txtannual">
                    Annual Income</label>
                <asp:TextBox ID="txtannual" TextMode="Number" autocomplete="off" CssClass="form-control"
                    ClientIDMode="Static" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-12 col-xs-12">
                <label for="txtpolnum">
                    Policy Number</label>
                <asp:TextBox ID="txtpolnum" autocomplete="off" MaxLength="9" CssClass="form-control"
                    ClientIDMode="Static" runat="server"></asp:TextBox>
                <asp:Label ID="lblpolerr" ClientIDMode="Static" runat="server"></asp:Label><br />
            </div>
            <div class="col-lg-4 col-sm-10 col-xs-10">
                <label for="txtdob">
                    Date of birth&nbsp;</label>
                <asp:TextBox ID="txtdob" CssClass="form-control" ReadOnly="true" autocomplete="off"
                    ClientIDMode="Static" runat="server"></asp:TextBox><br />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-12 col-xs-12">
                <label for="txtaddr">
                    Address</label>
                <asp:TextBox ID="txtaddr" CssClass="form-control" autocomplete="off" ClientIDMode="Static"
                    runat="server"></asp:TextBox>
                <asp:Label ID="Label1" ClientIDMode="Static" runat="server"></asp:Label><br />
            </div>
            <div class="col-lg-3 col-sm-12 col-xs-12">
                <label for="txtpincode">
                    Pincode</label>
                <asp:TextBox ID="txtpincode" TextMode="Number" autocomplete="off" MaxLength="6" CssClass="form-control"
                    ClientIDMode="Static" runat="server"></asp:TextBox><br />
            </div>
            <div class="col-lg-3 col-sm-12 col-xs-12">
                <label for="city">
                    City</label>
                <asp:DropDownList ID="city" ClientIDMode="Static" CssClass="form-control" runat="server">
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
        <asp:PlaceHolder ID="phcredentials" runat="server"></asp:PlaceHolder>
    </div>
</asp:Content>
