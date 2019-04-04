<%@ Page Title="" Language="C#" MasterPageFile="~/userPage.Master" AutoEventWireup="true" CodeBehind="add-property.aspx.cs" Inherits="WebSite.add_property" %>
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
      <li><a href="paymentGateway.aspx" target="_blank">Premium Payment</a></li>
      <li><a href="new-claim.aspx">New Claim</a></li>
        <li><a href="view-claim.aspx">View Claims</a></li>
        <li class="active"><a href="add-property.aspx">Add Property</a></li>
      
    </ul>
  </div>
</nav>
    <div class="container">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:GridView ID="GridViewPropertyInfo" CssClass="table table-bordered" runat="server" AutoGenerateColumns="false" 
            DataKeyNames="id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit" PageSize = "3" AllowPaging ="true" OnPageIndexChanging = "OnPaging"
            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added."
            Width="450">
            <Columns>
                 <asp:TemplateField HeaderText="Property Type" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label ID="lblpropertytype" runat="server" Text='<%# Eval("property_type") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlproperty" ClientIDMode="Static" runat="server">
                             <asp:ListItem Text="CAR/BIKE" Value="CAR/BIKE"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="HOME" Value="HOME"></asp:ListItem>
                           
                            
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VIN" ItemStyle-Width="150px">
                    <ItemTemplate>
                        <asp:Label Width="150" ID="lblvin" runat="server" Text='<%# Eval("vin") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtvin" runat="server" Text='<%# Eval("vin") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>


                 <asp:TemplateField HeaderText="Model" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label Width="150" ID="lblmodel" runat="server" Text='<%# Eval("model_year") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtmodel" runat="server" Text='<%# Eval("model_year") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Make" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label Width="150" ID="lblmake" runat="server" Text='<%# Eval("car_makr") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtmake" runat="server" Text='<%# Eval("car_makr") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                
                 <asp:TemplateField HeaderText="Driver ID" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label Width="150" ID="lbldriverid" runat="server" Text='<%# Eval("driver_id") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtdriverid" runat="server" Text='<%# Eval("driver_id") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Home address" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label Width="150" ID="lbladdress" runat="server" Text='<%# Eval("home_address") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtaddress" runat="server" Text='<%# Eval("home_address") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Pincode" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label Width="150" ID="lblpin" runat="server" Text='<%# Eval("pincode") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtpin" runat="server" Text='<%# Eval("pincode") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ButtonType="Button" ControlStyle-CssClass ="btn btn-primary" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="700" ItemStyle-HorizontalAlign="Left" />
            </Columns>
        </asp:GridView>
        
        <table class ="table">
            <tr>
                <td  style="width: 180px">
                    Property:<br />
                   <asp:DropDownList ID="ddlpropertyname" CssClass="form-control" ClientIDMode="Static" runat="server">
                       <asp:ListItem Text="CAR/BIKE" Value="CAR/BIKE"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text="HOME" Value="HOME"></asp:ListItem>
                            
                            
                        </asp:DropDownList>
                </td>
                <td style="width: 150px">
                    VIN NUMBER:<br />
                    <asp:TextBox ID="txtvinnum" CssClass="form-control" ClientIDMode ="Static" runat="server" Width="140" />
                </td>

                 <td style="width: 150px">
                    MODEL:<br />
                    <asp:TextBox ID="txtmodel" CssClass="form-control" ClientIDMode ="Static" runat="server" Width="140" />
                </td>

                 <td style="width: 150px">
                    AUTO MAKE:<br />
                    <asp:TextBox ID="txtcarmake" CssClass="form-control" ClientIDMode ="Static" runat="server" Width="140" />
                </td>

                 <td style="width: 150px">
                    DRIVER ID:<br />
                    <asp:TextBox ID="txtdriverid" CssClass="form-control" ClientIDMode ="Static" runat="server" Width="140" />
                </td>

                 <td style="width: 150px">
                    ADDRESS:<br />
                    <asp:TextBox ID="txthomeaddress" CssClass="form-control" ClientIDMode ="Static" runat="server" Width="140" />
                </td>

                 <td style="width: 150px">
                    PINCODE:<br />
                    <asp:TextBox ID="txtpincode" CssClass="form-control" ClientIDMode ="Static" runat="server" Width="140" />
                </td>


                <td style="width: 150px">
                    <asp:Button ID="btnAdd" CssClass="btn btn-danger" ClientIDMode ="Static" runat="server" Text="Add" OnClick="Insert" />
                </td>
            </tr>
        </table>
            </div>
    </ContentTemplate>
</asp:UpdatePanel>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#<%=ddlpropertyname.ClientID%>').change(function () {
        
                    if ($('#<%=ddlpropertyname.ClientID%>').val() == "HOME") {
                        $('#<%=txtvinnum.ClientID%>').prop("disabled", true)
                        $('#<%=txtmodel.ClientID%>').prop("disabled", true)
                        $('#<%=txtcarmake.ClientID%>').prop("disabled", true)
                        $('#<%=txtdriverid.ClientID%>').prop("disabled", true)
                    }

                    if ($('#<%=ddlpropertyname.ClientID%>').val() != "HOME") {
                        $('#<%=txtvinnum.ClientID%>').prop("disabled", false)
                        $('#<%=txtmodel.ClientID%>').prop("disabled", false)
                        $('#<%=txtcarmake.ClientID%>').prop("disabled", false)
                        $('#<%=txtdriverid.ClientID%>').prop("disabled", false)
                    }

                })

                $('#<%=btnAdd.ClientID%>').click(function () {
                    if ($('#<%=txthomeaddress.ClientID%>').val() === "" || $('#<%=txtpincode.ClientID%>').val() === "") {
                        $('#<%=txthomeaddress.ClientID%>').css("border-color", "red")
                        $('#<%=txtpincode.ClientID%>').css("border-color", "red")
                        return false;
                    }
                })

              
            })
        </script>
</asp:Content>
