<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reciept.aspx.cs" Inherits="PropertyInsurance.Reciept" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
        integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
        crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
        integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
        crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
    <title>Reciept</title>
    <style type="text/css">
        .jumbotron
        {
            background-color: #ecf0f1;
            color: #000;
            font-family: Californian FB;
            font-size: 20px;
            font-weight: 800;
        }
        h2
        {
            color: #000;
            text-align: center;
            font-style: oblique;
            text-decoration: underline;
        }
        
        img
        {
            width: 100px;
            height: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <img src="Resources/success.png" /></center>
    </div>
    </form>
    <br />
    <br />
    <br />
    <div class="container">
        <div class="jumbotron">
            <h2>
                Reciept</h2>
            <table>
                <tr>
                    <td>
                        Transaction ID :&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:Label ID="lbltranid" ClientIDMode="Static" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Paid By :&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:Label ID="lblpaidby" ClientIDMode="Static" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Paid To :&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:Label ID="lblpaidto" ClientIDMode="Static" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Policy Number :&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:Label ID="lblpolnum" ClientIDMode="Static" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Authorized Bank :&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:Label ID="lblbank" ClientIDMode="Static" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Amount Paid:&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:Label ID="lblamt" ClientIDMode="Static" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Payment Done on :&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:Label ID="lblpaidon" ClientIDMode="Static" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <span style="color: Red;">** Kindly take a screen shot of this for reference</span>
    </div>
</body>
</html>
