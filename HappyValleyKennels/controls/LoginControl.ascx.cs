using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronManhvkBLL;

namespace HappyValleyKennels.controls
{
    public partial class LoginControl : System.Web.UI.UserControl
    {
        private Owner owner;
        private User newUser = new User();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblInvalidLogin.Visible = false;

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            checkUserType();
            owner = new Owner();
            switch (newUser.user)
            {

                case (userType.Clerk):
                    Reservation res = new Reservation();
                    Session["Reservations"] = res.listAllReservations();
                    Response.Redirect("./home.aspx");
                    break;

                case (userType.Client):
                    owner = owner.getOwner(txtEmail.Text);

                    if (owner.ownerNumber!=0)
                    {

                        Pet pet = new Pet();
                        List<Pet> ownerPets = new List<Pet>();
                        ownerPets = pet.getPetByOwner(owner.ownerNumber);
                        owner.ownerPet = ownerPets;
                        Reservation reservation = new Reservation();
                        List<Reservation> ownerReservations = reservation.listReservations(owner.ownerNumber);

                        Session["Owner"] = owner;
                        Session["OwnerNumber"] = owner.ownerNumber;
                        Session["Reservations"] = ownerReservations;
                        Response.Redirect("./home.aspx");
                    }
                    else
                    {
                        lblInvalidLogin.Visible = true;
                    }
                    break;
            }
        }

        private void getPetReservations(Reservation res)
        {

        }

        private void checkUserType()
        {
            if(txtEmail.Text == "reed@hvk.ca" && txtPassword.Text == "1234")
            {
               newUser.user  = userType.Clerk;
            }
            else
            {
                newUser.user = userType.Client;
            }
            Session["User"] = newUser;
        }

        protected void lBtnCreateAccount_Click(object sender, EventArgs e)
        {
            newUser.user = userType.Client;
            Session["User"] = newUser;
            Response.Redirect("./ManageAccount.aspx");
        }
    }
}
