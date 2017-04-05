<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OwnerList.ascx.cs" Inherits="HappyValleyKennels.controls.OwnerList" %>
<asp:ObjectDataSource ID="odsOwners" runat="server" SelectMethod="listOwners" TypeName="IronManhvkBLL.Owner" UpdateMethod="updateOwner">
    <UpdateParameters>
        <asp:Parameter Name="ownerNumber" Type="Int32" />
        <asp:Parameter Name="ownerFirstName" Type="String" />
        <asp:Parameter Name="ownerLastName" Type="String" />
        <asp:Parameter Name="ownerStreet" Type="String" />
        <asp:Parameter Name="ownerCity" Type="String" />
        <asp:Parameter Name="ownerProvince" Type="String" />
        <asp:Parameter Name="ownerPostalCode" Type="String" />
        <asp:Parameter Name="ownerPhone" Type="String" />
        <asp:Parameter Name="ownerEmail" Type="String" />
        <asp:Parameter Name="emergFirstName" Type="String" />
        <asp:Parameter Name="emergLastName" Type="String" />
        <asp:Parameter Name="emergPhone" Type="String" />
    </UpdateParameters>
</asp:ObjectDataSource>


<asp:ObjectDataSource ID="odsOwnerPet" runat="server" SelectMethod="getPetByOwner" TypeName="IronManhvkBLL.Pet">
    <SelectParameters>
        <asp:ControlParameter ControlID="gvOwnerList" Name="ownerNum" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>


<div id="ownerListContent" class="content">
   <h3>HVK Customers</h3>
    <hr />
<asp:GridView ID="gvOwnerList" runat="server" CssClass="summaryTables" DataKeyNames="ownerNumber" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="odsOwners" HorizontalAlign="Center" PageSize="5">
    <Columns>
        <asp:CommandField ShowSelectButton="True" SelectText="View Pets" ShowEditButton="True" />
        <asp:TemplateField HeaderText="First Name" SortExpression="ownerFirstName">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ownerFirstName") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("ownerFirstName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Last Name" SortExpression="ownerLastName">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ownerLastName") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("ownerLastName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Street" SortExpression="ownerStreet">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ownerStreet") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label6" runat="server" Text='<%# Bind("ownerStreet") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="City" SortExpression="ownerCity">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("ownerCity") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label7" runat="server" Text='<%# Bind("ownerCity") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Province" SortExpression="ownerProvince">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("ownerProvince") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label8" runat="server" Text='<%# Bind("ownerProvince") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Postal Code" SortExpression="ownerPostalCode">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("ownerPostalCode") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label9" runat="server" Text='<%# Bind("ownerPostalCode") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Phone" SortExpression="ownerPhone">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ownerPhone") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# (Eval("emergPhone").ToString() != "") ? string.Format("{0: (###) ###-####}", Int64.Parse(Eval("ownerPhone").ToString())) : "" %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Email" SortExpression="ownerEmail">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ownerEmail") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:HyperLink ID="Label3" runat="server" NavigateUrl='<%# Eval("ownerEmail", "mailto:{0}") %>' Text='<%# Bind("ownerEmail") %>'></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Emergency First Name" SortExpression="emergFirstName">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("emergFirstName") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label10" runat="server" Text='<%# Bind("emergFirstName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Emergency Last Name" SortExpression="emergLastName">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("emergLastName") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label11" runat="server" Text='<%# Bind("emergLastName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Emergency Phone" SortExpression="emergPhone">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("emergPhone") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# (Eval("emergPhone").ToString() != "") ? string.Format("{0: (###) ###-####}", Int64.Parse(Eval("emergPhone").ToString())) : "" %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <PagerSettings Mode="NextPreviousFirstLast" />
    <SelectedRowStyle CssClass="selected" />
</asp:GridView>




       <h3>Customer Pets</h3>
     <hr />
    <asp:GridView ID="gvOwnerPets" CssClass="summaryTables" runat="server" AutoGenerateColumns="False" DataSourceID="odsOwnerPet" EmptyDataText="This customer does not have any pets">
        <Columns>
            <asp:BoundField DataField="petName" HeaderText="Name" SortExpression="petName" />
            <asp:TemplateField HeaderText="Gender" SortExpression="petGender">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("petGender") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# getGenderString(Convert.ToInt32(Eval("petNumber").ToString()))  %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fixed" SortExpression="petFixed">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("petFixed") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# getFixedString(Convert.ToInt32(Eval("petNumber").ToString())) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Breed" SortExpression="petBreed">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("petBreed") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# (Eval("petBreed").ToString() == "") ? "Unknown" : Eval("petBreed") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Birthdate" SortExpression="petBirthdate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("petBirthdate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("petBirthdate", "{0}: dd MMMM, yyyy") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Size" SortExpression="petSize">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("petSize") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# getSizeString(Convert.ToInt32(Eval("petNumber").ToString()))  %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Notes" SortExpression="petSpecialNotes">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("petSpecialNotes") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# (Eval("petSpecialNotes").ToString() == "") ? "Unknown" : Eval("petSpecialNotes") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </div>



