<%@ Page Title="" Language="C#" MasterPageFile="~/HappyValleyKennels.Master" AutoEventWireup="true" CodeBehind="ManagePet.aspx.cs" Inherits="HappyValleyKennels.ManagePet" %>

<%@ Register Src="~/controls/PetList.ascx" TagPrefix="uc1" TagName="PetList" %>
<%@ Register Src="~/controls/PetForm.ascx" TagPrefix="uc2" TagName="PetForm" %>


<%@ Reference Control="~/controls/PetList.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/ManagePet.css" rel="stylesheet" />
    <title>Manage Pet</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <asp:Panel ID="mainContent" CssClass="content" runat="server">
          <uc1:PetList runat="server" id="PetList" />

        <uc2:PetForm runat="server" ID="PetForm" />
   </asp:Panel>
</asp:Content>

  <%-- Summary Content --%>
<asp:Content ID="Content3" ContentPlaceHolderID="summary" runat="server">
    
  
</asp:Content>
