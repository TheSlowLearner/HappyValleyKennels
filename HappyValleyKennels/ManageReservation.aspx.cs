using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronManhvkBLL;
using AjaxControlToolkit;

namespace HappyValleyKennels
{
    public partial class ManageReservation : System.Web.UI.Page
    {

        private Owner owner;
        private User newUser;
        private List<Reservation> reservations;

        protected void Page_Load(object sender, EventArgs e)
        {
            checkOwnerSession();
            checkUserType();
            checkReservations();
            initializePage();
            ReservationList.reservations = reservations;


        }

        protected void Page_PreRender(object sender, EventArgs e)
        {

        }

        protected void checkUserType()
        {
            if (Session["User"] != null)
            {
                newUser = (User)Session["User"];
                if (newUser.user == userType.Clerk)
                {
                    ReservationForm.displayReservationList();
                }
               
            }
        }
        
        protected void checkReservations()
        {
            if (Session["Reservations"] != null)
            {
                reservations = (List<Reservation>)Session["Reservations"];
                ReservationForm.displayReservationList();
            }
            else
            {
                if(newUser.user == userType.Client)
                {
                    ReservationForm.displayForm();
                }
            }
        }
        protected void checkOwnerSession()
        {
            if (Session["Owner"] != null)
            {
                owner = (Owner)Session["Owner"];                
            }
        }

        private void initializePage()
        {
            Page.Title = "Manage Reservation";
        }


    }
}