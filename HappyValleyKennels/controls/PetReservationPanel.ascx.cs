using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronManhvkBLL;

namespace HappyValleyKennels
{
    public partial class PetReservationPanel : System.Web.UI.UserControl
    {
        public Pet pet { get; set; }

        public Reservation reservation { get; set; }

        public Boolean selected { get; set; }

        public PetReservation petReservation { get; set; }

        
        protected void Page_Load(object sender, EventArgs e)
        {
            petReservation = new PetReservation();
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {

        }

        public void disable()
        {
            chkWalk.Enabled = false;
            chkPlaytime.Enabled = false;
            selected = false;
        }

        public void enable()
        {
            chkWalk.Enabled = true;
            chkPlaytime.Enabled = true;
            selected = true;
        }

        private void setReservedServices()
        {
            petReservation.petReservationService = new List<Service>();
            if (chkWalk.Checked)
            {
                petReservation.petReservationService.Add(new Service(2, "Extra Walk", 10, 5, pet.petSize, 0));
            }

            if (chkPlaytime.Checked)
            {
                petReservation.petReservationService.Add(new Service(5, "Playtime", 10, 5, pet.petSize, 0));
            }
        }

        public void setPetReservation()
        {
            petReservation = new PetReservation(1000, pet, 1000, 0);
            setReservedServices();
        }

        public void setServices()
        {
            List<Service> petServices = petReservation.petReservationService;

            for (int i = 0; i < petServices.Count; i++)
            {
                Service currentService = petServices.ElementAt(i);

                if(currentService.serviceDescription == "Playtime")
                {
                    chkPlaytime.Checked = true;
                }
                else if (currentService.serviceDescription == "Extra Walk")
                {
                    chkWalk.Checked = true;
                }  
            }
        }
    }
}