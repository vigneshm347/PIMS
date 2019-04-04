<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PropertyInsurance.hom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.11.4/jquery-ui.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.min.js" type="text/javascript"></script>
<style type="text/css">
    .button
    {
        background-color:#3498db;
        color:White;
    }
    .button:hover
    {
        background-color:#27ae60;
        color:White;
    }
</style>
<style type="text/css">
label.error
{
    color:Red;
    font-size:10px;
}


</style>
<script type="text/javascript">
$(document).ready(function(){

$("#txtname").blur(function(){
    var val = $("#txtname").val();
    console.log(val);
    
    if(val == " " | val == "  " | val == "   " | val == "    " | val=="     "|val== "      ")
    {
     $('#<%=lblUserIderr.ClientID%>').text(" White Spaces not allowed");
      $('#<%=lblUserIderr.ClientID%>').css("color", "red");
       $('#<%=lblUserIderr.ClientID%>').css("font-size", "10px");
        $('#<%=lblUserIderr.ClientID%>').css("font-weight" , 'bold');
     $('#<%=btnlogin.ClientID%>').prop("disabled", true);
    }
    else
    {
    $('#<%=lblUserIderr.ClientID%>').text("");
    $('#<%=btnlogin.ClientID%>').prop("disabled", false);
    }
    
    });

}); 
$(document).ready(function () {
jQuery.validator.addMethod("custidCheck",
    function(value,element){return this.optional(element) || /^[0-9]+$/.test(value);
    },'Customer ID should only be numbers');
    jQuery.validator.addMethod("spaceCheck",
    function(value,element){return this.optional(element) || /[^-\s]$/.test(value);
    },'Customer ID should not contain spaces');


    
         $("#form1").validate({
             rules: {
            <%=txtname.UniqueID %>:{
            required: true,
            custidCheck: true,
            spaceCheck: false
           
            },
            <%=txtpass.UniqueID %>:{
            required: true
            }
             },
             messages:{
             <%=txtname.UniqueID %>:{
            required: "Customer ID cannot be empty",
        
            },
            <%=txtpass.UniqueID %>:{
            required: "Password Cannot be empty"
            }
             },
             errorPlacement: function(error, element)
             {
          
             error.insertAfter(element);
             
            
             }
           
         });


     });
 
 function changeButton()
 {
 $("#btnlogin").css("color", "blue");
 $("#btnlogin").text("Loggin in ! Hold");
 }
   
</script>
<%--<style type="text/css">
.error
{
    color:red;
    font-size:14px;
}

</style>  --%>
  
  
  <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#myPage">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      <li><a href="#ulogin">LOGIN</a></li>
        <li><a href="#about">ABOUT</a></li>
        <li><a href="#services">SERVICES</a></li>
        <li><a href="#insure">WE INSURE</a></li>
        <li><a href="quote-generator.aspx">GET QUOTE</a></li>

        
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center jumbotron-text">
  <h1>Property Insurance</h1>
  <p>We specialize in quality</p>
 
 </div>

 <div id="ulogin" class="container-fluid">
  <div class="row">
    <div class="col-sm-4">
    <h1>Login to Your Account</h1><br>
    </div>
    <div class="col-sm-8 col-lg-8"></div>
      <div class="loginmodal-container">
                  <asp:TextBox ID="txtname" MaxLength="6" placeholder="Enter your Customer ID.." ClientIDMode="Static" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:Label ID="lblUserIderr" ClientIDMode="Static" runat="server" ></asp:Label>
                  <asp:TextBox ID="txtpass" MaxLength="20" placeholder="Password Please.." ClientIDMode="Static" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:Button ID="btnlogin" ClientIDMode="Static" CssClass="btn btn-success" runat="server" OnClick="login_sbmt" Text="Login to my account" /><br />
                  
                  <asp:Label ID="lblerror" runat="server"></asp:Label> 
				</div>
    </div>
    
  </div>
</div>
<!-- Container (About Section) -->

<div id="about" class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
      <h2>About Company Page</h2><br>
      <h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</h4><br>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
      <br><button class="btn btn-success btn-lg">Get in Touch</button>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-signal logo"></span>
    </div>
  </div>
</div>
<div class="parallax"></div>



<!-- Container (Services Section) -->
<div id="services" class="container-fluid text-center bg-grey">
  <h2>SERVICES</h2>
  <h4>What we offer</h4>
  <br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-off logo-small"></span>
      <h4>POWER</h4>
      
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-heart logo-small"></span>
      <h4>LOVE</h4>
     
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-lock logo-small"></span>
      <h4>JOB DONE</h4>
    
    </div>
  </div>
  <br><br>
  
  </div>
</div>

<div class="parallax-bike"></div>
<!-- Container (Pricing Section) -->
<div id="insure" class="container-fluid">
  <div class="text-center">
    <h2>What we insure</h2>
  </div>
  <div class="row slideanim">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Car</h1>
        </div>
        <div class="panel-body">
          <p><strong>Instant policy</strong></p>
          <p><strong>24 X 7 Claims help</strong></p>
          <p><strong>Get Cashless claims at 2700+ garages</strong></p>
       
        </div>
        
      </div>
    </div>
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Home</h1>
        </div>
        <div class="panel-body">
          <p><strong>Pool Deaths</strong></p>
          <p><strong>Trampolines</strong></p>
          <p><strong>Emergency Living expenses</strong> </p>
        </div>
       
      </div>
    </div>
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Motor Bike</h1>
        </div>
        <div class="panel-body">
          <p><strong>Instant policy insure</strong></p>
          <p><strong>Lowest premium guaranteed</strong></p>
          <p><strong>No extra charges</strong></p>
        </div>
        
      </div>
    </div>
  </div>
</div>



<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  
</footer>

<script type="text/javascript">



    $(document).ready(function () {

        
        // Add smooth scrolling to all links in navbar + footer link
        $(".navbar a, footer a[href='#myPage']").on('click', function (event) {
            // Make sure this.hash has a value before overriding default behavior
            if (this.hash !== "") {
                // Prevent default anchor click behavior
                event.preventDefault();

                // Store hash
                var hash = this.hash;

                // Using jQuery's animate() method to add smooth page scroll
                // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                $('html, body').animate({
                    scrollTop: $(hash).offset().top
                }, 900, function () {

                    // Add hash (#) to URL when done scrolling (default click behavior)
                    window.location.hash = hash;
                });
            } // End if
        });

        $(window).scroll(function () {
            $(".slideanim").each(function () {
                var pos = $(this).offset().top;

                var winTop = $(window).scrollTop();
                if (pos < winTop + 600) {
                    $(this).addClass("slide");
                }
            });
        });
    })
</script>

</asp:Content>

