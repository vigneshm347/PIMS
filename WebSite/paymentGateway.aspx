<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paymentGateway.aspx.cs"
    Inherits="PropertyInsurance.paymentGateway" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.11.4/jquery-ui.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js"
        type="text/javascript"></script>
    <style type="text/css">
        label.error
        {
            color: Red;
            font-size: 10px;
        }
        .error
        {
            color: red;
            font-size: 14px;
        }
        #gateway-form
        {
            margin-top: 100px;
            margin-left: 350px;
            width: auto;
        }
        
        h3
        {
            color: #fff;
        }
        
        body
        {
            background-image: url('Resources/pg.png');
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <script type="text/javascript">
     $(document).ready(function () {

jQuery.validator.addMethod("nameCheck",
    function(value,element){return this.optional(element) || /^[a-zA-Z\s]+$/.test(value);
    },'Name should conatain only alphabets and spaces.');
jQuery.validator.addMethod("premiumCheck",
    function(value,element){return this.optional(element) || /^[0-9]+$/.test(value);
    },'Premium amount should contain only');


         $("#form1").validate({
             rules: {
     
             <%=txtname.UniqueID %>:{
            required: true,
            nameCheck:true
            },

             <%=txtpolicy.UniqueID %>:{
            required: true
            },
             <%=txtpremium.UniqueID %>:{
            required: true,
            premiumCheck: true
            }
             },
             messages:{
             <%=txtname.UniqueID %>:{
            required: "Name cannot be empty"
            },
               <%=txtpolicy.UniqueID %>:{
            required: "Name cannot be empty"
            },
             <%=txtpremium.UniqueID %>:{
            required: "Premium amount cannot be empty"
            }
     
             },
             errorPlacement: function(error, element)
             {
          
             error.insertAfter(element);
             
            
             }
           
         });
    
 $("#<%=txtname.ClientID %>").prop("disabled", true);
 $("#<%=txtpremium.ClientID %>").prop("disabled", true);
 $("#txtpolicy").keyup(function(){

     var polnum = $("#txtpolicy").val();
 if(polnum.length==9)
 {
 $.ajax({
 url:'CheckExistingUser.asmx/validPolicy',
 method: 'post',
 data: {polnum:polnum},
 dataType: 'xml',
 success: function(data){
 var xml = $(data);
 var name = xml.find('Name').text();
 var prem = xml.find('Premium').text();

 if(name.length!=0)
 {
 $("#<%=txtname.ClientID %>").val(name);
 $("#<%=txtpremium.ClientID %>").val(prem);
 $("#<%=btnverify.ClientID%>").prop("disabled", false);
 $("#<%=lblpolerr.ClientID %>").text("");

 }
 else
 {
 $("#<%=btnverify.ClientID%>").prop("disabled", true);
 $("#<%=lblpolerr.ClientID %>").css("color","white");
 $("#<%=lblpolerr.ClientID %>").css("font-size","15px");
 $("#<%=lblpolerr.ClientID %>").css("font-weight","500");
 $("#<%=txtname.ClientID %>").val("Not found !");
 $("#<%=txtpremium.ClientID %>").val("Not found !");
 $("#<%=lblpolerr.ClientID %>").text("Policy Number is invalid ! No Records matched");
 }
 }
 });

 }
 else
 {
 $("#<%=txtname.ClientID %>").val("");
 $("#<%=txtpremium.ClientID %>").val("");
 $("#<%=lblpolerr.ClientID %>").text("");
 $("#<%=btnverify.ClientID%>").prop("disabled", true);
 }
 
 });
 });
   
    </script>
    <div class="well well-sm">
        Trusted...
    </div>
    <h3>
        Enter your POLICY NUMBER and we will do the rest for you.</h3>
    <center>
        <div class="container" id="gateway-form">
            <form id="form1" runat="server">
            <div class="row">
                <div class="col-lg-6 col-sm-6 col-md-6">
                    <asp:TextBox ID="txtpolicy" MaxLength="9" autocomplete="off" required="true" ClientIDMode="Static"
                        CssClass="form-control" placeholder="Enter Policy Number" runat="server"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-6 col-sm-6 col-md-6">
                    <asp:TextBox ID="txtname" required="true" ClientIDMode="Static" placeholder="Customer name"
                        CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-6 col-sm-6 col-md-6">
                    <asp:TextBox ID="txtpremium" required="true" ClientIDMode="Static" CssClass="form-control"
                        placeholder="Premium amount" runat="server"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-6 col-sm-6 col-md-6">
                    <asp:Button ID="btnverify" CssClass="btn btn-danger" runat="server" Text="Validate me.."
                        ClientIDMode="Static" OnClientClick="btnverify_Click()" OnClick="btnverify_Click1" /><br />
                    <asp:Label ID="lblpolerr" runat="server" ClientIDMode="Static"></asp:Label>
                    <asp:HiddenField ID="HiddenField1" ClientIDMode="Static" runat="server" />
                </div>
            </div>
            <br />
            </form>
        </div>
    </center>
</body>
</html>
