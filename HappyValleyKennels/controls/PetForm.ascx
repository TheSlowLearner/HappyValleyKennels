<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PetForm.ascx.cs" Inherits="HappyValleyKennels.controls.PetForm" %>
 <asp:Panel ID="petForm" runat="server">
        <h1>
            <asp:Label ID="lblHeader" runat="server" Text="Add a Pet"></asp:Label>
        </h1>

        <asp:Panel ID="contentWrapper" runat="server">
        <%-- owner Information --%>
        <div id="customerInformation">
            <div id="ownerName">
                <span aria-hidden="true" class="glyphicon glyphicon-user"></span>
                <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
            </div>
            <div id="ownerEmail">
                <span aria-hidden="true" class="glyphicon glyphicon-envelope"></span>
                <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
            </div>
            <div id="ownerPhone">
                <span aria-hidden="true" class="glyphicon glyphicon-earphone"></span>
                <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
            </div>
        </div>

          <%-- Validation Summary --%>
        <asp:ValidationSummary CssClass="validationSummary" DisplayMode="List" runat="server" />
        

        <h3>Pet Information</h3>
        <hr />

        <%-- Pet Name --%>
        <div id="blockName" class="blocks">
            <asp:Label ID="lblPetName" CssClass="labels" runat="server" Text="*Name">
                <asp:RequiredFieldValidator ID="valRequiredName" runat="server" ErrorMessage="*Please enter a pet name" CssClass="errors" Text="*" ControlToValidate="txtPetName" EnableClientScript="False"></asp:RequiredFieldValidator>
            </asp:Label>
            <asp:TextBox CssClass=" form-control" MaxLength="25" ID="txtPetName" runat="server"></asp:TextBox>
        </div>

          <%-- Gender --%>
        <div id="genderBlock" class="blocks">
            <asp:Label ID="lblGender" runat="server" Text="*Gender">
                <asp:RequiredFieldValidator ID="valRequiredGender" runat="server" EnableClientScript="false" ErrorMessage="*Please select a pet gender" Text="*" CssClass="errors" ControlToValidate="rblGender">*</asp:RequiredFieldValidator>
            </asp:Label>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="radioGroups" ID="rblGender" runat="server">
                <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                <asp:ListItem Text="Female" Value="F">Female</asp:ListItem>
            </asp:RadioButtonList>
        </div>

          <%-- Size --%>
        <div id="sizeBlock" class="blocks">
            <asp:Label ID="lblSize" runat="server" Text="Size"></asp:Label>
            <asp:RadioButtonList ID="rblSize" CssClass="radioGroups" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server">
                <asp:ListItem Value="S" Text="Small"></asp:ListItem>
                <asp:ListItem Value="M" Text="Medium"></asp:ListItem>
                <asp:ListItem Value="L" Text="Large"></asp:ListItem>
            </asp:RadioButtonList>
        </div>

          <%-- Spayed --%>
        <div id="spayedBlock" class="blocks">
            <asp:Label ID="lblFixed" CssClass="labels" runat="server" Text="">
                <asp:CustomValidator runat="server" ID="CheckBoxRequired" Text="*" CssClass="errors" ErrorMessage="*Please select that the pet is spayed/neutered" EnableClientScript="false" OnServerValidate="CheckBoxRequired_ServerValidate"></asp:CustomValidator>
                <asp:CheckBox ID="chkFixed" Text="*Spayed/neutered" TextAlign="Left" runat="server" />
            </asp:Label>
        </div>


          <%-- Breed --%>
        <div id="blockBreed" class="blocks">
            <asp:Label ID="lblBreed" CssClass="labels" runat="server" Text="Breed"></asp:Label>
            <asp:TextBox CssClass=" form-control" ID="txtBreed" MaxLength="50" runat="server"></asp:TextBox>
        </div>

          <%-- Birthdate --%>
        <div id="blockBirthdate" class="blocks">
            <asp:Label ID="lblBirthday" CssClass="labels" runat="server" Text="Birthday">
                <asp:CustomValidator ID="valCheckBirthdate" runat="server" OnServerValidate="valCheckDate_ServerValidate" ErrorMessage="*Pet birthdate must be a date and less than 30 years olds" EnableClientScript="False" ControlToValidate="txtBirthdate" Text="*" CssClass="errors" Display="Dynamic"></asp:CustomValidator>
                <asp:CustomValidator ID="valCheckBirthdateDateRange" runat="server" ErrorMessage="*Birthdate cannot be in the future" Text="*" OnServerValidate="valCheckBirthdateDateRange_ServerValidate" EnableClientScript="false" CssClass="errors" ControlToValidate="txtBirthdate" Display="Dynamic"></asp:CustomValidator>
                 </asp:Label>
            <asp:TextBox ID="txtBirthdate" placeholder="mm/dd/yyyy" runat="server" CssClass="datePicker  dateUI form-control " />
        </div>

         <%-- Notes --%>
        <div id="blockNotes" class="blocks">
            <asp:Label ID="lblNotes" CssClass="labels" runat="server" Text="Special Notes"></asp:Label>
        </div>
        <p>
            <asp:TextBox CssClass=" form-control" MaxLength="200" ID="txtNotes" TextMode="MultiLine" runat="server"></asp:TextBox>
        </p>
        
          <%-- Vaccinations --%>
        <div id="blockVaccinations" class="blocks">
            <h3>Vaccinations</h3>
            <hr />
            <div id="vac" class="labels">

                  <%-- Bordetella --%>
                <div id="blockBordetella" class="vaccBlocks">
                    <h4>
                      <asp:CustomValidator ID="valCheckBordetellaDate" runat="server" OnServerValidate="valCheckDate_ServerValidate" ErrorMessage="*Bordetella expiry date must be a date" EnableClientScript="False" ControlToValidate="txtDateBordetella" Text="*" CssClass="errors" Display="Dynamic"></asp:CustomValidator>
                        Bordetella</h4>
                    <p>
                        <asp:Label ID="lblExpires2" CssClass="VaccLabels expiresLabel" runat="server" Text="Expires ">
                        </asp:Label>
                        <asp:TextBox placeholder="mm/dd/yyyy" CssClass="vaccFields datePicker  dateUI form-control " ID="txtDateBordetella" runat="server"></asp:TextBox>
                    </p>
                    <asp:CheckBox ID="chkBordetellaVerified" Text="Verified" TextAlign="Left" runat="server" />
                </div>

                  <%-- Distemper --%>
                <div id="blockDistemper" class="vaccBlocks  rightColVaccs">
                    <h4>
                      <asp:CustomValidator ID="valCheckDistemperDate" runat="server" OnServerValidate="valCheckDate_ServerValidate" ErrorMessage="*Distemper expiry date must be a date" EnableClientScript="False" ControlToValidate="txtDateDistemper" Text="*" CssClass="errors" Display="Dynamic"></asp:CustomValidator>
                        Distemper
                    </h4>
                    <p>
                        <asp:Label ID="lblExpires4" CssClass="VaccLabels expiresLabel" runat="server" Text="Expires "></asp:Label>
                        <asp:TextBox placeholder="mm/dd/yyyy" CssClass="vaccFields datePicker  dateUI form-control " ID="txtDateDistemper" runat="server"></asp:TextBox>
                    </p>
                    <asp:CheckBox ID="chkDistemperVerified" Text="Verified" TextAlign="Left" runat="server" />
                </div>

                  <%-- Hepatitis --%>
                <div id="blockHepatitis" class="vaccBlocks">
                    <h4>
                      <asp:CustomValidator ID="valCheckHepatitisDate" runat="server" OnServerValidate="valCheckDate_ServerValidate" ErrorMessage="*Hepatitis expiry date must be a date" EnableClientScript="False" ControlToValidate="txtDateHepatitis" Text="*" CssClass="errors" Display="Dynamic"></asp:CustomValidator>
                        Hepatitis</h4>
                    <p>
                        <asp:Label ID="lblExpires5" CssClass="VaccLabels expiresLabel" runat="server" Text="Expires "></asp:Label>
                        <asp:TextBox placeholder="mm/dd/yyyy" CssClass="vaccFields datePicker dateUI form-control " ID="txtDateHepatitis" runat="server"></asp:TextBox>
                    </p>
                    <asp:CheckBox ID="chkHepatitisVerified"  Text="Verified" TextAlign="Left" runat="server" />
                </div>

                  <%-- Parainfluenza --%>
                <div id="blockParainfluenza" class="vaccBlocks  rightColVaccs">
                    <h4>
                      <asp:CustomValidator ID="valCheckParainfluenzaDate" runat="server" OnServerValidate="valCheckDate_ServerValidate" ErrorMessage="*Parainfluenza expiry date must be a date" EnableClientScript="False" ControlToValidate="txtDateParainfluenza" Text="*" CssClass="errors" Display="Dynamic"></asp:CustomValidator>
                        Parainfluenza</h4>
                    <p>
                        <asp:Label ID="lblExpires3" CssClass="VaccLabels expiresLabel" runat="server" Text="Expires "></asp:Label>
                        <asp:TextBox placeholder="mm/dd/yyyy" CssClass="vaccFields datePicker  dateUI form-control " ID="txtDateParainfluenza" runat="server"></asp:TextBox>
                    </p>
                    <asp:CheckBox ID="chkParainfluenzaVerified"  Text="Verified" TextAlign="Left" runat="server" />
                </div>

                  <%-- Parovirus --%>
                <div id="blockParovirus" class="vaccBlocks">
                    <h4>
                      <asp:CustomValidator ID="valCheckParovirusDate" runat="server" OnServerValidate="valCheckDate_ServerValidate" ErrorMessage="*Parovirus expiry date must be a date" EnableClientScript="False" ControlToValidate="txtDateParovirus" Text="*" CssClass="errors" Display="Dynamic"></asp:CustomValidator>
                        Parovirus</h4>
                    <p>
                        <asp:Label ID="lblExpires6" CssClass="VaccLabels expiresLabel" runat="server" Text="Expires "></asp:Label>
                        <asp:TextBox placeholder="mm/dd/yyyy" CssClass="vaccFields datePicker dateUI form-control " ID="txtDateParovirus" runat="server"></asp:TextBox>
                    </p>
                    <asp:CheckBox ID="chkParovirusVerified"  Text="Verified" TextAlign="Left" runat="server" />
                </div>

                  <%-- Rabies --%>
                <div id="blockRabies" class="vaccBlocks rightColVaccs">
                    <h4>
                      <asp:CustomValidator ID="valCheckRabiesDate" runat="server" OnServerValidate="valCheckDate_ServerValidate" ErrorMessage="*Rabies expiry date must be a date" EnableClientScript="False" ControlToValidate="txtDateRabies" Text="*" CssClass="errors" Display="Dynamic"></asp:CustomValidator>
                        Rabies</h4>
                    <p>
                        <asp:Label ID="lblExpires1" CssClass="VaccLabels expiresLabel" runat="server" Text="Expires "></asp:Label>
                        <asp:TextBox placeholder="mm/dd/yyyy" CssClass="vaccFields datePicker dateUI form-control " ID="txtDateRabies" runat="server"></asp:TextBox>
                    </p>
                    <asp:CheckBox ID="chkRabiesVerified" Text="Verified" TextAlign="Left" runat="server" />
                </div>
            </div>
        </div>
             </asp:Panel>
          <%-- Buttons --%>
        <div id="blockButtons">
            <asp:Button ID="btnAddPet" CssClass="createButtons btn" runat="server" Text="Add Pet" OnClick="btnAddPet_Click" />
            <asp:Button ID="btnUpdatePet" CssClass="createButtons btn" runat="server" Text="Update Information" OnClick="btnUpdatePet_Click" />
            <asp:Button ID="btnEdit" runat="server" CssClass="secondaryButtons" Text="Edit" OnClick="btnEdit_Click" />
            <asp:Button ID="btnAddNewPet" CssClass="createButtons btn" runat="server" Text="Add New Pet" OnClick="btnAddNewPet_Click" />
            <asp:Button ID="btnCancel" runat="server" CssClass="secondaryButtons" Text="Cancel" OnClick="btnCancel_Click" />
        </div>
            <asp:Label ID="lblRequiredInfo" Text="* = Required Fields" runat="server"></asp:Label>
      
    </asp:Panel>