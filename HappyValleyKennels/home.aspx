<%@ Page Title="" Language="C#" MasterPageFile="~/HappyValleyKennels.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="HappyValleyKennels.home" %>

<%@ Register Src="~/controls/ReservationStartingToday.ascx" TagPrefix="uc1" TagName="ReservationStartingToday" %>
<%@ Register Src="~/controls/CustomerHomePage.ascx" TagPrefix="uc2" TagName="CustomerHomePage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/home.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <div id="mainContentCustomer" class="content">
        <uc2:CustomerHomePage runat="server" ID="CustomerHomePage" />
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="summary" runat="server">
    <div id="mainContentEmployee" class="content">
         <div id="customerInformation">
            <h3>Search Customer</h3>
             <hr />
             <div id="nameSearchBlock" class="blocks">
                 <asp:Label ID="lblNameSearch" CssClass="labels" runat="server" Text="Customer Name"></asp:Label>
                 <asp:TextBox ID="txtnNameSearch" CssClass="form-control" runat="server"></asp:TextBox>
             </div>
             <div id="petSearchBlock" class="blocks">
                 <asp:Label ID="lblPetSearch" CssClass="labels" runat="server" Text="Pet Name"></asp:Label>
                 <asp:TextBox ID="txtPetSearch" CssClass="form-control" runat="server"></asp:TextBox>
             </div>
             <div id="phoneSearchBlock" class="blocks">
                 <asp:Label ID="lblPhoneSearch" CssClass="labels" runat="server" Text="Phone Number"></asp:Label>
                 <asp:TextBox ID="txtPhoneSearch" CssClass="form-control" runat="server"></asp:TextBox>
             </div>
              <div id="startSearchBlock" class="blocks">
                        <asp:Label ID="lblStartSearch" CssClass="labels" runat="server" Text="Start Date"></asp:Label>
                        <asp:TextBox ID="txtStartSearch" runat="server" CssClass="datePicker form-control dateUI" />
                    </div>
              <div id="endSearchBlock" class="blocks">
                        <asp:Label ID="lblEndSearch" CssClass="labels" runat="server" Text="End Date"></asp:Label>
                        <asp:TextBox ID="txtEndSearch" runat="server" CssClass="datePicker form-control dateUI" />
                    </div>
             <asp:Button ID="btnSearch" CssClass="btn btn-danger" runat="server" Text="Search" />
        </div>
        <asp:Panel ID="pnlStarting" CssClass="panels" runat="server">
           
            
            <uc1:ReservationStartingToday runat="server" ID="ReservationStartingToday" />
                
           </asp:Panel>        
    </div>

</asp:Content>