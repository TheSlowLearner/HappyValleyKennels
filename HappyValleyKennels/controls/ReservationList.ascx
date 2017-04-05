<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReservationList.ascx.cs" Inherits="HappyValleyKennels.controls.ReservationList" %>
<asp:ObjectDataSource ID="odsReservations" runat="server" SelectMethod="listReservations" TypeName="IronManhvkBLL.Reservation">
    <SelectParameters>
        <asp:SessionParameter Name="ownerNumber" SessionField="OwnerNumber" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>    
        <h3>
            <asp:Label ID="lblHeaderSummary" runat="server" Text="My Reservations"></asp:Label>
        </h3>
        <hr />


<asp:GridView ID="gvResList" DataKeyNames="reservationNumber" EmptyDataText="You do not have any reservations yet" CssClass="summaryTables" runat="server" AutoGenerateColumns="False" DataSourceID="odsReservations" OnSelectedIndexChanged="gvOwnerReservations_SelectedIndexChanged">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Pets" SortExpression="reservationNumber">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("reservationNumber") %>'></asp:TextBox>
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



