﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronManhvkBLL;
using AjaxControlToolkit;

namespace HappyValleyKennels.controls
{
    public partial class ReservationForm : System.Web.UI.UserControl
    {
        public Owner owner { get; set; }
        public Boolean makingReservation { get; set; }
        public Reservation savedReservation { get; set; }
        public User newUser { get; set; }
        public Reservation reservation { get; set; }
        public List<Reservation> reservations { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnUpdateRes.Visible = false;
            }
            checkOwnerSession();
            checkSavedReservationProgress();
            checkUserType();
            initializePage();
            addPetPanels();
        }

        private void checkReservation()
        {
            if (Session["Reservation"] != null)
            {
                reservation = (Reservation)Session["Reservation"];
                PetReservation petRes = new PetReservation();
                reservation.petReservation = petRes.getPetReservations(reservation.reservationNumber);
                if (newUser.user == userType.Clerk)
                {
                    addPetPanels();
                    populateOwnerInformation();
                }
                displayUpdateButtons();
            }
            else
            {
                displayCreateButtons();
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            checkOwnerSession();
            checkReservation();
        }

        public void displayReservationList()
        {
            ContentPlaceHolder content = (ContentPlaceHolder)Page.Master.FindControl("content");
            ReservationList resList = (ReservationList)content.FindControl("ReservationList");
            resList.Visible = true;
            Panel mainContent = content.FindControl("mainContent") as Panel;
            mainContent.CssClass += " contentResList";
            this.Visible = false;
        }

        public void displayForm()
        {
            ContentPlaceHolder content = (ContentPlaceHolder)Page.Master.FindControl("content");
            ReservationList resList = (ReservationList)content.FindControl("ReservationList");
            resList.Visible = false;
            Panel mainContent = content.FindControl("mainContent") as Panel;
            mainContent.CssClass = mainContent.CssClass.Replace("contentResList", "");
            this.Visible = true;
        }

        private void addPetPanels()
        {
            if (owner != null)
            {

                List<Pet> pets = owner.ownerPet;
                for (int i = 0; i < pets.Count; i++)
                {

                    Pet currentPet = pets.ElementAt(i);
                    AccordionPane panel = new AccordionPane();

                    //setup header
                    CheckBox currentPetCheck = new CheckBox();
                    currentPetCheck.ID = "chkName" + currentPet.petNumber;
                    currentPetCheck.CssClass = "nameCheckboxes";
                    currentPetCheck.AutoPostBack = true;
                    currentPetCheck.CheckedChanged += checkPet;
                    currentPetCheck.ClientIDMode = ClientIDMode.AutoID;
                    currentPetCheck.Text = currentPet.petName;
                    panel.HeaderContainer.Controls.Add(currentPetCheck);

                    //setup panel attributes
                    panel.ID = "Pet" + currentPet.petNumber;
                    panel.CssClass = "panels";

                    //create pet reservation control
                    PetReservationPanel newPetPanel = (PetReservationPanel)LoadControl("~/controls/PetReservationPanel.ascx");
                    newPetPanel.ID = "petPanel" + currentPet.petNumber;
                    newPetPanel.pet = currentPet;

                    if (reservation != null)
                    {
                        newPetPanel = setPetReservation(currentPet.petNumber.ToString(), newPetPanel);
                    }

                    if (newPetPanel.petReservation != null)
                    {
                        if (newPetPanel.petReservation.petReservationService.Count > 0)
                        {
                            currentPetCheck.Checked = true;
                            newPetPanel.enable();
                        }
                    }
                    else
                    {
                        newPetPanel.disable();
                    }
                    //add controls
                    panel.ContentContainer.ID = "content" + currentPet.petNumber;
                    panel.ContentContainer.Controls.Add(newPetPanel);

                    ServiceAccordion.Panes.Add(panel);
                }
            }
        }

        private PetReservationPanel setPetReservation(String petNum, PetReservationPanel petPanel)
        {

            for (int i = 0; i < reservation.petReservation.Count; i++)
            {
                String currentPetNum = reservation.petReservation.ElementAt(i).pet.petNumber.ToString();
                if (currentPetNum == petNum)
                {
                    petPanel.petReservation = reservation.petReservation.ElementAt(i);
                    petPanel.setServices();
                }
            }

            return petPanel;
        }

        private void checkPet(object sender, EventArgs e)
        {
            CheckBox currentPet = (CheckBox)sender;
            String petNumber = currentPet.ID.Replace("chkName", "");
            PetReservationPanel currentPanel = getPetReservationPanel(petNumber);
            if (currentPet.Checked)
            {
                currentPanel.enable();
                currentPanel.selected = true;
            }
            else
            {
                currentPanel.disable();
                currentPanel.selected = false;
            }
        }

        private AccordionPane getPane(String petNumber)
        {
            AccordionPane pane = (AccordionPane)ServiceAccordion.FindControl("Pet" + petNumber);
            return pane;
        }

        private PetReservationPanel getPetReservationPanel(String petNumber)
        {
            AccordionPane currentPane = getPane(petNumber);
            PetReservationPanel currentPetPanel = (PetReservationPanel)currentPane.FindControl("PetPanel" + petNumber);
            return currentPetPanel;
        }

        //checks to see if the user had clicked to add a pet while making a reservation
        protected void checkSavedReservationProgress()
        {
            if (Session["MakingReservation"] != null)
            {
                makingReservation = (Boolean)Session["MakingReservation"];
                savedReservation = (Reservation)Session["SavedReservation"];
            }

            if (makingReservation == true)
            {
                // displayContent();
                fillInformation(savedReservation);
                btnCancel.Visible = true;
            }
        }

        protected void checkUserType()
        {
            if (Session["User"] != null)
            {
                newUser = (User)Session["User"];
                if (newUser.user == userType.Clerk)
                {
                    lblHeader.Visible = false;
                }
            }
        }

        protected void checkOwnerSession()
        {
            if (Session["Owner"] != null)
            {
                owner = (Owner)Session["Owner"];

                if (Session["Reservations"] != null)
                {
                    reservations = (List<Reservation>)Session["Reservations"];
                    ContentPlaceHolder content = (ContentPlaceHolder)Page.Master.FindControl("content");

                }
                //if they don't have a reservation session then the form is displayed to add a form
                else
                {
                    // displayContent();
                }

                if (!IsPostBack)
                {
                    populateOwnerInformation();
                }

            }
        }

        private void initializePage()
        {
            Page.Title = "Manage Reservation";
            //disabled buttons
        }

        public void fillInformation(Reservation currentRes)
        {
            for (int i = 0; i < currentRes.petReservation.Count; i++)
            {
                txtStartDate.Text = currentRes.reservationStartDate.ToString("MM/dd/yyyy");
                txtEndDate.Text = currentRes.reservationEndDate.ToString("MM/dd/yyyy");
                PetReservation currentPetReservation = currentRes.petReservation.ElementAt(i);
                setServices(currentPetReservation.petReservationService, currentPetReservation.pet);
            }
        }

        private void setServices(List<Service> services, Pet currentPet)
        {

        }

        private void displayUpdateButtons()
        {
            btnCancel.Visible = true;
            btnMakeRes.Visible = false;
            btnUpdateRes.Visible = true;
            btnEdit.Visible = false;
            btnAddPet.Visible = true;
        }

        private void displayEditButtons()
        {
            btnCancel.Visible = true;
            btnMakeRes.Visible = false;
            btnUpdateRes.Visible = false;
            btnEdit.Visible = true;
            btnAddPet.Visible = false;
        }

        private void displayCreateButtons()
        {
            btnCancel.Visible = true;
            btnMakeRes.Visible = true;
            btnUpdateRes.Visible = false;
            btnEdit.Visible = false;
            btnAddPet.Visible = true;
        }
        private void populateOwnerInformation()
        {
            lblName.Text += owner.ownerFirstName + " " + owner.ownerLastName;
            if (owner.ownerEmail != "")
            {
                lblEmail.Text += owner.ownerEmail;
            }
            else
            {
                lblEmail.Visible = false;
            }

            if (owner.ownerPhone != "")
            {
                lblPhone.Text += owner.ownerPhone;
            }
            else
            {
                lblPhone.Visible = false;
            }
        }

        private void disableFields()
        {
            txtStartDate.ReadOnly = true;
            txtStartDate.CssClass = txtStartDate.CssClass.Replace("dateUI", "readOnly");

            txtEndDate.ReadOnly = true;
            txtEndDate.CssClass = txtEndDate.CssClass.Replace("dateUI", "readOnly");
        }

        private void enableFields()
        {
            txtStartDate.ReadOnly = false;
            txtStartDate.CssClass = txtStartDate.CssClass.Replace("readOnly", "dateUI");

            txtEndDate.ReadOnly = false;
            txtEndDate.CssClass = txtEndDate.CssClass.Replace("readOnly", "dateUI");
        }

        private void clear()
        {
            txtEndDate.Text = "";
            txtStartDate.Text = "";
            btnMakeRes.Visible = true;

            enableFields();
        }

        private void registerReservationInformation()
        {
            enableFields();
            DateTime start = DateTime.Now;
            DateTime end = DateTime.Now.AddDays(7);

            if (txtStartDate.Text != "")
            {
                start = Convert.ToDateTime(txtStartDate.Text);
            }

            if (txtEndDate.Text != "")
            {
                end = Convert.ToDateTime(txtEndDate.Text);
            }

            reservation = new Reservation(1000, start, end);
            reservation.owner = owner;
            getPetReservations(reservation);
            saveReservationInformation(reservation);
        }

        private void getPetReservations(Reservation newReservation)
        {
            List<Pet> ownerPets = owner.ownerPet;

            for (int i = 0; i < ownerPets.Count; i++)
            {
                Pet currentPet = ownerPets.ElementAt(i);
                String petNumber = currentPet.petNumber.ToString();

                PetReservationPanel petPanel = getPetReservationPanel(petNumber);
                if (petPanel.selected)
                {
                    petPanel.setPetReservation();
                    reservation.petReservation.Add(petPanel.petReservation);
                }
            }
        }

        private void saveReservationInformation(Reservation newReservation)
        {
            //check if the user was making a reservation when they decided to add a pet for which it saves the information entered for later when they come back. 
            if (Session["MakingReservation"] != null)
            {
                if ((Boolean)Session["MakingReservation"] != false)
                {

                    Session["SavedReservation"] = newReservation;
                }
            }
            //if they are not adding a pet then the reservation is added to the session
            else
            {
                Session["Reservation"] = newReservation;
            }
        }

        protected void btnUpdateRes_Click(object sender, EventArgs e)
        {
            if (validateInfo())
            {
                registerReservationInformation();
                disableFields();
                btnCancel.Visible = true;
                btnCancel.Text = "View Summary";
                btnEdit.Visible = true;
                btnUpdateRes.Visible = false;
                btnAddPet.Visible = false;
            }
        }

        protected void btnMakeRes_Click(object sender, EventArgs e)
        {
            if (validateInfo())
            {
                Session["MakingReservation"] = null;
                registerReservationInformation();
                //displaySummary();
                btnCancel.Text = "Back";
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            enableFields();

            lblHeader.Text = "Update Reservation";

            //enabled buttons
            btnUpdateRes.Visible = true;
            btnCancel.Visible = true;
            btnEdit.Visible = false;
            btnAddPet.Visible = true;
            btnCancel.Text = "Cancel";
        }

        protected void btnMakeNewRes_Click(object sender, EventArgs e)
        {
            //enabled buttons
            btnAddPet.Visible = true;
            // displayContent();
            clear();

            btnMakeRes.Visible = true;
            btnCancel.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // displaySummary();
        }


        protected void btnAddPet_Click(object sender, EventArgs e)
        {
            if (validateInfo())
            {
                Session["MakingReservation"] = true;
                registerReservationInformation();
                Server.Transfer("./ManagePet.aspx");
            }
        }

        private Boolean validateInfo()
        {
            Page.Validate();
            return Page.IsValid;
        }

        protected void valCompareStartEndDates_ServerValidate(object sender, ServerValidateEventArgs args)
        {
            try
            {
                DateTime start = Convert.ToDateTime(txtStartDate.Text);
                DateTime end = Convert.ToDateTime(txtEndDate.Text);
                if (start > end)
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

            }
        }

        protected void valDateFormat_ServerValidate(object sender, ServerValidateEventArgs args)
        {
            try
            {
                Convert.ToDateTime(args.Value);
                args.IsValid = true;
            }
            catch
            {
                args.IsValid = false;
            }
        }

        protected void valStartDateFuture_ServerValidate(object sender, ServerValidateEventArgs args)
        {
            try
            {
                DateTime start = Convert.ToDateTime(args.Value);
                if (start <= DateTime.Now.AddDays(-1))
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

            }
        }

    }
}