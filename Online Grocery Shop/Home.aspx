<%@ Page Title="" Language="C#" MasterPageFile="~/GrocerySite.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <br />
        <asp:Image ID="Image1" runat="server" Height="336px" />
        <cc1:SlideShowExtender ID="SlideShowExtender" runat="server" TargetControlID="Image1"
            SlideShowServiceMethod="GetImages" ImageTitleLabelID="lblImageTitle" ImageDescriptionLabelID="lblImageDescription"
            AutoPlay="true" PlayInterval="2000" Loop="true">
        </cc1:SlideShowExtender>
    </div>
    <div>
        <div style="float: left; width: 300px;">
            <div class="sideLogin">
                <div class="welcome">Welcome To Fresho Fruit Mart</div>
                <p>
                    At Fresho Fruit Mart our goal is to provide you with the wide varieties of Fruits and Vegetables.
                </p>
                <table>
                    <tr>
                        <td>UserName
                        </td>
                        <td style="width: 140px">
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="textLogin" />
                        </td>
                        <td style="font-size: 11px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtUserName" ForeColor="#990000"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>Password
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="textLogin" />
                        </td>
                        <td style="font-size: 11px;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Password" ControlToValidate="txtPassword" ForeColor="#990000" CssClass="font"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button" OnClick="btnLogin_Click" />&nbsp;&nbsp;
                            <asp:LinkButton ID="lnkRegister" runat="server" Text="New Registration" PostBackUrl="~/Registration.aspx" CausesValidation="False" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <asp:Label ID="lblResult" runat="server" />
                        </td>
                    </tr>
                </table>
                <br />
                <div class="contact_informatin">
                    <div class="welcome">Contact Us</div>
                    <table class="call">
                        <tr>
                            <td>
                                <img src="images/phone_icon.gif" alt="" title="" class="icon">
                            </td>
                            <td>0220217692</td>
                        </tr>
                        <tr>
                            <td>
                                <img src="images/contact_icon.gif" alt="" title="" class="icon">
                            </td>
                            <td>freshofruitmart@gmail.com</td>
                        </tr>
                    </table>

                </div>
            </div>
            <br />

        </div>

        <div class="bodyImages">
            <div class="welcome">Our Products</div>
            <img src="Images/4.jpg" /><img src="Images/1.jpg" />
            <img src="Images/2.jpg" /><img src="Images/3.jpg" />
        </div>
    </div>
</asp:Content>

