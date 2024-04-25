<%@ Page Title="" Language="C#" MasterPageFile="~/GrocerySite.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .lblresponse {
            font-size:16px !important;
            color:#851010;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; float: left">
        <fieldset class="fieldsetmain">
            <legend style="font-size: 20px">Your Order</legend>
            <div align="center" style="height:30px;">
            <asp:Label ID="lblMsg" runat="server" CssClass="lblresponse"/>
        </div>
            <div id="divmain" runat="server">
                 <div style="width: 100%;" align="center">
                <asp:GridView ID="gvorder" runat="server" Width="574px" CaptionAlign="Top"
                    AutoGenerateColumns="False" Height="100px" BackColor="White"
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                    CellSpacing="2" GridLines="Vertical"
                    EmptyDataText="There Are no items in Your Cart">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="imgPd" runat="server" Height="60px"
                                    ImageUrl='<%# Eval("Product_img") %>' Width="60px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Order Number" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lblOrderNum" runat="server" Text='<%# Eval("OrderNumber") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Product_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         
                        <asp:TemplateField HeaderText="Qty">
                            <ItemTemplate>
                                <asp:Label ID="lblQty" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>  <asp:Label ID="lblUnit" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                $<asp:Label ID="lblPrice" runat="server" Text='<%# Bind("ProductPrice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="TotalPrice">
                            <ItemTemplate>
                                &nbsp;$<asp:Label ID="lbltotPriceGv" runat="server" Text='<%#Bind("TotalPrice") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataRowStyle BackColor="#eeeeee" BorderColor="Black"
                        BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" ForeColor="#851010"
                        HorizontalAlign="Center" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#851010" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#851010" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </div>

            <div style="width: 100%; margin-top: 10px" align="center">
                <fieldset style="width: 550px;" align="left">
                    <legend>Shipping Detail</legend>
                    <table style="width: 100%">
                        <tr>
                            <td>Name *</td>
                            <td>
                                <asp:TextBox ID="txtname" runat="server" CssClass="long" placeholder="Enter Name"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtname" ForeColor="#990000"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>Phone *</td>
                            <td>
                                <asp:TextBox ID="txtphone" runat="server" placeholder="Enter Phone No."></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Phone No" ControlToValidate="txtphone" ForeColor="#990000"></asp:RequiredFieldValidator>

                            </td>

                        </tr>

                        <tr>
                            <td>Street Address *
                            </td>
                            <td>
                                <asp:TextBox ID="txtstreet" runat="server" CssClass="long" placeholder="Enter Street Address"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Street Address" ControlToValidate="txtstreet" ForeColor="#990000"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>City *</td>
                            <td>
                                <asp:TextBox ID="txtcity" runat="server" CssClass="long" placeholder="Enter City"></asp:TextBox></td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter City" ControlToValidate="txtcity" ForeColor="#990000"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>State *</td>
                            <td>
                                <asp:TextBox ID="txtstate" runat="server" CssClass="long" placeholder="Enter State"></asp:TextBox>
                                <asp:Label ID="lblUserID" runat="server" Text="Label" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter State" ControlToValidate="txtstate" ForeColor="#990000"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td>Postal Code *
                            </td>
                            <td>
                                <asp:TextBox ID="txtPostal" runat="server" CssClass="long" placeholder="Enter Postal Code"></asp:TextBox>
                                <asp:Label ID="lblOrderCode" runat="server" Text="Label" Visible="False"></asp:Label>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Postal Code" ControlToValidate="txtPostal" ForeColor="#990000"></asp:RequiredFieldValidator></td>

                        </tr>
                         <tr>
                            <td>Comment</td>
                            <td>
                                <asp:TextBox ID="txtComment" runat="server" CssClass="long" placeholder="Enter comment" Height="16px" Width="214px"></asp:TextBox></td>
   

                        </tr>
                    </table>
                </fieldset>
                <div style="width: 574px; margin-top: 10px;">
                    <div style="width: 200px; float: right">
                        <span>TOTAL AMOUNT : $<asp:Label ID="lbltotPrice" runat="server" Text=""></asp:Label></span><br />
                       <asp:ImageButton id="imagebutton1" runat="server"
           AlternateText="ImageButton 1"
           ImageAlign="left"
           ImageUrl="https://www.paypal.com/en_US/i/bnr/horizontal_solution_PPeCheck.gif"
           OnClick="ImageButton_Click"/>

                        <td align="center">

                    </div>
                </div>
            </div>
            </div>
           

            <div style="width: 100%;" align="center" id="dvempty" runat="server" visible="false">
                <div>
                    <table cellspacing="2" cellpadding="3" rules="cols" style="background-color: White; border-color: #999999; border-width: 1px; border-style: None; height: 100px; width: 574px;">
                        <tr align="center" style="color: #851010; background-color: #EEEEEE; border-color: Black; border-width: 1px; border-style: Solid; font-size: Large;">
                            <td colspan="6">There Are no items in Your Cart</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="width: 100%;" align="center" id="divLogin" runat="server" visible="false">
                <div>
                    <table cellspacing="2" cellpadding="3" rules="cols" style="background-color: White; border-color: #999999; border-width: 1px; border-style: None; height: 100px; width: 574px;">
                        <tr align="center" style="color: #851010; background-color: #EEEEEE; border-color: Black; border-width: 1px; border-style: Solid; font-size: Large;">
                            <td colspan="6">Please Login To Continue...</td>
                        </tr>
                    </table>
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>

