<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true"
    CodeBehind="preview.aspx.cs" Inherits="PropertyInsurance.preview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
        <script type="text/javascript">
            function PopupCenterDual(url, title, w, h) {
                var policynumber = document.getElementById("hdpolnum").value;
                var policyid = document.getElementById("hdpolid").value;

                // Fixes dual-screen position Most browsers Firefox
                var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
                var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;

                width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
                height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
                var left = ((width / 2) - (w / 6)) + dualScreenLeft;
                var top = ((height / 2) - (h / 2)) + dualScreenTop;
                var newWindow = window.open('AddPolicy.aspx?policynum=' + policynumber + '&' + 'policyid=' + policyid, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

                // Puts focus on the newWindow
                if (window.focus) {
                    newWindow.focus();
                }
            }

        </script>
    </head>
    <div class="row">
        <div class="col-lg-12">
            <asp:HiddenField ID="hdpolnum" ClientIDMode="Static" runat="server" />
            <asp:HiddenField ID="hdpolid" ClientIDMode="Static" runat="server" />
            <h2 class="page-header col-lg-6">
                ENROLLMENT FORM &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a style="text-decoration: underline;
                    color: Maroon; font-size: 15px;" onclick="PopupCenterDual('AddPolicy.aspx','Link Customer','650','650');"
                    href="javascript:void(0)">click here to issue this policy</a>
        </div>
        <div id="nomination">
            <table id="nomtab">
                <tr>
                    <td class="col-lg-3">
                        <b>Date of application:</b><asp:Label ID="txtdate" runat="server"></asp:Label>
                    </td>
                    <td class="col-lg-3">
                        <b>** All fields are mandatory</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4 class="page-header">
                        Your Plan Details
                    </td>
                    </h4></tr>
                <asp:PlaceHolder ID="phpolsummary" runat="server"></asp:PlaceHolder>
                <tr>
                    <td>
                        <h4 class="page-header">
                        Personal Details
                    </td>
                    </h4></tr>
                <tr>
                    <td class="col-lg-3">
                        <b>Customer ID : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                    <td class="col-lg-3">
                        <b>Email ID : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                </tr>
                <tr>
                    <td class="col-lg-3">
                        <b>Full Name : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                    <td class="col-lg-3">
                        <b>Mobile : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                </tr>
                <tr>
                    <td class="col-lg-3">
                        <b>Gender :</b>
                    </td>
                    <td class="col-lg-3">
                        <b>Male
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                            Female
                            <asp:CheckBox ID="CheckBox2" runat="server" />
                        </b>
                    </td>
                    <td class="col-lg-3">
                        <b>Blood Group : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                </tr>
                <tr>
                    <td class="col-lg-3">
                        <b>Working For (Company you work for) : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                    <td class="col-lg-3">
                        <b>Customer Occupation : </b>
                    </td>
                    <td class="col-lg-3">
                        ______________________________</b>
                    </td>
                </tr>
                <tr>
                    <td class="col-lg-3">
                        <b>Father Name : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                    <td class="col-lg-3">
                        <b>Father Occupation : </b>
                    </td>
                    <td class="col-lg-3">
                        ______________________________</b>
                    </td>
                </tr>
                <td class="col-lg-3">
                    <b>DOB : </b>
                </td>
                <td class="col-lg-3">
                    <b>______________________________</b>
                </td>
                <td class="col-lg-3">
                    <b>Age : </b>
                </td>
                <td class="col-lg-3">
                    <b>______________________________</b>
                </td>
                </tr>
                <tr>
                    <td>
                        <h4 class="page-header">
                        Temporary Address
                    </td>
                    </h4></tr>
                <tr>
                    <td class="col-lg-3">
                        <b>Address : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                    <td class="col-lg-3">
                        <b>Pincode : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                </tr>
                <tr>
                    <td class="col-lg-3">
                        <b>State : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                    <td class="col-lg-3">
                        <b>City/Town/Village : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4 class="page-header">
                        Permanent Address&nbsp;&nbsp;&nbsp;
                    </td>
                    </h4></tr>
                <tr>
                    <td class="col-lg-3">
                        <b>Address : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                    <td class="col-lg-3">
                        <b>Pincode : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                </tr>
                <tr>
                    <td class="col-lg-3">
                        <b>State : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                    <td class="col-lg-3">
                        <b>City/Town/Village : </b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4 class="page-header">
                        National Id proof
                    </td>
                    </h4></tr>
                <tr>
                    <td class="col-lg-3">
                        <b>ID Type (PAN/Passport/Aadhar/Voter ID)</b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                    <td class="col-lg-3">
                        <b>ID Number</b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                </tr>
                <tr>
                    <td class="col-lg-3">
                        <b>Name on Proof:</b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                    <td class="col-lg-3">
                        <b>Expiry Date:</b>
                    </td>
                    <td class="col-lg-3">
                        <b>______________________________</b>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4 class="page-header">
                        Declaration
                    </td>
                    </h4></tr>
                <tr>
                    <td>
                        <b>Signature of customer :
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </div>
</asp:Content>
