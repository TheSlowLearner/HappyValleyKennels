<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerHomePage.ascx.cs" Inherits="HappyValleyKennels.controls.CustomerHomePage" %>
<asp:ObjectDataSource ID="odsUpcomingRes" runat="server" SelectMethod="upcomingReservationsByOwner" TypeName="IronManhvkBLL.Reservation">
    <SelectParameters>
        <asp:SessionParameter Name="ownerNum" SessionField="OwnerNumber" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
<h3>Upcoming Reservations</h3>
        <hr />


<asp:GridView ID="gvUpcomingReservation" CssClass="summaryTables" runat="server" EmptyDataText="You have no upcoming reservations :(" AutoGenerateColumns="False" DataSourceID="odsUpcomingRes">
    <Columns>
        <asp:TemplateField HeaderText="reservationNumber" SortExpression="reservationNumber">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# getPets(Convert.ToInt32(Eval("reservationNumber").ToString())) %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# getPets(Convert.ToInt32(Eval("reservationNumber").ToString())) %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="reservationStartDate" SortExpression="reservationStartDate">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("reservationStartDate") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("reservationStartDate", "{0: dd MMMM, yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="reservationEndDate" SortExpression="reservationEndDate">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("reservationEndDate") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("reservationEndDate", "{0: dd MMMM, yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>



