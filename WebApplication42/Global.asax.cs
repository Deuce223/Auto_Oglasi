using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace WebApplication42
{
    public class Global : System.Web.HttpApplication
    {

        

        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {

            Session["ID"] = "";
            Session["USERNAME"] = "";
            Session["MEJL"] = "";
            Session["LOZINKA"] = "";
            Session["IME"] = "";
            Session["PREZIME"] = "";
            Session["OVLASCENJE"] = "";
            Session["STANJE"] = "";


        }
    }
}