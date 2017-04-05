<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReservationStartingToday.ascx.cs" Inherits="HappyValleyKennels.controls.ReservationStartingToday" %>
<asp:ObjectDataSource ID="odsStartingToday" runat="server" SelectMethod="getReservationStartingToday" TypeName="IronManhvkBLL.Reservation"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsEndingToday" runat="server" SelectMethod="getReservationEndingToday" TypeName="IronManhvkBLL.Reservation"></asp:ObjectDataSource>
<h3>Reservations Starting Today</h3>
<hr />
<asp:GridView ID="gvStartingToday" CssClass="summaryTables" runat="server" AutoGenerateColumns="False" EmptyDataText="There Are No Reservations Starting Today" DataSourceID="odsStartingToday">
    <Columns>
        <asp:TemplateField HeaderText="Owner Name" SortExpression="ownerFirstName">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ownerFirstName") + " " + Eval("ownerLastName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="reservationStartDate" HeaderText="Start Date" SortExpression="reservationStartDate" />
        <asp:BoundField DataField="reservationEndDate" HeaderText="End Date" SortExpression="reservationEndDate" />
    </Columns>
</asp:GridView>
<h3>Reservations Ending Today</h3>
<hr />


<asp:GridView ID="gvEndingToday" CssClass="summaryTables" runat="server" AutoGenerateColumns="False" EmptyDataText="There Are No Reservations Ending Today" DataSourceID="odsEndingToday">
    <Columns>
        <asp:TemplateField HeaderText="Owner Name" SortExpression="ownerFirstName">
            <EditItemTemplate>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ownerFirstName") + " " + Eval("ownerLastName") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="reservationStartDate" HeaderText="Start Date" SortExpression="reservationStartDate" />
        <asp:BoundField DataField="reservationEndDate" HeaderText="End Date" SortExpression="reservationEndDate" />
    </Columns>
</asp:GridView>



