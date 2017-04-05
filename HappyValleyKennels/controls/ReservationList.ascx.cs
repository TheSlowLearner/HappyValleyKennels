using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronManhvkBLL;

namespace HappyValleyKennels.controls
{
    public partial class ReservationList : System.Web.UI.UserControl
    {
        public List<Reservation> reservations { get; set; }

        public Owner owner { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public String getPets(int resNum)
        {
            Pet pet = new Pet();
            List<String> petNames = pet.getPetsByReservation(resNum);
            String names = "";
            for (int i = 0; i < petNames.Count; i++)
            {
                names += petNames.ElementAt(i) + " ";
            }
            return names;
        }

        private Reservation getChosenReservation(int resNum)
        {
            for (int i = 0; i < reservations.Count; i++)
            {
                Reservation currentReservation = reservations.ElementAt(i);
                if (resNum == currentReservation.reservationNumber)
                {
                    return currentReservation;
                }
            }
            return null;
        }

        protected void gvOwnerReservations_SelectedIndexChanged(object sender, EventArgs e)
        {
            ContentPlaceHolder content = (ContentPlaceHolder)Page.Master.FindControl("content");
            ReservationForm reservationForm = (ReservationForm)content.FindControl("ReservationForm");

            Reservation chosenReservation = getChosenReservation(Convert.ToInt32(gvResList.SelectedDataKey.Value.ToString()));
            Panel mainContent = (Panel)content.FindControl("mainContent");
            reservationForm.reservation = chosenReservation;
            reservationForm.owner = owner;
            Session["Reservation"] = chosenReservation;
            reservationForm.fillInformation(chosenReservation);
            mainContent.CssClass = mainContent.CssClass.Replace("contentPetList", "");
            reservationForm.Visible = true;
            this.Visible = false;

        }
    }
}