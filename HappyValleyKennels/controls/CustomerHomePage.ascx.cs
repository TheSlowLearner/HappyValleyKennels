using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronManhvkBLL;

namespace HappyValleyKennels.controls
{

    public partial class CustomerHomePage : System.Web.UI.UserControl
    {
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
        protected void gvUpcomingReservation_SelectedIndexChanged(object sender, EventArgs e)
        {
            Reservation res = new Reservation();
            int resNum = Convert.ToInt32(gvUpcomingReservation.SelectedDataKey.Value.ToString());
            Session["reservation"] = res.getReservation(resNum);
            Response.Redirect("ManageReservation.aspx");
        }
    }
}