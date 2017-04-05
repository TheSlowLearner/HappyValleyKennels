using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IronManhvkBLL;

namespace HappyValleyKennels.controls
{
    public partial class PetList : System.Web.UI.UserControl
    {
        public List<Pet> petList { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public String getFixed(int petNum)
        {
            Pet pet = new Pet();
            return pet.getFixedString(petNum);
        }

        public String getSize(int petNum)
        {
            Pet pet = new Pet();
            return pet.getSizeString(petNum);
        }

        public String getGender(int petNum)
        {
            Pet pet = new Pet();
            return pet.getGenderString(petNum);
        }

        private Pet getChosenPet(int petNum)
        {
            for (int i = 0; i < petList.Count; i++)
            {
                Pet currentPet = petList.ElementAt(i);
                if(petNum == currentPet.petNumber)
                {
                    return currentPet;
                }
            }
            return null;
        }

        public void updatePet()
        {

        }

        public void displayForm()
        {
            ContentPlaceHolder content = (ContentPlaceHolder)Page.Master.FindControl("content");
            PetForm petForm = (PetForm)content.FindControl("PetForm");
            petForm.Visible = true;
            Panel mainContent = content.FindControl("mainContent") as Panel;
            mainContent.CssClass = mainContent.CssClass.Replace("contentPetList", "");
            this.Visible = false;
        }

        public void displayPetList()
        {
            ContentPlaceHolder content = (ContentPlaceHolder)Page.Master.FindControl("content");
            PetForm petForm = (PetForm)content.FindControl("PetForm");
            petForm.Visible = false;
            Panel mainContent = content.FindControl("mainContent") as Panel;
            mainContent.CssClass += " contentPetList";
            this.Visible = true;
        }

        protected void gvPetList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ContentPlaceHolder content = (ContentPlaceHolder)Page.Master.FindControl("content");
            PetForm petForm = (PetForm)content.FindControl("PetForm");
           
            Pet chosenPet = getChosenPet(Convert.ToInt32(gvPetList.SelectedDataKey.Value.ToString()));
            Panel mainContent = (Panel)content.FindControl("mainContent");
            petForm.pet = chosenPet;
            Session["Pet"] = chosenPet;
            petForm.fillInformation();
            mainContent.CssClass = mainContent.CssClass.Replace("contentPetList", "");
            petForm.Visible = true;
            this.Visible = false;
        }
    }
}