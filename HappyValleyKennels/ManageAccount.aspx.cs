using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronManhvkBLL;
using HappyValleyKennels.controls;

namespace HappyValleyKennels
{
    public partial class ManageAccount : System.Web.UI.Page
    {
        private User newUser;
        private Owner owner;
        
        private void Page_Load(object sender, EventArgs e)
        {
            
            checkUserType();
            
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            checkOwnerSession();
            ContentPlaceHolder summary = (ContentPlaceHolder)this.Master.FindControl("summary");
            if (summary.Visible == true)
            {
                displaySummary();
            }
        }
        private void checkOwnerSession()
        {
            if (Session["Owner"] == null)
            {
                //if there's no owner session then it means it is a new owner signing up
                Panel banner = (Panel)Master.FindControl("wrapper");
                banner.Visible = false;
                btnCancel.Visible = false;
                displayContent();
                enableFields();
                btnUpdateOwner.Visible = false;
                btnUpdateOwner.Enabled = false;
                btnCreateAccount.Visible = true;
                btnCreateAccount.Enabled = true;
                btnCancel.Enabled = false;
                btnCancel.Visible = false;
                owner = new Owner();
                //   fillInformation(owner);

            }
            else
            {
                Page.Title = "My Account";
                //otherwise it is a returning owner so display the banner and their information
                owner = (Owner)Session["owner"];
                if (!IsPostBack)
                {

                    fillInformation(owner);
                    disableFields();
                }
                btnEdit.Visible = true;
                btnCreateAccount.Visible = false;
                disablePasswords();
            }
        }


        private void checkUserType()
        {
            if (Session["User"] != null)
            {
                newUser = (User)Session["User"];
                if (newUser.user == userType.Clerk)
                {
                    displaySummary();
                    Page.Title = "Manage Accounts";
                    lblEmail.Text = "**Email";
                    lblPhone.Text = "**Phone";
                    lblHeader.Text = "Account Information";
                    disablePasswords();
                    valEmailRequireClerk.Enabled = true;
                    valEmailRequiredClient.Enabled = false;
                    valPhoneRequiredClerk.Enabled = true;
                }
                else if (newUser.user == userType.Client)
                {
                    checkOwnerSession();
                    if (!IsPostBack)
                    {
                        displayContent();
                        disableFields();
                        btnCancel.Visible = false;
                        btnUpdateOwner.Visible = false;
                    }
                    lblReqInfoPhoneEmail.Visible = false;
                    lblEmail.Text = "*Email";
                    lblPhone.Text = "Phone";
                    valEmailRequireClerk.Enabled = false;
                    valEmailRequiredClient.Enabled = true;
                    valPhoneRequiredClerk.Enabled = false;
                }
            }
        }

        private void fillInformation(Owner owner)
        {
            txtFirst.Text = owner.ownerFirstName;
            txtLast.Text = owner.ownerLastName;
            txtStreet.Text = owner.ownerStreet;
            txtCity.Text = owner.ownerCity;
            ddlProvince.SelectedValue = owner.ownerProvince;
            txtPostal.Text = owner.ownerPostalCode;
            txtPhone.Text = owner.ownerPhone;
            txtEmail.Text = owner.ownerEmail;
            txtEmergFirst.Text = owner.emergFirstName;
            txtEmergLast.Text = owner.emergLastName;
            txtEmergPhone.Text = owner.emergPhone;
        }

        private void disablePasswords()
        {
            txtPassword.Visible = false;
            lblPassword.Visible = false;
            txtConfirm.Visible = false;
            lblConfirm.Visible = false;
        }

        private void enableFields()
        {
            wrapper.Enabled = true;

            txtFirst.CssClass = txtFirst.CssClass.Replace("readOnly", "");
            txtLast.CssClass = txtLast.CssClass.Replace("readOnly", "");
            txtStreet.CssClass = txtStreet.CssClass.Replace("readOnly", "");
            txtCity.CssClass = txtCity.CssClass.Replace("readOnly", "");
            ddlProvince.CssClass = ddlProvince.CssClass.Replace("readOnly", "");
            txtPostal.CssClass = txtPostal.CssClass.Replace("readOnly", "");
            txtPhone.CssClass = txtPhone.CssClass.Replace("readOnly", "");
            txtEmail.CssClass = txtEmail.CssClass.Replace("readOnly", "");
            txtEmergFirst.CssClass = txtEmergFirst.CssClass.Replace("readOnly", "");
            txtEmergLast.CssClass = txtEmergLast.CssClass.Replace("readOnly", "");
            txtEmergPhone.CssClass = txtPhone.CssClass.Replace("readOnly", "");

            lblReqInfo.Visible = true;
        }

        private void disableFields()
        {
            wrapper.Enabled = false;

            txtFirst.CssClass += " readOnly";
            txtLast.CssClass += " readOnly";
            txtStreet.CssClass += " readOnly";
            txtCity.CssClass += " readOnly";
            ddlProvince.CssClass += " readOnly";
            txtPostal.CssClass += " readOnly";
            txtPhone.CssClass += " readOnly";
            txtEmail.CssClass += " readOnly";
            txtEmergFirst.CssClass += " readOnly";
            txtEmergLast.CssClass += " readOnly";
            txtEmergPhone.CssClass += " readOnly";

            lblReqInfo.Visible = false;
        }

        private void registerownerInformation()
        {
            List<Pet> currentPets = new List<Pet>();
            if (Session["owner"] != null)
            {
                currentPets = owner.ownerPet;
            }

            setownerInformation(18, 1000, currentPets);
                Session["owner"] = owner;
        }

        private void setownerInformation(int ownerNumber, int vetNumber, List<Pet> currentPets)
        {
            owner = new Owner(ownerNumber, txtFirst.Text, txtLast.Text, txtStreet.Text, txtCity.Text, ddlProvince.SelectedValue, txtPostal.Text, txtPhone.Text, txtEmail.Text, txtEmergFirst.Text, txtEmergLast.Text, txtEmergPhone.Text);
            owner.ownerPet = currentPets;
        }

        protected void clear()
        {
            txtFirst.Text = "";
            txtLast.Text = "";
            txtStreet.Text = "";
            txtCity.Text = "";
            ddlProvince.SelectedIndex = 0;
            txtPostal.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtEmergFirst.Text = "";
            txtEmergLast.Text = "";
            txtEmergPhone.Text = "";
        }

        private void cancelChanges()
        {
            fillInformation(owner);
            disableFields();
        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            if (valid())
            {
                if (Session["owner"] == null)
                {
                    registerownerInformation();
                    Server.Transfer("./ManagePet.aspx");
                }
                else
                {
                    registerownerInformation();
                    if (newUser.user == userType.Clerk)
                    {
                        displaySummary();
                    }
                    else
                    {
                        if(Session["Owner"] == null)
                        {
                            enableFields();
                        }
                        else
                        {
                            fillInformation(owner);
                            disableFields();
                        }
                    }
                }
            }
        }

        private Boolean valid()
        {
            Page.Validate();
            if (Page.IsValid)
            {
                return true;
            }
            return false;
        }

        private void displaySummary()
        {
            ContentPlaceHolder content = (ContentPlaceHolder)this.Master.FindControl("content");
            ContentPlaceHolder summary = (ContentPlaceHolder)this.Master.FindControl("summary");
            summary.Visible = true;
            content.Visible = false;
        }

        private void displayContent()
        {
            ContentPlaceHolder content = (ContentPlaceHolder)this.Master.FindControl("content");
            ContentPlaceHolder summary = (ContentPlaceHolder)this.Master.FindControl("summary");

            summary.Visible = false;
            content.Visible = true;
        }

        protected void viewownerPets_Click(object sender, EventArgs e)
        {
            Session["CheckingownerPet"] = true;
            Server.Transfer("./ManagePet.aspx");
        }
        
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            btnCreateAccount.Visible = false;
            btnUpdateOwner.Visible = false;
            btnCancel.Visible = false;
            btnEdit.Visible = true;

            if (newUser.user == userType.Clerk)
            {
                disableFields();
                displaySummary();
            }
            else if (newUser.user == userType.Client)
            {
                disableFields();
                cancelChanges();
                btnCreateAccount.Visible = false;
                btnCancel.Visible = false;
                btnEdit.Visible = true;
                lblHeader.Text = "Account Information";
            }
        }

        protected void btnUpdateOwner_Click(object sender, EventArgs e)
        {
            if (valid())
            {
                registerownerInformation();
                disableFields();

                if (newUser.user == userType.Clerk)
                {
                    displaySummary();
                }
                else
                {
                    btnUpdateOwner.Visible = false;
                    btnCancel.Visible = false;
                    btnEdit.Visible = true;
                    lblHeader.Text = "Account Information";
                }
            }

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            enableFields();

            //disabled buttons
            btnEdit.Visible = false;

            //enabled buttons
            btnUpdateOwner.Visible = true;
            btnCreateAccount.Visible = false;
            btnCancel.Visible = true;

            //changed headers and text
            lblHeader.Text = "Edit Account";
            txtFirst.Focus();
        }

        protected void btnCreateNewAccount_Click(object sender, EventArgs e)
        {
            displayContent();
            clear();
            txtFirst.Focus();
            //disabled buttons
            btnEdit.Visible = false;
            btnUpdateOwner.Visible = false;
            //enabled buttons
            btnCreateAccount.Visible = true;
            btnCancel.Visible = true;

            //changed text
            lblHeader.Text = "Create Account";
            btnCreateAccount.Text = "Create Account";

            enableFields();
        }

        protected void valCheckAddressStreet_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String streetValue = args.Value;
            String cityValue = txtCity.Text;
            String postalValue = txtPostal.Text;
            int provValue = ddlProvince.SelectedIndex;

            if (streetValue == "")
            {
                if (cityValue != "" || postalValue != "" || provValue != 0)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void valCheckAddressCity_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String cityValue = args.Value;
            String streetValue = txtStreet.Text;
            String postalValue = txtPostal.Text;
            int provValue = ddlProvince.SelectedIndex;

            if (cityValue == "")
            {
                if (streetValue != "" || postalValue != "" || provValue != 0)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void valCheckAddressProvince_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String cityValue = txtCity.Text;
            String streetValue = txtStreet.Text;
            String postalValue = txtPostal.Text;
            int provValue = ddlProvince.SelectedIndex;

            if (provValue == 0)
            {
                if (streetValue != "" || postalValue != "" || cityValue != "")
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void valCheckAddressPostal_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String cityValue = txtCity.Text;
            String streetValue = txtStreet.Text;
            String postalValue = args.Value;
            int provValue = ddlProvince.SelectedIndex;

            if (postalValue == "")
            {
                if (streetValue != "" || cityValue != "" || provValue != 0)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
        }

        protected void valPhoneRequiredClerk_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String phone = args.Value;
            String email = txtEmail.Text;

            if (phone == "")
            {
                if (email == "")
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void valEmailRequireClerk_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String phone = txtPhone.Text;
            String email = args.Value;

            if (email == "")
            {
                if (phone == "")
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void valEmergPhone_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String emergPhone = args.Value;
            String firstName = txtEmergFirst.Text;
            String lastName = txtEmergLast.Text;

            if (emergPhone == "")
            {
                if (firstName != "" || lastName != "")
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}