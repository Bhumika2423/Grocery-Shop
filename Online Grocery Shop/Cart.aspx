<%@ Page Title="" Language="C#" MasterPageFile="~/GrocerySite.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 100%; float: left">

        <fieldset class="fieldsetmain">
            <legend style="font-size: 20px">Your Cart</legend>
            <div id="dvMain" runat="server">
                <div style="width: 100%;" align="center">
                    <asp:Label ID="lblmess" runat="server" BackColor="#EEEEEE" BorderColor="Black"
                        BorderStyle="Solid" BorderWidth="1px" Font-Bold="false" ForeColor="#851010"
                        Text="Please Enter Quantity" Visible="False"></asp:Label>
                    <asp:GridView ID="gvCart" runat="server" Width="574px" CaptionAlign="Top"
                        AutoGenerateColumns="False" Height="100px" BackColor="White"
                        BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                        CellSpacing="2" GridLines="Vertical"
                        EmptyDataText="There Are no items in Your Cart" OnRowCancelingEdit="gvCart_RowCancelingEdit"
                        OnRowUpdating="gvCart_RowUpdating" OnRowEditing="gvCart_RowEditing" OnRowDeleting="gvCart_RowDeleting">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="imgPd" runat="server" Height="60px"
                                        ImageUrl='<%# Eval("Product_img") %>' Width="60px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Product_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             
                            <asp:TemplateField HeaderText="Qty">
                                <ItemTemplate>
                                    <asp:Label ID="lblQty" runat="server" Text='<%# Bind("Qty") %>'></asp:Label> <asp:Label ID="lblUnit" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtQty" runat="server" Height="25px"
                                        Text='<%# Bind("Qty") %>' Width="41px"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    $<asp:Label ID="lblPrice" runat="server" Text='<%# Bind("ProductPrice") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Price">
                                <ItemTemplate>
                                    &nbsp;$<asp:Label ID="lbltotPriceGv" runat="server" Text='<%#Bind("TotalPrice") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="Edit/Remove" ShowDeleteButton="True"
                                ShowEditButton="True" DeleteText="Remove" />
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

                <div style="margin-top: 10px; width: 100%; text-align: center; background-color: red" id="divtotal" runat="server">
                    <div style="float: right; width: 350px; margin-right: 135px;">
                        <span>TOTAL AMOUNT : $<asp:Label ID="lbltotPrice" runat="server" Text=""></asp:Label></span>
                        <asp:Button ID="btnChekout" runat="server" CssClass="button" Font-Bold="True" Text="PROCEED TO CHECK OUT"
                            OnClick="btnChekout_Click" />
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
        </fieldset>
    </div>
</asp:Content>

