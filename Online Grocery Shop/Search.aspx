<%@ Page Title="" Language="C#" MasterPageFile="~/GrocerySite.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .imgclass {
            width:205px;
            height:272px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="float: left; width: 100%">
        <fieldset class="fieldsetmain">
            <legend style="font-size: 20px;">Search Results</legend>
            <div style="height:30px;" align="center">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Enter Product Name" CssClass="textBox"/>
                <asp:Button ID="btnSearch" Text="Search" runat="server" OnClick="btnSearch_Click" CausesValidation="false" CssClass="searchbutton" /><br />
                <asp:Label ID="lblMsg" runat="server" CssClass="lblresponse" />
            </div>
            <asp:DataList runat="server" ID="gvSearch" RepeatDirection="Horizontal" RepeatColumns="4">
                <ItemTemplate>
                    <asp:Label Visible="false" ID="ProductIdLabel" runat="server" Text='<%# Eval("ProductId") %>' />
                    <br />

                    <asp:Label ID="TypeIdLabel" runat="server" Text='<%# Eval("CategoryId") %>' Visible="false" />
                    <br />
                    <table>
                        <tr>
                            <td style="border-style: dashed; border-width: 1px;">
                                <asp:Image ID="imgPd" CssClass="imgclass" runat="server" ImageUrl='<%#"~/Images/"+Eval("ImageUrl").ToString() %>' /><br />
                                <br />
                                Product Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("ProductName") %>' />
                                <br />
                      
                                Description:
            <asp:Label ID="DiscriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                                <br />
                                Price:
            <asp:Label ID="PriceLabel" runat="server" Text='<%#"$"+ Eval("Price") %>' />
                                <br />
                                                           Enter The Quantity:&nbsp;
            <asp:TextBox ID="txtQty" runat="server" Width="30" Height="20" Text="1" style="text-align:center" > </asp:TextBox><asp:Label ID="UnitLabel" runat="server" Text='<%# Eval("Unit") %>' />
                                <center>
                                    <br />
            <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart"  CssClass="button" onClick="btnAddToCart_Click" causesvalidation="false"/></center>

                            </td>

                        </tr>

                    </table>
                </ItemTemplate>



            </asp:DataList>
        </fieldset>
    </div>
</asp:Content>

