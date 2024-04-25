<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/GSADMIN.master" AutoEventWireup="true" CodeFile="ManageProducts.aspx.cs" Inherits="Admin_ManageProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            width: 46px;
        }
        .auto-style3 {
            height: 26px;
            width: 46px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <fieldset class="fieldsetmain">
        <legend style="font-size: 16px;">PRODUCT MANAGEMENT
        </legend>
        <div>
            <div align="center" style="height: 30px;">
                <asp:Label ID="lblMsg" runat="server" CssClass="lblresponse" />
            </div>
            <table align="center">
                <tr>
                    <td>Category</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlcategory" runat="server" Height="17px" Width="99px">
                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                            <asp:ListItem Value="2">Vegetables</asp:ListItem>
                            <asp:ListItem Value="1">Fruits</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtproductname" runat="server" onkeypress="return IsNumeric(event);" placeholder="Product Name" Width="206px"></asp:TextBox>
                        <span id="error" style="color: #900; font-size: 14px; margin-left: 152px; margin-top: -20px; display: none">Only Numbers</span> </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtproductname" ErrorMessage="Required" ForeColor="#990000"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                  <tr>
                    <td>Unit</td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlUnit" runat="server" Height="17px" Width="99px">
                            <asp:ListItem Value="-1">--Select--</asp:ListItem>
                            <asp:ListItem Value="Kg">Kg</asp:ListItem>
                            <asp:ListItem Value="Each">Each</asp:ListItem>
                             <asp:ListItem Value="Dozen">Dozen</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style1">Image </td>
                    <td class="auto-style3">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtprice" runat="server" CssClass="long" placeholder="Enter Price"></asp:TextBox>
                    </td>
                    <td>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtprice" ValidationExpression="^[0-9]*$" runat="server" ForeColor="#990000" ErrorMessage="Enter Only Number" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="long" placeholder="Enter Description" Width="212px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDescription" ErrorMessage="Enter Description" ForeColor="#990000"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center">
                        <asp:Button runat="server" Text="Add Product" ID="btnAddProduct" CssClass="button" OnClick="btnAddProduct_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div align="center">
            <asp:GridView ID="gvproduct" runat="server" Width="574px" CaptionAlign="Top"
                AutoGenerateColumns="False" Height="100px" BackColor="White"
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3"
                CellSpacing="2" GridLines="Vertical"
                EmptyDataText="There Are no Products" OnRowCancelingEdit="gvproduct_RowCancelingEdit" OnRowDeleting="gvproduct_RowDeleting" OnRowEditing="gvproduct_RowEditing" OnRowUpdating="gvproduct_RowUpdating">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:TemplateField HeaderText="product id" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblpid" Visible="false" runat="server" Text='<%# Eval("ProductId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product name">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Productname") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtproductname" runat="server" Height="25px"
                                Text='<%# Bind("Productname") %>' Width="41px"></asp:TextBox>

                        </EditItemTemplate>
                    </asp:TemplateField>
                  <asp:TemplateField HeaderText="Unit">
                        <ItemTemplate>
                            <asp:Label ID="lblUnit" runat="server" Text='<%# Eval("Unit") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlUnitGV" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                            <asp:ListItem Value="Kg">Kg</asp:ListItem>
                            <asp:ListItem Value="Each">Each</asp:ListItem>
                             <asp:ListItem Value="Dozen">Dozen</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
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
                            <asp:Label ID="lblcategory" runat="server" Text='<%# Eval("CategoryType") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlcategoryGV" runat="server">
                                <asp:ListItem Value="-1">--Select--</asp:ListItem>
                                <asp:ListItem Value="2">Vegetables</asp:ListItem>
                                <asp:ListItem Value="1">Fruits</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="lbldiscription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtdesc" runat="server" Height="25px"
                                Text='<%# Bind("Description") %>' Width="41px"></asp:TextBox>

                        </EditItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            $<asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrice" runat="server" Height="25px"
                                Text='<%# Bind("Price") %>' Width="41px"></asp:TextBox>

                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField HeaderText="Edit/Remove" ShowDeleteButton="True"
                        ShowEditButton="True" DeleteText="Remove" CausesValidation="false"/>
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
</asp:Content>

