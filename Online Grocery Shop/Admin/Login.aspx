<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Styles/Main.css" rel="stylesheet" />
    <style type="text/css">
        .ErrorMsg {
            font-size: 12px;
            color: #851010;
            font-weight: bold;
        }

        input[type="text"] {
            height: 20px;
        }

        fieldset {
            border: 2px solid #808080;
            border-radius: 4px 4px;
            padding: 10px 10px;
            margin-left: 10px;
            margin-right: 10px;
            margin-bottom: 35px;
            margin-top: 10px;
        }

        .adLogin {
            height: 50px;
            width: 50px;
        }

        .invalidlogin {
            color: #851010;
            border: 1px solid black;
            background-color: #e6e6e6;
            position: relative;
            top: 10px;
            left: 115px;
            padding: 0px 5px;
            width: 100px;
        }
    </style>
</head>
<body style="padding-top: 20px; width: 100%; height: 100%">
    <form id="form1" runat="server">
        <div style="width: 400px; margin: auto; background-color: white; border: double 3px #808080;">
            <span id="spnmsg" runat="server" visible="false" class="invalidlogin">Invalid Username / Password
            </span>
            <fieldset>
                <legend style="font-size: 20px;">
                    <img src="../Images/administrator.ico" class="adLogin" /><span style="position: relative; top: -15px;">Admin Login</span></legend>
                <table>
                    <tr>
                    </tr>
                    <tr>
                        <td>UserName :
                        </td>
                        <td>
                            <asp:TextBox ID="txtUnameAd" runat="server" placeholder="UserName" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUnameAd" Display="Dynamic" CssClass="ErrorMsg" ErrorMessage="Required" />
                        </td>
                    </tr>
                    <tr>
                        <td>Password :
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassAd" runat="server" TextMode="Password" placeholder="Password" />
                        </td>
                        <td>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassAd" Display="Dynamic" ErrorMessage="Required" CssClass="ErrorMsg" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnAdlogin" runat="server" Text="Login" CssClass="button" OnClick="btnAdlogin_Click" /></td>
                        <td></td>
                    </tr>
                </table>
            </fieldset>



        </div>

    </form>
</body>
</html>
