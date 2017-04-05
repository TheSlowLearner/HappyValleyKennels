<%@ Page Title="" Language="C#" MasterPageFile="~/HappyValleyKennels.Master" AutoEventWireup="true" CodeBehind="ManageReservation.aspx.cs" Inherits="HappyValleyKennels.ManageReservation" %>

<%@ Reference Control="~/controls/PetReservationPanel.ascx" %>
<%@ Reference Control="~/controls/ReservationForm.ascx" %>
<%@ Register Src="~/controls/ReservationList.ascx" TagPrefix="uc1" TagName="ReservationList" %>
<%@ Register Src="~/controls/ReservationForm.ascx" TagPrefix="uc2" TagName="ReservationForm" %>

<%@ Reference Control="~/controls/ReservationList.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/ManageReservation.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
  
    
    <asp:Panel ID="mainContent" CssClass="content" runat="server">
           <uc1:ReservationList runat="server" id="ReservationList" />
        <uc2:ReservationForm runat="server" id="ReservationForm" />
    </asp:Panel>
 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="summary" runat="server">
 
</asp:Content>
