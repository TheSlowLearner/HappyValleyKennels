﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PetList.ascx.cs" Inherits="HappyValleyKennels.controls.PetList" %>
<asp:ObjectDataSource ID="odsPets" runat="server" SelectMethod="getPetByOwner" TypeName="IronManhvkBLL.Pet">
    <SelectParameters>
        <asp:SessionParameter Name="ownerNum" SessionField="OwnerNumber" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
            <h3>
            <asp:Label ID="lblHeaderSummary" runat="server" Text="My Pets"></asp:Label>
        </h3>
        <hr />
<asp:GridView ID="gvPetList" DataKeyNames="petNumber" CssClass="summaryTables" EmptyDataText="You do not have any pets yet" runat="server" AutoGenerateColumns="False" DataSourceID="odsPets" OnSelectedIndexChanged="gvPetList_SelectedIndexChanged">
      <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Select" Text="Edit Pet"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="petName" HeaderText="Name" SortExpression="petName" />
            <asp:TemplateField HeaderText="Gender" SortExpression="petGender">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGender" runat="server" Text='<%# Bind("petGender") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblGender" runat="server" Text='<%# getGender(Convert.ToInt32(Eval("petNumber").ToString()))  %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fixed" SortExpression="petFixed">
                <EditItemTemplate>
                    <asp:TextBox ID="txtFixed" runat="server" Text='<%# Bind("petFixed") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblFixed" runat="server" Text='<%# getFixed(Convert.ToInt32(Eval("petNumber").ToString())) %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Breed" SortExpression="petBreed">
                <EditItemTemplate>
                    <asp:TextBox ID="txtBreed" runat="server" Text='<%# Bind("petBreed") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblBreed" runat="server" Text='<%# (Eval("petBreed").ToString() == "") ? "Unknown" : Eval("petBreed") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Birthdate" SortExpression="petBirthdate">
                <EditItemTemplate>
                    <asp:TextBox ID="txtBirthdate" runat="server" Text='<%# Bind("petBirthdate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblBirthdate" runat="server" Text='<%# Eval("petBirthdate", "{0: dd MMMM, yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Size" SortExpression="petSize">
                <EditItemTemplate>
                    <asp:TextBox ID="txtSize" runat="server" Text='<%# Bind("petSize") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblSize" runat="server" Text='<%# getSize(Convert.ToInt32(Eval("petNumber").ToString()))  %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Notes" SortExpression="petSpecialNotes">
                <EditItemTemplate>
                    <asp:TextBox ID="txtNotes" runat="server" Text='<%# Bind("petSpecialNotes") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblNotes" runat="server" Text='<%# (Eval("petSpecialNotes").ToString() == "") ? "Unknown" : Eval("petSpecialNotes") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
</asp:GridView>
