<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/GSADMIN.master" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="OrderHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .hide {
            visibility: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div style="float:left;width:100%" >
        <fieldset class="fieldsetmain">
            <legend style="font-size: 16px;">ORDERED PRODUCT DETAILS
            </legend>
     
                    <table>
                        <tr>
                            <td><b>Order Code :</b> </td>
                            <td>
                                <asp:Label ID="lblOrderCode" runat="server" />
                                </td>
                        </tr>
                       <tr>
                            <td><b>Order Time :</b> </td>
                            <td>
                                <asp:Label ID="lblOrderTime" runat="server" />
                                </td>
                        </tr>
                        <tr>
                            <td><b>Customer Name :</b>
                            </td>
                            <td>
                                <asp:Label ID="lblCustomerName" runat="server" />
                                </td>
                         </tr>
                        <tr>
                            <td><b>Address :</b></td>
                            <td>
                                <asp:Label ID="lblAddress" runat="server" />
                                </td>

                        </tr>
                        <tr>
                            <td><b>City :</b></td>
                            <td>
                                <asp:Label ID="lblCity" runat="server" /></td>
                            
                        </tr>
                        <tr>
                            <td><b>State :</b></td>
                            <td>
                                <asp:Label ID="lblState" runat="server" /></td>
                            
                        </tr>
                            <tr>
                            <td><b>Postal Code :</b></td>
                            <td>
                                <asp:Label ID="lblPostalCode" runat="server" /></td>
                            
                        </tr>

                    </table>

            <div align="Left">
                <asp:GridView ID="gvorderHistory" runat="server" Width="574px" CaptionAlign="Top"
                    AutoGenerateColumns="False" Height="100px" BackColor="White"
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                    CellSpacing="2" GridLines="Vertical"
                    EmptyDataText="There Are no Orders">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:TemplateField HeaderText="Product Name">
                            <ItemTemplate>
                                <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="imgPd" runat="server" Height="60px"
                                ImageUrl='<%#"~/Images/"+Eval("ImageUrl").ToString() %>' Width="60px" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUploadGV" runat="server" />


                        </EditItemTemplate>
                    </asp:TemplateField>
                       
                          <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                                <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("CategoryType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Qty">
                            <ItemTemplate>
                                <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>  <asp:Label ID="lblUnit" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                $<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Price">
                            <ItemTemplate>
                                $<asp:Label ID="lblTotalPrice" runat="server" Text='<%# Eval("TotalAmount") %>'></asp:Label>
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
                 <div  id="divtotal" runat="server">
                    <div style="float: right; width: 283px; margin-right: 150px; height: 16px;">
                        Grand Total :
                   $<asp:Label ID="lblGrandTotal" runat="server" Text='<%# Eval("GrandTotal") %>'></asp:Label>
         
                    </div>

            </div>
        </fieldset>
    </div>
</asp:Content>
