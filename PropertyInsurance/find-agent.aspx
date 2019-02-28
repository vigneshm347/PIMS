<%@ Page Title="" Language="C#" MasterPageFile="~/userPage.Master" AutoEventWireup="true" CodeBehind="find-agent.aspx.cs" Inherits="PropertyInsurance.find_agent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Your Wall</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="UserPage.aspx">Home</a></li>
      <li><a href="user-searchplan.aspx">Search Plan</a></li>
      <li><a href="paymentGateway.aspx" target="_blank">Premium Payment</a></li>
      <li><a href="#">Find Agent</a></li>
   
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><asp:Button ID="Button2" runat="server" CssClass="btn btn-link" Text="Logout"></asp:Button> </li>
    </ul>
  </div>
</nav>

<div id="agent-search" class="container">
<div class="row">
<div class="col-lg-8 col-sm-12 col-xs-12 col-md-8">
<h4><i>Find the agents near by and get in touch with them thorugh our Live Chat application...</i></h4>

<form>
<label for="city">City</label>
<asp:DropDownList ID="city" ClientIDMode="Static" CssClass="form-control" 
        runat="server"  >
        </asp:DropDownList><br />
<asp:Button ID="Button1" ClientIDMode="Static" class="btn btn-info" 
    runat="server" Text="Search Agents..." onclick="Button1_Click" /><asp:Label ID="Label1"
        runat="server" ></asp:Label>
</form>
</div>
    <br /><asp:PlaceHolder ID="PlaceHolder1" ClientIDMode="Static" runat="server"></asp:PlaceHolder>
</div>
</div>
<div class="chat-box">
<a id="close" class="pull-right">Exit</a>
<div class="header container"><h4>Chat Here</h4> </div>
<div class="element">

     <span><input type="text" class="form-control" id="msgbox"/></span>
</div>

</div>
    <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static"/>
<div class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2016- Property Insurance Management System
     
      </p>

    </div>
    </div>

    
    <script type="text/javascript">
        $(document).ready(function () {

            $(".pull-chat").click(function () {

                $(".pull-chat").css("display", "none");
                $(".chat-box").animate({



                    height: '320px',
                    width: '250px'


                });
                $(".element").show();
                $(".header").show();
            });
            $("#close").click(function () {

                $(".pull-chat").css("display", "block");
                $(".chat-box").animate({

                    width: '50px',
                    height: '320px'

                });
                $(".header").hide();
                $(".element").hide();
               
            });
        });
    </script>
    
</asp:Content>
