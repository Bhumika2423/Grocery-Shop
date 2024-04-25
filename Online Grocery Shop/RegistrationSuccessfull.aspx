<%@ Page Title="" Language="C#" MasterPageFile="~/GrocerySite.master" AutoEventWireup="true" CodeFile="RegistrationSuccessfull.aspx.cs" Inherits="RegistrationSuccessfull" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="float:left;width:100%">
    <fieldset class="fieldsetmain">
        <legend style="font-size:20px;">
            Registration Successful
        </legend>
        <div>
            <br />
            <center>
                <span style="font-size:20px;color:green">
                Congratulation Your Registration is Successful, Below is Your Account Details.
            </span>
            </center>
            
            <fieldset>
                <legend>Account Details
                </legend>
                <table>
                    <tr>
                        <td><b>Email :</b></td>
                        <td>
                            <asp:Label ID="lbEmail" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Password :</b></td>
                       <td><asp:Label ID="lbpwd" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </fieldset>
            <div style="float: left;">
                <fieldset class="sub" style="height: 150px">
                    <legend>Personal Details
                    </legend>
                    <table>
                        <tr>
                            <td><b>Name :</b> </td>
                            <td>
                                <asp:Label ID="lbName" runat="server" />
                                </td>
                        </tr>
                       <tr>
                            <td><b>Phone :</b> </td>
                            <td>
                                <asp:Label ID="lblPhone" runat="server" />
                                </td>
                        </tr>
                        <tr>
                            <td><b>Street :</b>
                            </td>
                            <td>
                                <asp:Label ID="lbStreet" runat="server" />
                                </td>
                         </tr>
                        <tr>
                            <td><b>City :</b></td>
                            <td>
                                <asp:Label ID="lblCity" runat="server" />
                                </td>

                        </tr>
                        <tr>
                            <td><b>Country :</b></td>
                            <td>
                                <asp:Label ID="lblCOuntry" runat="server" /></td>
                            
                        </tr>
                    </table>
                </fieldset>
            </div>
            <div style="float: right">
                <fieldset class="sub" style="height: 150px">
                    <legend>Other Information
                    </legend>
                    <table>
                        <tr>
                            <td><b>Gender :</b></td>
                            <td>
                                <asp:Label ID="lblGen" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td><b>Birthdate :</b></td>
                            <td>
                             <asp:Label ID="lblDob" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td><b>Nationality :</b></td>
                            <td>
                                <asp:Label ID="lblNatio" runat="server" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </div>
        </div>
    </fieldset>
        </div>
</asp:Content>

