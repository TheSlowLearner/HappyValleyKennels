using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronManhvkBLL;

namespace HappyValleyKennels
{
    public partial class HappyValleyKennels : System.Web.UI.MasterPage
    {
        private Owner owner;
        private User newUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                newUser = (User)Session["User"];
                if (newUser.user == userType.Client)
                {
                    if (Session["Owner"] != null)
                    {
                        owner = (Owner)Session["Owner"];
                        lblWelcome.Text = "Welcome Back " + owner.ownerFirstName + " " + owner.ownerLastName;
                    }
                }
                else if (newUser.user == userType.Clerk)
                {
                    lblWelcome.Text = "Welcome Back Em Ployee";
                    hlAccount.Text = "HVK Customers";
                    hlPets.Visible = false;
                    hlReservations.Text = "Reservations";
                }
            }
        }
        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["Owner"] = null;
            Server.Transfer("./default.aspx");
        }

    }
}