using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronManhvkBLL;

namespace HappyValleyKennels.controls
{
    public partial class PetForm : System.Web.UI.UserControl
    {
        public Owner owner { get; set; }
        public Boolean makingReservation { get; set; }
        public Pet  pet { get; set; }
        public User newUser { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            checkUserType();
            if(Session["Pet"] == null)
            {
                enableFields();
                displayCreateButtons();
            }
            else
            {
                pet = (Pet)Session["Pet"];
                displayUpdateButtons();
            }
            if(Session["Owner"]!= null)
            {
                owner = (Owner)Session["Owner"];
                populateOwnerInformation();
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            Session["Pet"] = pet;
            if(pet != null)
            {
                enableFields();
                displayUpdateButtons();
            }
            else
            {
                displayCreateButtons();
            }
        }

        public void initializePage()
        {
            Page.Title = "Manage Pet";
            
            //display general information
            lblName.Text = owner.ownerFirstName + " " + owner.ownerLastName;
            lblEmail.Text = owner.ownerEmail;
            lblPhone.Text = owner.ownerPhone;

        }

        public void checkUserType()
        {
                if (newUser.user == userType.Client)
                {
                    disableVerification();
                    hideVerification();
                }
                else if (newUser.user == userType.Clerk)
                {
                    if (owner.ownerPet.Count == 0)
                    {
                        
                        displayForm();
                    }
                    else
                    {
                        if (makingReservation == false)
                        {
                            displayPetList();
                        }
                    }
                    showVerification();
                    enableVerification();
                    lblHeader.Visible = false;
                }
        }

        public void checkOwnerSession()
        {

            if (Session["Owner"] != null)
            {

                owner = (Owner)Session["Owner"];

                if (owner.ownerPet.Count != 0)
                {
                    checkSavedReservationProgress();
                }
                else
                {
                    displayForm();
                }
            }
        }

        public void checkSavedReservationProgress()
        {
            if (Session["MakingReservation"] != null)
            {
                makingReservation = (Boolean)Session["MakingReservation"];

                if (makingReservation == true)
                {
                    displayForm();
                }
            }
            else
            {
                displayPetList();
            }
        }

        public void fillInformation()
        {
            rblGender.SelectedValue = pet.petGender.ToString();
            setSize(pet);
            setNeutered(pet.petFixed);
            txtPetName.Text = pet.petName;
            txtBreed.Text = pet.petBreed;
            txtBirthdate.Text = pet.petBirthdate.ToShortDateString();
            txtNotes.Text = pet.petSpecialNotes;

            txtDateBordetella.Text = getVaccinationExpiryDate(pet, "Bordetella");
            txtDateDistemper.Text = getVaccinationExpiryDate(pet, "Distemper");
            txtDateHepatitis.Text = getVaccinationExpiryDate(pet, "Hepatitis");
            txtDateParainfluenza.Text = getVaccinationExpiryDate(pet, "Parainfluenza");
            txtDateParovirus.Text = getVaccinationExpiryDate(pet, "Parovirus");
            txtDateRabies.Text = getVaccinationExpiryDate(pet, "Rabies");
        }

        public String getVaccinationExpiryDate(Pet currentPet, String vaccination)
        {
            String expiryDate = "";
            for (int i = 0; i < currentPet.petVaccination.Count; i++)
            {
                if (currentPet.petVaccination.ElementAt(i).vaccinationName == vaccination)
                {
                    expiryDate = currentPet.petVaccination.ElementAt(i).vaccinationExpiryDate.ToShortDateString();
                }

            }
            return expiryDate;
        }

        public void setSize(Pet pet)
        {
            if (pet.petSize != ' ')
            {
                rblSize.SelectedValue = pet.petSize.ToString();
            }
        }

        public void setNeutered(char fix)
        {
            if (fix == 'Y')
            {
                chkFixed.Checked = true;
            }
        }

        public void disableDatePicker()
        {
            txtBirthdate.ReadOnly = true;
            txtBirthdate.CssClass = txtBirthdate.CssClass.Replace("dateUI", "readOnly");

            txtDateRabies.ReadOnly = true;
            txtDateRabies.CssClass = txtDateRabies.CssClass.Replace("dateUI", "readOnly");

            txtDateBordetella.ReadOnly = true;
            txtDateBordetella.CssClass = txtDateBordetella.CssClass.Replace("dateUI", "readOnly");

            txtDateDistemper.ReadOnly = true;
            txtDateDistemper.CssClass = txtDateDistemper.CssClass.Replace("dateUI", "readOnly");

            txtDateParainfluenza.ReadOnly = true;
            txtDateParainfluenza.CssClass = txtDateParainfluenza.CssClass.Replace("dateUI", "readOnly");

            txtDateParovirus.ReadOnly = true;
            txtDateParovirus.CssClass = txtDateParovirus.CssClass.Replace("dateUI", "readOnly");

            txtDateHepatitis.ReadOnly = true;
            txtDateHepatitis.CssClass = txtDateHepatitis.CssClass.Replace("dateUI", "readOnly");
        }

        public void enableDatePicker()
        {
            txtBirthdate.ReadOnly = false;
            txtBirthdate.CssClass = txtBirthdate.CssClass.Replace("readOnly", "dateUI");

            txtDateRabies.ReadOnly = false;
            txtDateRabies.CssClass = txtDateRabies.CssClass.Replace("readOnly", "dateUI");

            txtDateBordetella.ReadOnly = false;
            txtDateBordetella.CssClass = txtDateBordetella.CssClass.Replace("readOnly", "dateUI");

            txtDateDistemper.ReadOnly = false;
            txtDateDistemper.CssClass = txtDateDistemper.CssClass.Replace("readOnly", "dateUI");

            txtDateParainfluenza.ReadOnly = false;
            txtDateParainfluenza.CssClass = txtDateParainfluenza.CssClass.Replace("readOnly", "dateUI");

            txtDateParovirus.ReadOnly = false;
            txtDateParovirus.CssClass = txtDateParovirus.CssClass.Replace("readOnly", "dateUI");

            txtDateHepatitis.ReadOnly = false;
            txtDateHepatitis.CssClass = txtDateHepatitis.CssClass.Replace("readOnly", "dateUI");
        }

        public void disableFields()
        {
            contentWrapper.Enabled = false;
            txtPetName.CssClass += " readOnly";
            txtBreed.CssClass += " readOnly";
            txtNotes.CssClass += " readOnly";
            disableDatePicker();
            btnCancel.Text = "Back";
        }

        public void enableFields()
        {
            contentWrapper.Enabled = true;
            txtPetName.CssClass = txtPetName.CssClass.Replace("readOnly", "");
            txtBreed.CssClass = txtBreed.CssClass.Replace("readOnly", "");
            txtNotes.CssClass = txtNotes.CssClass.Replace("readOnly", "");
            enableDatePicker();
        }

        public void displayPetList()
        {
            ContentPlaceHolder content = (ContentPlaceHolder)Page.Master.FindControl("content");
            PetList petList = (PetList)content.FindControl("PetList");
            petList.Visible = true;
            Panel mainContent = content.FindControl("mainContent") as Panel;
            mainContent.CssClass += " contentPetList";
            this.Visible = false;
        }

        public void displayForm()
        {
            ContentPlaceHolder content = (ContentPlaceHolder)Page.Master.FindControl("content");
            PetList petList = (PetList)content.FindControl("PetList");
            petList.Visible = false;
            Panel mainContent = content.FindControl("mainContent") as Panel;
            mainContent.CssClass = mainContent.CssClass.Replace("contentPetList", "");
            this.Visible = true;
        }

        public void hideVerification()
        {
            chkBordetellaVerified.Visible = false;
            chkDistemperVerified.Visible = false;
            chkHepatitisVerified.Visible = false;
            chkParainfluenzaVerified.Visible = false;
            chkParovirusVerified.Visible = false;
            chkRabiesVerified.Visible = false;
        }

        public void showVerification()
        {
            chkBordetellaVerified.Visible = true;
            chkDistemperVerified.Visible = true;
            chkHepatitisVerified.Visible = true;
            chkParainfluenzaVerified.Visible = true;
            chkParovirusVerified.Visible = true;
            chkRabiesVerified.Visible = true;
        }

        public void enableVerification()
        {
            chkBordetellaVerified.Enabled = true;
            chkDistemperVerified.Enabled = true;
            chkHepatitisVerified.Enabled = true;
            chkParainfluenzaVerified.Enabled = true;
            chkParovirusVerified.Enabled = true;
            chkRabiesVerified.Enabled = true;
        }

        public void disableVerification()
        {
            chkBordetellaVerified.Enabled = false;
            chkDistemperVerified.Enabled = false;
            chkHepatitisVerified.Enabled = false;
            chkParainfluenzaVerified.Enabled = false;
            chkParovirusVerified.Enabled = false;
            chkRabiesVerified.Enabled = false;
        }

        public void clear()
        {
            rblGender.ClearSelection();
            rblSize.ClearSelection();
            chkFixed.Checked = false;
            txtPetName.Text = "";
            txtBreed.Text = "";
            txtNotes.Text = "";
            txtBirthdate.Text = "";
            txtDateBordetella.Text = "";
            txtDateDistemper.Text = "";
            txtDateHepatitis.Text = "";
            txtDateParainfluenza.Text = "";
            txtDateRabies.Text = "";
            txtDateParovirus.Text = "";
        }

        public void registerPetInformation()
        {
            //create new pet
            Pet newPet = savePetInformation();
            addVaccinations(newPet);
            Session["Owner"] = owner;
        }

        public Pet savePetInformation()
        {
            DateTime birthdate = DateTime.MinValue;

            if (txtBirthdate.Text != "")
            {
                birthdate = Convert.ToDateTime(txtBirthdate.Text);
            }
            Pet newPet = null;
            if (pet == null)
            {
                newPet = new Pet(1000, txtPetName.Text, Convert.ToChar(rblGender.SelectedValue), getFixedStatus(), owner.ownerNumber, txtBreed.Text, birthdate, getPetSize(), txtNotes.Text);
            }
            else
            {
                newPet = new Pet(pet.petNumber, txtPetName.Text, Convert.ToChar(rblGender.SelectedValue), getFixedStatus(), owner.ownerNumber, txtBreed.Text, birthdate, getPetSize(), txtNotes.Text);
            }

            if (owner.ownerPet.Count == 0)
            {
                owner.ownerPet.Add(newPet);
            }
            else
            {
                overwritePet(newPet);
                addPet(newPet);
            }

            return newPet;
        }

        private void addPet(Pet pet)
        {
            Boolean exists = false;
            for (int i = 0; i < owner.ownerPet.Count; i++)
            {
                Pet currentPet = owner.ownerPet.ElementAt(i);
                if(currentPet.petNumber == pet.petNumber)
                {
                    owner.ownerPet[i] = pet;
                    exists = true;
                }
            }

            if (!exists)
            {
                owner.ownerPet.Add(pet);
            }
        }

        private void overwritePet(Pet newPet)
        {
            for (int i = 0; i < owner.ownerPet.Count; i++)
            {
                Pet currentPet = owner.ownerPet.ElementAt(i);
                if(currentPet.petNumber == newPet.petNumber)
                {
                    owner.ownerPet[i] = newPet;
                }
            }
        }

        public char getPetSize()
        {
            char size = ' ';
            if (rblSize.SelectedIndex > -1)
            {
                if (rblSize.SelectedValue == "S")
                {
                    size = 'S';
                }
                else if (rblSize.SelectedValue == "M")
                {
                    size = 'M';
                }
                else
                {
                    size = 'L';
                }
            }
            return size;
        }

        public char getFixedStatus()
        {
            if (chkFixed.Checked) { return 'Y'; }
            else { return 'N'; }
        }

        public void addVaccinations(Pet pet)
        {
            if (txtDateBordetella.Text != "")
            {
                pet.petVaccination.Add(new Vaccination(1, "Bordetella", Convert.ToDateTime(txtDateBordetella.Text)));
            }

            if (txtDateDistemper.Text != "")
            {
                pet.petVaccination.Add(new Vaccination(2, "Distemper", Convert.ToDateTime(txtDateDistemper.Text)));
            }

            if (txtDateHepatitis.Text != "")
            {
                pet.petVaccination.Add(new Vaccination(3, "Hepatitis", Convert.ToDateTime(txtDateHepatitis.Text)));
            }

            if (txtDateParainfluenza.Text != "")
            {
                pet.petVaccination.Add(new Vaccination(4, "Parainfluenza", Convert.ToDateTime(txtDateParainfluenza.Text)));
            }

            if (txtDateParovirus.Text != "")
            {
                pet.petVaccination.Add(new Vaccination(5, "Parovirus", Convert.ToDateTime(txtDateParovirus.Text)));

            }

            if (txtDateRabies.Text != "")
            {
                pet.petVaccination.Add(new Vaccination(6, "Rabies", Convert.ToDateTime(txtDateRabies.Text)));
            }
        }


        protected void btnAddNewPet_Click(object sender, EventArgs e)
        {
            enableFields();
            clear();
            displayForm();

            //change div header
            btnAddPet.Text = "Add Pet";
            lblHeader.Text = "Add a Pet";

            //enabled buttons
            displayCreateButtons();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            enableFields();

            //change div header and button text
            lblHeader.Text = "Update Pet Information";

            //disabled buttons
            displayUpdateButtons();
        }

        protected void btnAddPet_Click(object sender, EventArgs e)
        {
            if (valid())
            {

                if (owner.ownerPet.Count == 0)
                {
                    registerPetInformation();
                    Server.Transfer("./ManageReservation.aspx");
                }
                else
                {
                    registerPetInformation();
                    if (makingReservation == true)
                    {
                        Server.Transfer("./ManageReservation.aspx");
                    }
                    displayPetList();
                }
            }
        }

        protected void btnUpdatePet_Click(object sender, EventArgs e)
        {
            if (valid())
            {
                registerPetInformation();
                disableFields();
                Session["Pet"] = null;
                displayPetList();
                displayEditButtons();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            disableFields();
            displayEditButtons();
            displayPetList();
        }

        protected Boolean valid()
        {
            Page.Validate();
            if (Page.IsValid)
            {
                return true;
            }
            return false;
        }

        protected void CheckBoxRequired_ServerValidate(object sender, ServerValidateEventArgs args)
        {
            if (chkFixed.Checked)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void valCheckDate_ServerValidate(object sender, ServerValidateEventArgs args)
        {
            if (args.Value != String.Empty)
            {
                try
                {
                    DateTime date = Convert.ToDateTime(args.Value);

                    if (date < DateTime.Now.AddYears(-30))
                    {
                        args.IsValid = false;
                    }
                    else
                    {
                        args.IsValid = true;
                    }

                }
                catch
                {
                    args.IsValid = false;
                }
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void valCheckBirthdateDateRange_ServerValidate(object sender, ServerValidateEventArgs args)
        {
            try
            {
                DateTime date = Convert.ToDateTime(txtBirthdate.Text);
                if (date > DateTime.Now.AddDays(-1))
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
            catch
            {
                args.IsValid = false;
            }
        }

        protected void btnListAllPets_Click(object sender, EventArgs e)
        {
            Session["CheckingOwnerPet"] = null;
        }

        private void displayEditButtons()
        {
            btnEdit.Visible = true;
            btnCancel.Visible = true;
        }

        private void populateOwnerInformation()
        {
            lblName.Text = owner.ownerFirstName + " " + owner.ownerLastName;
            if (owner.ownerEmail != "")
            {
                lblEmail.Text = owner.ownerEmail;
            }
            else
            {
                lblEmail.Visible = false;
            }

            if (owner.ownerPhone != "")
            {
                lblPhone.Text = owner.ownerPhone;
            }
            else
            {
                lblPhone.Visible = false;
            }
        }

        private void displayCreateButtons()
        {
            btnUpdatePet.Visible = false;
            btnAddNewPet.Visible = false;
            btnAddPet.Visible = true;
            btnCancel.Visible = true;
        }
        private void displayUpdateButtons()
        {
            btnUpdatePet.Visible = true;
            btnCancel.Visible = false;
            btnAddNewPet.Visible = false;
            btnAddPet.Visible = false;
            btnEdit.Visible = false;
            btnCancel.Visible = true;
            btnCancel.Text = "Cancel";
        }
    }
}