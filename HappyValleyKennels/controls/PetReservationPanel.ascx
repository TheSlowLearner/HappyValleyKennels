<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PetReservationPanel.ascx.cs" Inherits="HappyValleyKennels.PetReservationPanel" %>
<asp:UpdatePanel ID="panelPetReservation" runat="server">
    <ContentTemplate>
        <h3>Optional Services</h3>
        <hr />
        <p>
            <asp:CheckBox CssClass="serviceLabels" ID="chkWalk" Text="Extra Walk" TextAlign="left" runat="server" />
        </p>
        <p>
            <asp:CheckBox CssClass="serviceLabels" ID="chkPlaytime" Text="Playtime" TextAlign="left" runat="server" />
        </p>
    </ContentTemplate>
</asp:UpdatePanel>
