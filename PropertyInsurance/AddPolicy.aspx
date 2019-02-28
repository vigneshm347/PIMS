<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPolicy.aspx.cs" Inherits="PropertyInsurance.AddPolicy" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Link to customer</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .jumbotron
        {
            background-color: #e74c3c;
            color: #fff;
            font-weight: 500;
            font-size: 18px;
        }
        input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
        {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            margin: 0;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=txtpolicy.ClientID %>").prop("disabled", true);
            $("#<%=txtpolicyid.ClientID %>").prop("disabled", true);
            $("#txtid").keyup(function () {
                var custid = $("#txtid").val();
                $.ajax({

                    url: 'LinkPolicy.asmx/IsCustomer',
                    data: { custid: custid },
                    method: 'post',
                    dataType: 'xml',
                    success: function (data) {
                        var xml = $(data);
                        var m = xml.find('string').text();
                        if (m == "true") {
                            $("#<%=lblpoliderr.ClientID %>").text("");
                            $("#<%=linksbt.ClientID %>").prop("disabled", false);
                        }
                        else {
                            $("#<%=lblpoliderr.ClientID %>").text("Invalid Customer ID");
                            $("#<%=lblpoliderr.ClientID %>").css("font-size", "11px");
                            $("#<%=lblpoliderr.ClientID %>").css("color", "red");
                            $("#<%=linksbt.ClientID %>").prop("disabled", true);
                        }
                    }

                });

            });

        });
    
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3 class="page-header">
            Apply Plan to Customer
        </h3>
    </div>
    <div class="container">
        <div class="jumbotron">
            <h3>
                Instructions to be followed:</h3>
            <ul type="circle">
                <li>Customer ID should only be existing customer ID and who has an existing account.</li>
                <li>Customer ID should only be 6 digits long</li>
                <li>Check the plan details before linking it to the customer</li>
                <li>Make sure the customer details populated matches the records.</li>
            </ul>
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-12">
                <label for="txtid">
                    Customer ID</label>
                <asp:TextBox ID="txtid" ClientIDMode="Static" MaxLength="6" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div>
            <div class="row">
                <div class="col-lg-4 col-sm-12">
                    <label for="txtpolicy">
                        Policy Number</label>
                    <asp:TextBox ID="txtpolicy" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-sm-4">
                    <label for="txtpolicyid">
                        Policy ID</label>
                    <asp:TextBox ID="txtpolicyid" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <br />
            <asp:Label ID="lblpoliderr" runat="server" ClientIDMode="Static"></asp:Label><br />
            <div class="col-lg-4 col-sm-4">
                <asp:Button ID="linksbt" ClientIDMode="Static" runat="server" CssClass="btn btn-primary"
                    Text="Add Record !" OnClick="linksbt_Click" UseSubmitBehavior="false" OnClientClick="this.disabled='true';" />
                <asp:Label ID="lblack" runat="server"></asp:Label>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
