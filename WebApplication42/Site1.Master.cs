using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication42
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            //    Response.Cache.SetCacheability(HttpCacheability.NoCache);

            //  Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));

            Response.Cache.SetNoStore();

            if (!IsPostBack)
            {
              
                korisnik.Style.Add("display", "none");
                logOut.Style.Add("display", "none");

                if (Session["USERNAME"].ToString() != "")
                {
                    korisnik.Style.Remove("display");
                    logOut.Style.Remove("display");
                    log.Style.Add("display", "none");
                    prijava.Style.Add("display", "none");
                    korisnik.InnerHtml = Session["USERNAME"].ToString();



                    SqlConnection conn = new SqlConnection(Konekcija.CS());
                    //      SqlCommand komanda = new SqlCommand("SELECT COUNT(ID) FROM Chat WHERE PRIMIO = " + Session["ID"].ToString() + " AND status_poruke = 2", conn);
                    // definisati novu komandu
                    SqlCommand komanda = new SqlCommand("SELECT COUNT(ID) FROM CHATOVI WHERE STANJE = 2 AND PRIMIO = " + Session["ID"].ToString(), conn);
                    conn.Open();
                    int brojPoruka = (int)komanda.ExecuteScalar();
                    conn.Close();

                    if( brojPoruka == 1)
                    {
                        korisnik.InnerHtml = Session["USERNAME"].ToString() + "<br>" + brojPoruka + " message" /*+ "<img src='" + "pismo.jpg" + "' />"*/ ;

                    }

                    else if( brojPoruka != 0)
                    {

                        korisnik.InnerHtml = Session["USERNAME"].ToString() + "<br>" + brojPoruka + " messages" /*+ "<img src='" + "pismo.jpg" + "' />"*/ ;

                    }

                    else
                    {

                        korisnik.InnerHtml = Session["USERNAME"].ToString(); /*+ "<br>" + brojPoruka + " messages" /*+ "<img src='" + "pismo.jpg" + "' />"*/ 

                    }


                }

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Cache.SetNoStore();

            Session["ID"] = "";
            Session["USERNAME"] = "";
            Session["MEJL"] = "";
            Session["LOZINKA"] = "";
            Session["IME"] = "";
            Session["PREZIME"] = "";
            Session["OVLASCENJE"] = "";
            Session["STANJE"] = "";

                korisnik.InnerHtml = "";
            korisnik.Style.Add("display", "none");
            logOut.Style.Add("display", "none");

            log.Style.Remove("display");
            prijava.Style.Remove("display");

            //  Response.Redirect("WebForm1.aspx");

            string link = Request.Url.AbsolutePath;
             if(link == "/Postavljanje.aspx" || link == "/Korisnicka_strana.aspx")
            {

                Response.Redirect("WebForm1.aspx");

            }

            else
            {

                Response.Redirect("WebForm1.aspx"); // ovaj else je bio komentarisan!!!

            }


        }

   


        //[WebMethod]
        //public static void LogOut(string podatak)
        //{

        //    HttpContext.Current.Session["USERNAME"] = "";
        //    string ime = "Milos";

        //}
    }



}