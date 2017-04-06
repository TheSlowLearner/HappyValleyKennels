<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReservationList.ascx.cs" Inherits="HappyValleyKennels.controls.ReservationList" %>
<asp:ObjectDataSource ID="odsReservations" runat="server" SelectMethod="listReservations" TypeName="IronManhvkBLL.Reservation">
    <SelectParameters>
        <asp:SessionParameter Name="ownerNumber" SessionField="OwnerNumber" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>    
        
            <asp:ObjectDataSource ID="odsAllRes" runat="server" SelectMethod="listAllReservations" TypeName="IronManhvkBLL.Reservation"></asp:ObjectDataSource>
        
<h3>
            <asp:Label ID="lblHeaderSummary" runat="server" Text="My Reservations"></asp:Label>
        </h3>
        <hr />

<asp:GridView ID="gvResList" DataKeyNames="reservationNumber" EmptyDataText="You do not have any reservations yet" CssClass="summaryTables" runat="server" AutoGenerateColumns="False" DataSourceID="odsReservations" OnSelectedIndexChanged="gvOwnerReservations_SelectedIndexChanged">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False" CommandName="Select" Text="Edit Reservation"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Pets" SortExpression="reservationNumber">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblPets" runat="server" Text='<%# getPets(Convert.ToInt32(Eval("reservationNumber").ToString())) %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Start Date" SortExpression="reservationStartDate">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblStart" runat="server" Text='<%# Eval("reservationStartDate", "{0: dd MMMM, yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="End Date" SortExpression="reservationEndDate">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblEnd" runat="server" Text='<%# Eval("reservationEndDate", "{0: dd MMMM, yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<asp:GridView ID="gvAllRes"  CssClass="summaryTables" DataKeyNames="reservationNumber" runat="server" AutoGenerateColumns="False" DataSourceID="odsAllRes" OnSelectedIndexChanged="gvAllRes_SelectedIndexChanged" AllowPaging="True">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Edit Reservation"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Owner Name">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblOwner" runat="server" Text='<%# getOwnerName(Convert.ToInt16(Eval("reservationNumber").ToString())) %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
                <asp:TemplateField HeaderText="Pets">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblPets" runat="server" Text='<%# getPets(Convert.ToInt16(Eval("reservationNumber").ToString())) %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Start Date" SortExpression="reservationStartDate">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblStart" runat="server" Text='<%#  Eval("reservationStartDate", "{0: dd MMMM, yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="End Date" SortExpression="reservationEndDate">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblEnd" runat="server" Text='<%# Eval("reservationEndDate", "{0: dd MMMM, yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        
    </Columns>
    <PagerSettings Mode="NextPreviousFirstLast" />
</asp:GridView>





