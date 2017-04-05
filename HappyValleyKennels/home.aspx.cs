using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronManhvkBLL;
namespace HappyValleyKennels
{
    public partial class home : System.Web.UI.Page
    {
        private Owner owner;
        private User newUser;
        private List<Reservation> allReservations;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["owner"] != null)
            {
                owner = (Owner)Session["Owner"];
            }

            if (Session["User"] != null)
            {
                newUser = (User)Session["User"];

                    if (newUser.user == userType.Client)
                    {
                        CustomerHomePage.owner = owner;
                        displayownerHome();
                    }
                    else if(newUser.user == userType.Clerk)
                    {

                        allReservations = (List<Reservation>)Session["AllReservations"];
                        txtStartSearch.Text = "mm/dd/yyyy";
                        txtEndSearch.Text = "mm/dd/yyyy";
                        displayEmployeeHome();
                    }
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {

        }


        private void displayownerHome()
        {
            this.Master.FindControl("content").Visible = true;
            this.Master.FindControl("summary").Visible =false;
        }

        private void displayEmployeeHome()
        {
            this.Master.FindControl("content").Visible = false;
            this.Master.FindControl("summary").Visible = true;
        }
    }
}