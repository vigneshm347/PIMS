<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master.Master" AutoEventWireup="true" CodeBehind="employee-claimaction.aspx.cs" Inherits="WebSite.employee_claimaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Employee Dashboard</a>
    </div>
    <ul class="nav navbar-nav">
       <li><a href="EmployeeDashboard.aspx">Profile</a></li>
      <li ><a href="employee-searchplan.aspx">Search Plan</a></li>
      <li><a href="employee-applyplan.aspx">Apply Plan</a></li>
    <li class="active"><a href="#">Review Claims</a></li>
    </ul>
  </div>
</nav>


    <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div class="container">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:GridView CssClass="table table-bordered" ID="GridViewManageClaims" runat="server" AutoGenerateColumns="false" 
            DataKeyNames="claim_id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" PageSize = "10" AllowPaging ="true" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" EmptyDataText="No records has been added."
            Width="450">
            <Columns>
                <asp:TemplateField HeaderText="Claim Reference #" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="claim_id" runat="server" Text='<%# Eval("claim_id") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Claim created on" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblaccidentdate" runat="server" Text='<%# Eval("accident_date", "{0:dd-MMM-yyyy}") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Accident address" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblaccidentaddress" runat="server" Text='<%# Eval("accident_address") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="VIN # (If any)" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblvin" runat="server" Text='<%# Eval("vin") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Description" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lbldescription" runat="server" Text='<%# Eval("accident_description") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Customer ID" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblcustomerid" runat="server" Text='<%# Eval("customer_id") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Status" ItemStyle-Width="150">
                    <ItemTemplate>

                        <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("claim_status") %>'
   
                            ForeColor='<%# ((Eval("claim_status").ToString() == "REJECTED") ? System.Drawing.Color.Red: System.Drawing.Color.Green) %> '>
                            ></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlstatus" runat="server">
                            <asp:ListItem Enabled="true" Text="APPROVED" Value="APPROVED"></asp:ListItem>
                            <asp:ListItem Text="REJECTED" Value="REJECTED"></asp:ListItem>
                            
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Comments" ItemStyle-Width="300">
                    <ItemTemplate>
                        <asp:Label ID="lblcomment" runat="server" Text='<%# Eval("reviewer_comments") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtcomments" runat="server" Text='<%# Eval("reviewer_comments") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ButtonType="Button" ShowEditButton="true"  />
          
            </Columns>
        </asp:GridView>
        
    </ContentTemplate>
</asp:UpdatePanel>
</div>

    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBrNtpIzeyP0SKYIpA7vbtiO0GaJCUEoqI&sensor=false"></script>
<script type="text/javascript">
    function GetAddress() {
        var lat = parseFloat(document.getElementById("txtLatitude").value);
        var lng = parseFloat(document.getElementById("txtLongitude").value);
        var latlng = new google.maps.LatLng(lat, lng);
        var geocoder = geocoder = new google.maps.Geocoder();
        geocoder.geocode({ 'latLng': latlng }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[1]) {
                    alert("Location: " + results[1].formatted_address);
                }
            }
        });
    }
    </script>
</asp:Content>
