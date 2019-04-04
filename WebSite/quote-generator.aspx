<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="quote-generator.aspx.cs" Inherits="WebSite.quote_generator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <style>
            form .zip-wrap {
              display: block !important;
            }
        </style>
    </head>
    <div class="container">
        <div class="jumbotron">
            <h3>Get your quote online!</h3>
            <div class="row">
                <div class="col-lg-4">
                    <label for="txtfname">First Name</label>
                        <asp:TextBox ID="txtfname" autocomplete="off" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox><br />
                </div>

                 <div class="col-lg-4">
                    <label for="txtlname">Last Name</label>
                        <asp:TextBox ID="txtlname" autocomplete="off" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox><br />
                </div>

                <div class="col-lg-4">
                    <label for="ddlgender">Gender</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlgender" ClientIDMode="Static">
                            <asp:ListItem Value="-1" Text="">--Select Gender--</asp:ListItem>
                            <asp:ListItem Value="male" Text="Male"></asp:ListItem>
                            <asp:ListItem Value="female" Text="Female"></asp:ListItem>
                        </asp:DropDownList>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <label for="txtage">Age</label>
                        <asp:TextBox ID="txtage" autocomplete="off" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox><br />
                </div>

                 <div class="col-lg-4">
                    <label for="txtzipcode">Zipcode</label>
                        <asp:TextBox ID="txtzipcode" autocomplete="off" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox><br />
                </div>

                <div class="col-lg-4">
                    <label for="ddlmarriage">Marrital Status</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlmarriage" ClientIDMode="Static">
                            <asp:ListItem Value="-1" Text="">--Select Status--</asp:ListItem>
                            <asp:ListItem Value="single" Text="Single"></asp:ListItem>
                            <asp:ListItem Value="married" Text="Married"></asp:ListItem>
                        </asp:DropDownList>
                </div>
            </div>
             <div class="row">
                    <div class="col-lg-3">
                        <label for="txtssn">SSN</label>
                        <asp:TextBox ID="txtssn" autocomplete="off" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox><br />
                    </div>
                 <div class="col-lg-3">
                    <label for="ddlexp">Driving experience</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlexp" ClientIDMode="Static">
                            <asp:ListItem Value="-1" Text="">--Select Driving Experience--</asp:ListItem>
                            <asp:ListItem Value="11" Text="< 1 Year"></asp:ListItem>
                            <asp:ListItem Value="23" Text="1 year to 2 years"></asp:ListItem>
                            <asp:ListItem Value="59" Text="2 year to 5 years"></asp:ListItem>
                            <asp:ListItem Value="61" Text="> 5 years"></asp:ListItem>
                        </asp:DropDownList>
                </div>

                 <div class="col-lg-3">
                    <label for="ddlstates">Select state</label>
                        <asp:DropDownList CssClass="form-control"  ClientIDMode="Static" ID="ddlstates" runat="server" >
                                <asp:ListItem Value="AL">Alabama</asp:ListItem>

                            <asp:ListItem Value="AK">Alaska</asp:ListItem>

                            <asp:ListItem Value="AZ">Arizona</asp:ListItem>

                            <asp:ListItem Value="AR">Arkansas</asp:ListItem>

                            <asp:ListItem Value="CA">California</asp:ListItem>

                            <asp:ListItem Value="CO">Colorado</asp:ListItem>

                            <asp:ListItem Value="CT">Connecticut</asp:ListItem>

                            <asp:ListItem Value="DE">Delaware</asp:ListItem>

                            <asp:ListItem Value="FL">Florida</asp:ListItem>

                            <asp:ListItem Value="GA">Georgia</asp:ListItem>

                            <asp:ListItem Value="HI">Hawaii</asp:ListItem>

                            <asp:ListItem Value="ID">Idaho</asp:ListItem>

                            <asp:ListItem Value="IL">Illinois</asp:ListItem>

                            <asp:ListItem Value="IN">Indiana</asp:ListItem>

                            <asp:ListItem Value="IA">Iowa</asp:ListItem>

                            <asp:ListItem Value="KS">Kansas</asp:ListItem>

                            <asp:ListItem Value="KY">Kentucky</asp:ListItem>

                            <asp:ListItem Value="LA">Louisiana</asp:ListItem>

                            <asp:ListItem Value="ME">Maine</asp:ListItem>

                            <asp:ListItem Value="MD">Maryland</asp:ListItem>

                            <asp:ListItem Value="MA">Massachusetts</asp:ListItem>

                            <asp:ListItem Value="MI">Michigan</asp:ListItem>

                            <asp:ListItem Value="MN">Minnesota</asp:ListItem>

                            <asp:ListItem Value="MS">Mississippi</asp:ListItem>

                            <asp:ListItem Value="MO">Missouri</asp:ListItem>

                            <asp:ListItem Value="MT">Montana</asp:ListItem>

                            <asp:ListItem Value="NE">Nebraska</asp:ListItem>

                            <asp:ListItem Value="NV">Nevada</asp:ListItem>

                            <asp:ListItem Value="NH">New Hampshire</asp:ListItem>

                            <asp:ListItem Value="NJ">New Jersey</asp:ListItem>

                            <asp:ListItem Value="NM">New Mexico</asp:ListItem>

                            <asp:ListItem Value="NY">New York</asp:ListItem>

                            <asp:ListItem Value="NC">North Carolina</asp:ListItem>

                            <asp:ListItem Value="ND">North Dakota</asp:ListItem>

                            <asp:ListItem Value="OH">Ohio</asp:ListItem>

                            <asp:ListItem Value="OK">Oklahoma</asp:ListItem>

                            <asp:ListItem Value="OR">Oregon</asp:ListItem>

                            <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>

                            <asp:ListItem Value="RI">Rhode Island</asp:ListItem>

                            <asp:ListItem Value="SC">South Carolina</asp:ListItem>

                            <asp:ListItem Value="SD">South Dakota</asp:ListItem>

                            <asp:ListItem Value="TN">Tennessee</asp:ListItem>

                            <asp:ListItem Value="TX">Texas</asp:ListItem>

                            <asp:ListItem Value="UT">Utah</asp:ListItem>

                            <asp:ListItem Value="VT">Vermont</asp:ListItem>

                            <asp:ListItem Value="VA">Virginia</asp:ListItem>

                            <asp:ListItem Value="WA">Washington</asp:ListItem>

                            <asp:ListItem Value="WV">West Virginia</asp:ListItem>

                            <asp:ListItem Value="WI">Wisconsin</asp:ListItem>

                            <asp:ListItem Value="WY">Wyoming</asp:ListItem>

                    </asp:DropDownList>
                </div>

                 <div class="col-lg-3">
                    <label for="ddlcarage">Car Model</label>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlcarage" ClientIDMode="Static">
                            <asp:ListItem Value="-1" Text="">--Select car Experience--</asp:ListItem>
                            <asp:ListItem Value="11" Text="< 1 Year"></asp:ListItem>
                            <asp:ListItem Value="23" Text="1 year to 2 years"></asp:ListItem>
                            <asp:ListItem Value="59" Text="2 year to 5 years"></asp:ListItem>
                            <asp:ListItem Value="61" Text="> 5 years"></asp:ListItem>
                        </asp:DropDownList>
                </div>
                    
            </div>

           <div class ="row">
               <div class="col-lg-12">
                   <asp:Button Width="100%" runat="server" CssClass="btn btn-primary" ID="btngetquote" ClientIDMode="Static" Text ="Get Quote"/>
               </div>
           </div>
        </div>
    </div>

    <script type="text/javascript">
        
    </script>
</asp:Content>
