<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerHomePage.ascx.cs" Inherits="HappyValleyKennels.controls.CustomerHomePage" %>
<asp:ObjectDataSource ID="odsUpcomingRes" runat="server" SelectMethod="upcomingReservationsByOwner" TypeName="IronManhvkBLL.Reservation">
    <SelectParameters>
        <asp:SessionParameter Name="ownerNum" SessionField="OwnerNumber" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<h3>Upcoming Reservations</h3>
        <hr />


<asp:GridView ID="gvUpcomingReservation" DataKeyNames="reservationNumber" CssClass="summaryTables" runat="server" EmptyDataText="You have no upcoming reservations :(" AutoGenerateColumns="False" DataSourceID="odsUpcomingRes" OnSelectedIndexChanged="gvUpcomingReservation_SelectedIndexChanged">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Edit Reservation"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="reservationNumber" SortExpression="reservationNumber">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblPets" runat="server" Text='<%# getPets(Convert.ToInt32(Eval("reservationNumber").ToString())) %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="reservationStartDate" SortExpression="reservationStartDate">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblStart" runat="server" Text='<%# Eval("reservationStartDate", "{0: dd MMMM, yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="reservationEndDate" SortExpression="reservationEndDate">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="lblEnd" runat="server" Text='<%# Eval("reservationEndDate", "{0: dd MMMM, yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>



