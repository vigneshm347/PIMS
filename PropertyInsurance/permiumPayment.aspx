<%@ Page Title="" Language="C#" MasterPageFile="~/payment.Master" AutoEventWireup="true"
    CodeBehind="permiumPayment.aspx.cs" Inherits="PropertyInsurance.permiumPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        #credit
        {
            margin-top: -60px;
        }
        #debit
        {
            margin-top: -60px;
        }
        label.error
        {
            color: #fff;
            font-size: 14px;
        }
    </style>
    <script type="text/javascript">



     $("#form1").validate({
             rules: {
           
             <%=txtcardno.UniqueID %>:{
            
            maxlength: 16,
             minlength: 16
            },
            <%=txtcvv.UniqueID %>:{
            minlength: 3,
            maxlength: 3
            }
             },
             messages:{
            
             <%=txtcardno.UniqueID %>:{
            maxlength: "Invalid Card Number",
            minlength: "Invalid Card Number"
            },
            <%=txtcvv.UniqueID %>:{
            maxlength: "Invalid CVV"
            }
             },
             errorPlacement: function(error, element)
             {
          
             error.insertAfter(element);
             }
           
         });
    


    $(document).ready(function () {
        $("#<%=btnpay.ClientID %>").prop("disabled", true);


        $("[id*=credit]").click(function () {
            
            var checked_radio = $("[id*=credit] input:checked");
            var value = checked_radio.val();
            $("#<%=btnpay.ClientID %>").prop("disabled", false);
            $("#<%=hdnbank.ClientID %>").val(value);




        });
        $("[id*=debit]").click(function () {

            var checked_radio = $("[id*=debit] input:checked");
            var value = checked_radio.val();
            $("#<%=btnpay.ClientID %>").prop("disabled", false);
            $("#<%=hdnbank.ClientID %>").val(value);




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
    <asp:RadioButtonList ID="credit" TextAlign="Right" RepeatDirection="Horizontal" ClientIDMode="Static"
        runat="server">
        <asp:ListItem Value="KOTAK" Text="KOTAK"></asp:ListItem>
        <asp:ListItem Value="BANK OF BARODA" Text="BANK OF BARODA"></asp:ListItem>
        <asp:ListItem Value="CITI BANK" Text="CITI BANK"></asp:ListItem>
        <asp:ListItem Value="INDIAN BANK" Text="INDIAN BANK"></asp:ListItem>
    </asp:RadioButtonList>
    <asp:RadioButtonList ID="debit" TextAlign="Right" RepeatDirection="Horizontal" ClientIDMode="Static"
        runat="server">
        <asp:ListItem Value="SBI" Text="SBI"></asp:ListItem>
        <asp:ListItem Value="CORPORATION BANK" Text="CORPORATION BANK"></asp:ListItem>
        <asp:ListItem Value="CANARA BANK" Text="CANARA BANK"></asp:ListItem>
        <asp:ListItem Value="CITI UNION BANK" Text="CITI UNION BANK"></asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <br />
    <div id="card_details" class="container">
        <div class="jumbotron" style="background-color: #16a085;">
            <h4>
                Enter your Card Details:</h4>
            <div class="row">
                <div class="col-lg-8 col-sm-12 col-md-8">
                    <asp:TextBox ID="txtcardno" ClientIDMode="Static" required="true" TextMode="Number"
                        CssClass="form-control" runat="server" placeholder="Card Number"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-2">
                    <asp:DropDownList CssClass="form-control" ID="ddlmonth" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="col-lg-2">
                    <asp:DropDownList ID="ddlyear" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-2 col-sm-12 col-md-8">
                    <asp:TextBox ID="txtcvv" MaxLength="3" placeholder="CVV" TextMode="Number" required="true"
                        CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-4 col-sm-12 col-md-8">
                    <asp:TextBox ID="txtcardname" placeholder="Card Holder Name" required="true" CssClass="form-control"
                        runat="server"></asp:TextBox>
                </div>
                <asp:Button ID="btnpay" CssClass="btn btn-default" runat="server" Text="Proceed to pay"
                    ClientIDMode="Static" OnClick="btnpay_Click1" /><br />
                <asp:HiddenField ID="hdnbank" ClientIDMode="Static" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
