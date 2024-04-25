<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/GSADMIN.master" AutoEventWireup="true" CodeFile="ManageOrders.aspx.cs" Inherits="Admin_ManageOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <fieldset class="fieldsetmain">
        <legend style="font-size: 16px;">ORDER MANAGEMENT
        </legend>
        <div style="overflow:auto">
            <div align="center" style="height: 30px;">
                <asp:Label ID="lblMsg" runat="server" CssClass="lblresponse" />
            </div>
             <div style="width: 220px; margin-top: 10px; height: 28px;">
                    <div style="width: 188px; float: right">
                        <asp:Button ID="btnExport" runat="server" CssClass="button" Font-Bold="True" Text="Export To Excel"
                            OnClick="btnExport_Click" Height="26px" Width="148px" />
                    </div>
                </div>
            <div align="center">
                <asp:GridView ID="gvManageOrders" runat="server" Width="574px" CaptionAlign="Top"
                    AutoGenerateColumns="False" Height="100px" BackColor="White"
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                    CellSpacing="2" GridLines="Vertical"
                    EmptyDataText="There Are no Orders" OnRowCancelingEdit="gvManageOrders_RowCancelingEdit"
                    OnRowDeleting="gvManageOrders_RowDeleting" OnRowEditing="gvManageOrders_RowEditing"
                    OnRowUpdating="gvManageOrders_RowUpdating">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:TemplateField HeaderText="Order Code">
                            <ItemTemplate>
                                <asp:Label ID="lblOCode" runat="server" Text='<%# Eval("order_code") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="OrderDateTime">
                            <ItemTemplate>
                                <asp:Label ID="lblOdt" runat="server" Text='<%# Eval("order_time") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User ID">
                            <ItemTemplate>
                                <asp:Label ID="lblUId" runat="server" Text='<%# Bind("User_Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Customer Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label ID="lblAdress" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAdd" runat="server" Text='<%#Eval("Address") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCity" runat="server" Text='<%#Eval("City") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtState" runat="server" Text='<%#Eval("State") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Postal Code">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPc" runat="server" Text='<%#Eval("PostalCode") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPC" runat="server" Text='<%# Bind("PostalCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Payable Amount">
                            <ItemTemplate>
                                $<asp:Label ID="lblPamnt" runat="server" Text='<%# Bind("GrandTotal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                          <asp:TemplateField HeaderText="Comment">
                            <ItemTemplate>
                                <asp:Label ID="lblComment" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                     <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlStatusGV" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                  <asp:ListItem Value="Confirmed">Confirmed</asp:ListItem>
                            <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>
                                <asp:ListItem Value="Delivered">Delivered</asp:ListItem>
                             <asp:ListItem Value="Returned">Returned</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
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
        </div>
    </fieldset>
</asp:Content>

