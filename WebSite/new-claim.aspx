<%@ Page Title="" Language="C#" MasterPageFile="~/userPage.Master" AutoEventWireup="true" CodeBehind="new-claim.aspx.cs" Inherits="WebSite.new_claim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Your Wall</a>
    </div>
<ul class="nav navbar-nav">
      <li><a href="userPage.aspx">Home</a></li>
      <li><a href="user-searchplan.aspx">Search Plan</a></li>
      <li ><a href="paymentGateway.aspx" target="_blank">Premium Payment</a></li>
      <li class="active"><a href="#">New Claim</a></li>
        <li><a href="view-claim.aspx">View Claims</a></li>
        <li><a href="add-property.aspx">Add Property</a></li>
      
    </ul>
  </div>
</nav>

    <div class="container">
        <div class="jumbotron">
        <h4>
            Report your claims here!
        </h4>

            <ul>
                <li>Check your self for injuries</li>
                <li>Check for well-being of your partners</li>
                <li>Get to safety</li>
                <li>Call <strong>911</strong> if necessary</li>
            </ul>
        </div>
     
       <!-- forms -->

        <div class="fetch-location">
            <div class="row">
                <div class="col-lg-10">
                    <div id="dvMap" style="width: 250px; height: 250px"></div>

                </div>
            </div>
            <div class="row">
                
                <div class="col-lg-4">
                    <label for="txtlatitude">Latitude</label>
                    <asp:TextBox ID="txtlatitude" ReadOnly ="true" autocomplete="off" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox><br />
                </div>
                 <div class="col-lg-4">
                    <label for="txtlongitude">Longitude</label>
                    <asp:TextBox ID="txtlongitude" ReadOnly ="true" autocomplete="off" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox><br />
                 </div>
                   <div class="col-lg-4">
                <label for="txtaccidentdate">Accident date</label>
                <asp:TextBox ID="txtaccidentdate" CssClass="form-control" ClientIDMode="Static" runat="server" />
                </div>
                </div>
            </div>
            <div class="row">
                         <div class="col-lg-4">
                <label for="chkPassport">
                    <asp:CheckBox ID="chkPassport" ClientIDMode="Static" runat="server" />
                    Not on spot?
                </label>

                <div id="dvPassport" style="display: none">
                    Enter address:
                    <asp:TextBox ID="txtcustomaddress" autocomplete="off" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox><br />
                </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                <label for="ishouse">
                    <asp:CheckBox ID="ishouse" ClientIDMode="Static" runat="server" />
                    Check if you are claiming for a house
                </label>
                </div>
                </div>
        <div class="row">

                <div id="vin" class="col-lg-6">
                    <label for="txtvin">VIN Number</label>
                <asp:TextBox ID="txtvin" CssClass="form-control" ClientIDMode="Static" runat="server" />
                </div>
            </div> 
        
        <div class="row">
                <div class="col-lg-6">
                    <label for="txtdescription">Description</label>
                <asp:TextBox ID="txtdescription" CssClass="form-control" ClientIDMode="Static" runat="server" />
                </div>
        </div> <br />

         <div class="row">
            <div class="col-lg-12 col-sm-12 col-xs-12">
                <asp:Button ID="btnsubmit" class="btn btn-danger" ClientIDMode="Static"
                    runat="server" OnClick="btnsubmit_Click" Text="Submit Claim" />&nbsp;&nbsp;<asp:Label
                        ID="lblmailerror" runat="server"></asp:Label>
            </div>
        </div>

    
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
    
if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (p) {
        
        var LatLng = new google.maps.LatLng(p.coords.latitude, p.coords.longitude);
        var latitude = document.getElementById('<%= txtlatitude.ClientID%>');
        latitude.value = p.coords.latitude; 
        var longitude = document.getElementById('<%= txtlongitude.ClientID%>');
        longitude.value = p.coords.longitude; 
        var mapOptions = {
            center: LatLng,
            zoom: 13,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
        var marker = new google.maps.Marker({
            position: LatLng,
            map: map,
            title: "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: " + p.coords.latitude + "<br />Longitude: " + p.coords.longitude
        });
        google.maps.event.addListener(marker, "click", function (e) {
            var infoWindow = new google.maps.InfoWindow();
            infoWindow.setContent(marker.title);
            infoWindow.open(map, marker);
        });
        $(function () {
            $("#chkPassport").click(function () {
                if ($(this).is(":checked")) {
                    $("#dvPassport").fadeIn();
                    $('#<%=txtlatitude.ClientID%>').val("")
                    $('#<%=txtlongitude.ClientID%>').val("")
                } else {
                    $("#dvPassport").fadeOut();
                    $('#<%=txtlatitude.ClientID%>').val(p.coords.latitude)
                    $('#<%=txtlongitude.ClientID%>').val(p.coords.longitude)
                   }
               });
        });

        $(function () {
            $("#ishouse").click(function () {
                if ($(this).is(":checked")) {
                    $("#vin").fadeOut();

                } else {
                    $("#vin").fadeIn();
                }
                 });
        });
    });
} else {
    alert('Geo Location feature is not supported in this browser.');
    }
    $(document).ready(function () {
        $('#<%=txtaccidentdate.ClientID%>').datepicker(
            {
                showOn: 'both',
                buttonText: '',
                changeMonth: true,
                changeYear: true,
                gotoCurrent: true,
                yearRange: '-60:+0',
                dateFormat: 'mm/dd/yy',
                maxDate: 0
            }
        );

        $('#<%= txtaccidentdate.ClientID %>').blur(function (event) {
            
            if ($('#<%= txtaccidentdate.ClientID %>').val() == "") {
                $('#<%= btnsubmit.ClientID %>').prop("disabled", true)
                $('#<%= txtaccidentdate.ClientID %>').css("border", "red solid 1px")
            }
            if ($('#<%= txtaccidentdate.ClientID %>').val()) {
                $('#<%= btnsubmit.ClientID %>').prop("disabled", false)
                $('#<%= txtaccidentdate.ClientID %>').css("border", "green solid 1px");
            }
        });

        $('#<%= txtdescription.ClientID %>').blur(function (event) {
           
             if ($('#<%= txtdescription.ClientID %>').val() == "") {
                $('#<%= btnsubmit.ClientID %>').prop("disabled", true)
                $('#<%= txtdescription.ClientID %>').css("border", "red solid 1px")
            }
            if ($('#<%= txtdescription.ClientID %>').val()) {
                $('#<%= btnsubmit.ClientID %>').prop("disabled", false)
                $('#<%= txtdescription.ClientID %>').css("border", "green solid 1px");
            }
         });
    });

    
   
</script>
</asp:Content>
