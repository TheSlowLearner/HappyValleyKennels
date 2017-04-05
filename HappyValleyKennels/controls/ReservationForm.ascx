<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReservationForm.ascx.cs" Inherits="HappyValleyKennels.controls.ReservationForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
  
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>       
 <asp:Panel ID="mainInformation" runat="server">
            <h1>
                <asp:Label ID="lblHeader" runat="server" Text="Make a Reservation"></asp:Label>
            </h1>
            <%-- Customer Information --%>
            <div id="customerInformation">
                <div id="customerName">
                    <asp:Label ID="lblName" runat="server" Text=""> <span aria-hidden="true" class="glyphicon glyphicon-user"></span></asp:Label>
                </div>

                <div id="customerEmail">
                    <asp:Label ID="lblEmail" runat="server" Text=""><span aria-hidden="true" class="glyphicon glyphicon-envelope"></span></asp:Label>
                </div>

                <div id="customerPhone">
                    <asp:Label ID="lblPhone" runat="server" Text=""><span aria-hidden="true" class="glyphicon glyphicon-earphone"></span></asp:Label>
                </div>
            </div>

            <asp:ValidationSummary ID="ValidationSummary1" CssClass="validationSummary" DisplayMode="List" runat="server" />

            <%-- Reservation Dates --%>
            <div id="dateBlock" class="blocks">
                <h3>Reservation Dates

                </h3>
                <hr />
                <div id="startBlock" class="dateBlocks">
                    <asp:Label ID="lblStartDate" CssClass="labels dateLabels" runat="server" Text="*Start Date">
                        <asp:RequiredFieldValidator ID="valStartDateRequired" runat="server" ErrorMessage="*Please enter a start date" CssClass="errors" Text="*" Display="Dynamic" Font-Overline="False" EnableClientScript="False" ControlToValidate="txtStartDate"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="valCompareStartEndDates" runat="server" ErrorMessage="*The start date cannot be after the end date" Display="Dynamic" CssClass="errors" Text="*" EnableClientScript="False" OnServerValidate="valCompareStartEndDates_ServerValidate" ControlToValidate="txtStartDate"></asp:CustomValidator>
                        <asp:CustomValidator ID="valStartDateFormat" runat="server" ErrorMessage="*The start date must be a date" Display="Dynamic" Text="*" CssClass="errors" EnableClientScript="false" ControlToValidate="txtStartDate" OnServerValidate="valDateFormat_ServerValidate"></asp:CustomValidator>
                        <asp:CustomValidator ID="valStartDateFuture" runat="server" ErrorMessage="*The start date cannot be in the past" Display="Dynamic" CssClass="errors" Text="*" EnableClientScript="false" ControlToValidate="txtStartDate" OnServerValidate="valStartDateFuture_ServerValidate"></asp:CustomValidator>
                    </asp:Label>
                    <asp:TextBox placeholder="mm/dd/yyyy" CssClass="form-control dateBoxes dateUI" ID="txtStartDate" runat="server"></asp:TextBox>
                </div>

                <div id="endBlock" class="dateBlocks">
                    <asp:Label ID="lblEndDate" CssClass="labels dateLabels" runat="server" Text="*End Date">
                        <asp:RequiredFieldValidator ID="valEndDateRequired" runat="server" ErrorMessage="*Please enter a end date" CssClass="errors" Text="*" Display="Dynamic" Font-Overline="False" EnableClientScript="False" ControlToValidate="txtEndDate"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="valEndDateFormat" runat="server" ErrorMessage="The end date must be a date" Display="Dynamic" Text="*" CssClass="errors" EnableClientScript="false" ControlToValidate="txtEndDate" OnServerValidate="valDateFormat_ServerValidate"></asp:CustomValidator>
                    </asp:Label>
                    <asp:TextBox placeholder="mm/dd/yyyy" CssClass=" form-control dateBoxes dateUI" ID="txtEndDate"  runat="server" ></asp:TextBox>
                </div>

            </div>

            <%-- Pets and Services --%>
            <div id="serviceTable" class="blocks">
                <h3>
                    Pets and Services</h3>
                <hr />
                <asp:UpdatePanel ID="accordionUpdatePanel" runat="server">
                    <ContentTemplate>
                        <ajaxToolkit:Accordion ID="ServiceAccordion" runat="server" CssClass="accordion" HeaderCssClass="headerClass" ContentCssClass="contentClass" HeaderSelectedCssClass="headerSelected">
                        </ajaxToolkit:Accordion>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <%-- Buttons --%>
            <div id="blockButtons">
                <asp:Button ID="btnMakeRes" CssClass="createButtons btn" runat="server" Text="Make Reservation" OnClick="btnMakeRes_Click" />
                <asp:Button ID="btnUpdateRes" CssClass="createButtons btn" runat="server" Text="Update Reservation" OnClick="btnUpdateRes_Click" />
                <asp:Button ID="btnAddPet" CssClass="secondaryButtons" runat="server" Text="Add Pet" OnClick="btnAddPet_Click" />
                <asp:Button ID="btnEdit" CssClass="secondaryButtons" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                <asp:Button ID="btnCancel" CssClass="secondaryButtons" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
</asp:Panel>