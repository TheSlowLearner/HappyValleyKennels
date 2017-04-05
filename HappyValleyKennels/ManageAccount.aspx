<%@ Page Title="" Language="C#" MasterPageFile="~/HappyValleyKennels.Master" AutoEventWireup="true" CodeBehind="ManageAccount.aspx.cs" Inherits="HappyValleyKennels.ManageAccount" %>
<%@ Reference Control="~/controls/OwnerList.ascx" %>
<%@ Register Src="~/controls/OwnerList.ascx" TagPrefix="uc1" TagName="OwnerList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="styles/ManageAccount.css" rel="stylesheet" />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="content">
    <div id="mainContent" class="content">
        <h1>
            <asp:Label ID="lblHeader" runat="server" Text="Create Account"></asp:Label>
        </h1>
        <asp:ValidationSummary runat="server" CssClass="validationSummary" DisplayMode="List"></asp:ValidationSummary>
        <asp:Panel ID="wrapper" runat="server">
            <h3>Owner</h3>
            <hr />

             <%-- Owner Main Information --%>
            <div id="blockFirst" class="blocks">

                <asp:Label ID="lblFirst" CssClass="labels" runat="server" Text="*First Name">
                     <%-- First Name Validation --%>
                    <asp:RequiredFieldValidator ID="valRequiredFirstName" runat="server" ControlToValidate="txtFirst" CssClass="errors" Display="Dynamic" ErrorMessage="*Please enter a first name" EnableClientScript="False" Text=" *"> *</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="valFirstNameFormat" runat="server" ControlToValidate="txtFirst" CssClass="errors" Display="Dynamic" ErrorMessage="*First name is not in a valid format" ValidationExpression="^\b[A-Za-z-'\s.]*\b$" EnableClientScript="False" Text=" *"> *</asp:RegularExpressionValidator>
                </asp:Label>
                <asp:TextBox ID="txtFirst" runat="server" CssClass="form-control" MaxLength="25"></asp:TextBox>
            </div>
            <div id="blockLast" class="blocks">
                <asp:Label ID="lblLast" CssClass="labels" runat="server" Text="*Last Name">
                     <%-- Last Name Validation --%>
                    <asp:RequiredFieldValidator ID="valRequiredLastName0" runat="server" ControlToValidate="txtLast" CssClass="errors" Display="Dynamic" ErrorMessage="*Please enter a last name" EnableClientScript="False"> *</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="valLastNameFormat0" runat="server" ControlToValidate="txtLast" CssClass="errors" Display="Dynamic" EnableClientScript="false" ErrorMessage="*Last name is not in a valid format" ValidationExpression="^\b[A-Za-z-'\s.]*\b$"> *</asp:RegularExpressionValidator>

                </asp:Label>
                <asp:TextBox ID="txtLast" runat="server" CssClass="form-control" MaxLength="25"></asp:TextBox>
            </div>

            <div id="blockStreet" class="blocks">
                <asp:Label ID="lblStreet" CssClass="labels" runat="server" Text="Street">
                     <%-- Street Validation --%>
                    <asp:CustomValidator ID="valCheckAddressStreet" runat="server" ErrorMessage="*Please enter a street" Display="Dynamic" OnServerValidate="valCheckAddressStreet_ServerValidate" Text=" *" EnableClientScript="false" ControlToValidate="txtStreet" CssClass="errors" ValidateEmptyText="True"> *</asp:CustomValidator>
                </asp:Label>
                <asp:TextBox ID="txtStreet" runat="server" CssClass="form-control" MaxLength="40"></asp:TextBox>
            </div>

            <div id="blockCity" class="blocks">
                <asp:Label ID="lblCity" CssClass="labels" runat="server" Text="City">
                     <%-- City Validation --%>
                    <asp:CustomValidator ID="valCheckAddressCity" runat="server" ErrorMessage="*Please enter a city" EnableClientScript="false" Display="Dynamic" OnServerValidate="valCheckAddressCity_ServerValidate" Text="*" ControlToValidate="txtCity" CssClass="errors" ValidateEmptyText="True"> *</asp:CustomValidator>
                    <asp:RegularExpressionValidator ID="valCityFormat" runat="server" ControlToValidate="txtCity" EnableClientScript="false" CssClass="errors" Display="Dynamic" ErrorMessage="*City is not in a valid format" ValidationExpression="^\b[A-Za-z-'\s.]*\b$" BorderColor="Transparent"> *</asp:RegularExpressionValidator>
                </asp:Label>
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" MaxLength="25"></asp:TextBox>
            </div>

            <div id="blockProv" class="blocks">
                <asp:Label ID="lblProvince" CssClass="labels" runat="server" Text="Province">
                       <%-- Province Validation --%>
                    <asp:CustomValidator ID="valCheckAddressProvince" runat="server" ErrorMessage="*Please select a province" Display="Dynamic" OnServerValidate="valCheckAddressProvince_ServerValidate" EnableClientScript="false" Text="*" ControlToValidate="ddlProvince" CssClass="errors" ValidateEmptyText="True"> *</asp:CustomValidator>

                </asp:Label>
                <asp:DropDownList ID="ddlProvince" CssClass="form-control" runat="server">
                    <asp:ListItem Selected="True" Value="">Select One</asp:ListItem>
                    <asp:ListItem Value="QC">Quebec</asp:ListItem>
                    <asp:ListItem Value="ON">Ontario</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div id="blockPostal" class="blocks">
                <asp:Label ID="lblPostal" CssClass="labels" runat="server" Text="Postal Code">
                       <%-- Postal Validation --%>
                    <asp:CustomValidator ID="valCheckAddressPostal" runat="server" ErrorMessage="*Please enter a postal code" Display="Dynamic" EnableClientScript="false" OnServerValidate="valCheckAddressPostal_ServerValidate" Text="*" ControlToValidate="txtPostal" CssClass="errors" ValidateEmptyText="True"> *</asp:CustomValidator>
                    <asp:RegularExpressionValidator ID="valPostalFormat" runat="server" ControlToValidate="txtPostal" CssClass="errors" Display="Dynamic" EnableClientScript="false" ErrorMessage="*Postal code is not in a valid format" ValidationExpression="^[A-Za-z]{1}[0-9]{1}[A-Za-z]{1}\s?[0-9]{1}[A-Za-z]{1}[0-9]$"> *</asp:RegularExpressionValidator>

                </asp:Label>
                <asp:TextBox ID="txtPostal" CssClass="form-control" MaxLength="7" runat="server"></asp:TextBox>
            </div>
            <div id="blockPhone" class="blocks" runat="server">
                <asp:Label ID="lblPhone" CssClass="labels" runat="server" Text="*Phone Number">
                       <%-- Phone Validation --%>
                    <asp:RegularExpressionValidator ID="valPhoneFormat" runat="server" ErrorMessage="*Phone number is not in a valid format" CssClass="errors" Display="Dynamic" ValidationExpression="^([0-9]{10})|([0-9]{3}\-[0-9]{3}\-[0-9]{4})$" Text="*" EnableClientScript="false" ControlToValidate="txtPhone"> *</asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="valPhoneRequiredClerk" CssClass="errors" runat="server" ErrorMessage="*Either an email or phone number is Required" OnServerValidate="valPhoneRequiredClerk_ServerValidate" ValidateEmptyText="True" Text="*" Display="Dynamic" ControlToValidate="txtPhone" EnableClientScript="False"> *</asp:CustomValidator>

                </asp:Label>
                <asp:TextBox ID="txtPhone" placeholder="999-999-9999" MaxLength="12" CssClass="phoneField form-control" runat="server"></asp:TextBox>
            </div>

            <div id="blockEmail" class="blocks" runat="server">
                <asp:Label ID="lblEmail" CssClass="labels" runat="server" Text="*Email">
                    <asp:RequiredFieldValidator ID="valEmailRequiredClient" runat="server" CssClass="errors" ErrorMessage="*Please enter an email" ControlToValidate="txtEmail" EnableClientScript="False"> *</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="valEmailRequireClerk" CssClass="errors" runat="server" EnableClientScript="false" ErrorMessage="*Either an email or phone number is Required" OnServerValidate="valEmailRequireClerk_ServerValidate" ValidateEmptyText="True" Display="Dynamic" ControlToValidate="txtEmail"> *</asp:CustomValidator>
                    <asp:RegularExpressionValidator ID="valEmailFormat" runat="server" EnableClientScript="false" ErrorMessage="*Email is not in a valid format" Display="Dynamic" CssClass="errors" Text="*" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> *</asp:RegularExpressionValidator>

                </asp:Label>
                <asp:TextBox ID="txtEmail" CssClass="form-control" MaxLength="50" runat="server"></asp:TextBox>
            </div>

            <div id="blockPassword" class="blocks">
                <asp:Label ID="lblPassword" CssClass="labels" runat="server" Text="*Password">
                       <%-- Password Validation --%>
                    <asp:RequiredFieldValidator ID="valPasswordRequired" runat="server" ErrorMessage="*Please enter a password" Display="Dynamic" CssClass="errors" EnableClientScript="False" ControlToValidate="txtPassword" Text="*"> *</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="valPasswordFormat" runat="server" ErrorMessage="*Password must be 8 characters" EnableClientScript="False" ValidationExpression="^.{8,}$" CssClass="errors" Display="Dynamic" ControlToValidate="txtPassword" Text="*"> *</asp:RegularExpressionValidator>

                </asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>
            <div class="blocks" id="blockConfirm">
                <asp:Label ID="lblConfirm" CssClass="labels" runat="server" Text="*Confirm Password">
                    <asp:RequiredFieldValidator ID="valConfirmRequired" runat="server" ErrorMessage="*Please confirm your password" EnableClientScript="False" Display="Dynamic" CssClass="errors" Text="*" ControlToValidate="txtConfirm"> *</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="valConfirmCompare" runat="server" ErrorMessage="*The confirmation password must match the password" Text="*" ControlToValidate="txtConfirm" ControlToCompare="txtPassword" Type="String" Display="Dynamic" CssClass="errors" EnableClientScript="False"> *</asp:CompareValidator>
                </asp:Label>
                <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>

             <%-- Emergency Contact Information--%>
            <h3>Emergency Contact</h3>
            <hr />
            <div id="blockEmergFirst" class="blocks">
                <asp:Label ID="lblEmergFirst" CssClass="labels" runat="server" Text="First Name">
                       <%-- Emerg First Validation --%>
                    <asp:RegularExpressionValidator ID="valEmergFirstFormat" runat="server" ControlToValidate="txtEmergFirst" CssClass="errors" Display="Dynamic" ErrorMessage="*Emergency first name is not in a valid format" ValidationExpression="^\b[A-Za-z-'\s.]*\b$" EnableClientScript="False">*</asp:RegularExpressionValidator>

                </asp:Label>
                <asp:TextBox ID="txtEmergFirst" MaxLength="25" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div id="blockEmergLast" class="blocks">
                <asp:Label ID="lblEmergLast" CssClass="labels" runat="server" Text="Last Name">
                       <%-- Emerg Last Validation --%>
                    <asp:RegularExpressionValidator ID="valEmergLastFormat" runat="server" ControlToValidate="txtEmergLast" CssClass="errors" Display="Dynamic" ErrorMessage="*Emergency last name is not in a valid format" ValidationExpression="^\b[A-Za-z-'\s.]*\b$" EnableClientScript="False">*</asp:RegularExpressionValidator>
                </asp:Label>
                <asp:TextBox ID="txtEmergLast" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div id="blockEmergPhone" class="blocks">
                <asp:Label ID="lblEmergPhone" CssClass="labels" runat="server" Text="Phone Number">
                       <%-- Emerg Phone Validation --%>
                    <asp:RegularExpressionValidator ID="valEmergPhoneNumber" runat="server" ErrorMessage="*Emergency phone number is not in a valid format" CssClass="errors" Display="Dynamic" EnableClientScript="false" ValidationExpression="^([0-9]{10})|([0-9]{3}\-[0-9]{3}\-[0-9]{4})$" Text="*" ControlToValidate="txtEmergPhone">*</asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="valCheckEmergPhone" runat="server" OnServerValidate="valEmergPhone_ServerValidate" ErrorMessage="*Please enter an emergency contact phone number" EnableClientScript="False" CssClass="errors" Display="Dynamic" Text="*"></asp:CustomValidator>
                </asp:Label>
                <asp:TextBox ID="txtEmergPhone" runat="server" MaxLength="12" placeholder="999-999-9999" CssClass="phoneField form-control"></asp:TextBox>
            </div>
        </asp:Panel>

         <%-- Buttons --%>
          <div id="blockButtons">
                <asp:Button ID="btnCreateAccount" CssClass="createButtons btn" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" />
                <asp:Button ID="btnUpdateOwner" CssClass="createButtons btn" runat="server" Text="Update Information" OnClick="btnUpdateOwner_Click" />
               <asp:Button ID="btnEdit" CssClass="secondaryButtons" CausesValidation="false" runat="server" Text="Edit" OnClick="btnEdit_Click" />
                <asp:Button ID="btnCancel" CausesValidation="false" CssClass="secondaryButtons" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
            <div>
                <asp:Label ID="lblReqInfo" runat="server" Text="* = Required Fields"></asp:Label>
                <br />
                <asp:Label ID="lblReqInfoPhoneEmail" runat="server" Text="** = Either Phone or Email Required"></asp:Label>
            </div>
    </div>
</asp:Content>

  <%-- Summary Content --%>
<asp:Content ID="Content3" ContentPlaceHolderID="summary" runat="server">
    <uc1:OwnerList runat="server" ID="OwnerList" />
</asp:Content>
