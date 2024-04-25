<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/GSADMIN.master" AutoEventWireup="true" CodeFile="ViewOrders.aspx.cs" Inherits="OrderHistory" %>

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
            <legend style="font-size: 16px;">VIEW ORDERS
            </legend>

            <div align="center" style="height: 30px;">
                <asp:Label ID="lblMsg" runat="server" CssClass="lblresponse" />
            </div>
            <div align="center">
                <asp:GridView ID="gvorderHistory" runat="server" Width="574px" CaptionAlign="Top"
                    AutoGenerateColumns="False" Height="100px" BackColor="White"
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                    CellSpacing="2" GridLines="Vertical"
                    EmptyDataText="There Are no Orders" OnRowCommand="gvorderHistory_RowCommand">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:TemplateField HeaderText="Order Code">
                            <ItemTemplate>
                                <asp:Label ID="lblOCde" runat="server" Text='<%# Eval("order_code") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="OrderDateTime">
                            <ItemTemplate>
                                <asp:Label ID="lblOdt" runat="server" Text='<%# Eval("order_time") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Customer Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="State">
                            <ItemTemplate>
                                <asp:Label ID="lblState" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="PostalCode">
                            <ItemTemplate>
                                <asp:Label ID="lblPostalCode" runat="server" Text='<%# Eval("PostalCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Payable Amount">
                            <ItemTemplate>

                               $<asp:Label ID="lblPamnt" runat="server" Text='<%# Bind("GrandTotal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Details">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkbtnInvoice" runat="server" CommandArgument='<%# Eval("order_Code") %>'>View</asp:LinkButton>
                                <%--  <asp:Button ID ="btnInvoice" runat ="server" Text="View" CommandName="invoice" CommandArgument='<%# Eval("order_id") %>' />--%>
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
        </fieldset>
    </div>
</asp:Content>

