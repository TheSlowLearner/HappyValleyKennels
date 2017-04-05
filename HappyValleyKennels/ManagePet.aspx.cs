using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronManhvkBLL;


namespace HappyValleyKennels
{
    public partial class ManagePet : System.Web.UI.Page
    {
        private Owner owner;
        private User newUser;
        private Boolean makingReservation = false;

        private void Page_Load(object sender, EventArgs e)
        {

            checkOwnerSession();
            checkUserType();
            PetList.petList = owner.ownerPet;

            if (!IsPostBack)
            {
                initializePage();
            }
        }

        private void Page_PreRender(object sender, EventArgs e)
        {

        }

        private void initializePage()
        {
            Page.Title = "Manage Pet";
        }

        private void checkUserType()
        {
            if (Session["User"] != null)
            {
                newUser = (User)Session["User"];
                PetForm.newUser = newUser;
                if (newUser.user == userType.Client)
                {
                    PetForm.disableVerification();
                    PetForm.hideVerification();
                }
                else if (newUser.user == userType.Clerk)
                {
                    if(owner.ownerPet.Count == 0)
                    {
                        if (!IsPostBack)
                        {
                            PetList.displayForm();
                        }
                    }
                    else
                    {
                        if(makingReservation == false)
                        {
                            if (!IsPostBack)
                            {
                                PetForm.displayPetList();
                            }
                        }
                    }
                }
            }
        }

        private void checkOwnerSession()
        {
            
            if (Session["Owner"] != null)
            {

                owner = (Owner)Session["Owner"];
                PetForm.owner = owner;

                if (owner.ownerPet.Count != 0)
                {
                    checkSavedReservationProgress();
                }
                else
                {
                    if (!IsPostBack)
                    {
                        PetList.displayForm();
                    }
                }
            }

        }

        private void checkSavedReservationProgress()
        {
            if (Session["MakingReservation"] != null)
            {
                makingReservation = (Boolean)Session["MakingReservation"];
                   
                if (makingReservation == true)
                {
                    if (!IsPostBack)
                    {
                        PetList.displayForm();
                    }
                }
            }
            else
            {
                if (!IsPostBack)
                {
                    PetForm.displayPetList();

                }
            }
        }
    }
}