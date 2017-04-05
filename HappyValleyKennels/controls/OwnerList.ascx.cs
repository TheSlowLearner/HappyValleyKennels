using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.ComponentModel;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using IronManhvkBLL;
using IronManhvkDB;

namespace HappyValleyKennels.controls
{
    public partial class OwnerList : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gvOwnerList.SelectedIndex = 0;   
        }  

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public List<Owner> getOwners()
        {
            Owner own = new Owner();
            List<Owner> owners = own.listOwners();
            return owners;
        }

        public String getFixedString(int petNum)
        {
            Pet pet = new Pet();
            return getFixedString(petNum);
        }
        
        public String getSizeString(int petNum)
        {
            Pet pet = new Pet();
            return pet.getSizeString(petNum);
        }

        public String getGenderString(int petNum)
        {
            Pet pet = new Pet();
            return pet.getGenderString(petNum);
        }
        
        protected void valCheckAddressStreet_ServerValidate(object source, ServerValidateEventArgs args)
        { /*
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
            */
        }

        protected void valCheckAddressCity_ServerValidate(object source, ServerValidateEventArgs args)
        {
            /*
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
            */
        }

        protected void valCheckAddressProvince_ServerValidate(object source, ServerValidateEventArgs args)
        {
            /*
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
            */
        }

        protected void valCheckAddressPostal_ServerValidate(object source, ServerValidateEventArgs args)
        {
            /*
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
            */
        }

        protected void valPhoneRequiredClerk_ServerValidate(object source, ServerValidateEventArgs args)
        {
            /*
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
            */
        }

        protected void valEmailRequireClerk_ServerValidate(object source, ServerValidateEventArgs args)
        {
            /*
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
            */
        }

        protected void valEmergPhone_ServerValidate(object source, ServerValidateEventArgs args)
        {
            /*
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
            */
        }

    }
}