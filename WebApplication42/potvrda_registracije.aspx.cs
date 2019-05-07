using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Threading;

namespace WebApplication42
{
    public partial class WebForm5 : System.Web.UI.Page
    {
      //  static string CS = ("Data Source=DESKTOP-BL84MTN\\SQLEXPRESS;Initial Catalog=Automobili;Integrated Security=True;MultipleActiveResultSets=True");

        protected void Page_Load(object sender, EventArgs e)
        {

            string token = Request.QueryString["token"];

            SqlConnection conn = new SqlConnection(Konekcija.CS());
            //SqlDataAdapter adapt = new SqlDataAdapter("SELECT * FROM KORISNICI WHERE TOKEN = " + "'" + token + "'", conn);
            //DataTable korisnik = new DataTable();
            //adapt.Fill(korisnik);

            SqlCommand komanda = new SqlCommand("UPDATE KORISNICI SET OVLASCENJE = 2 WHERE TOKEN = '" + token + "'", conn);
            conn.Open();
            int broj = komanda.ExecuteNonQuery();
            conn.Close();


            if (broj == 1)
            {

                heder.InnerHtml = "USPESNO STE SE REGISTROVALI";
                //set timeout pa prelazak na pocetnu
                //ne zaboravi da pristup imaju samo aktivni korisnici, ovi mogu da se uloguju ali samo zbog konfirmation maila koji tek treba smisliti!nece moci na postavku oglasa npr!
                //mora iz javascripta!

                //Task.Delay(10000).Wait();
                //Response.Redirect("WebForm1.aspx");



            }

            else
            {

                moj.InnerHtml = "RESITRACIJA NEUSPESNA IZ NEKOG RAZLOGA";
                //Response.Redirect("WebForm1.aspx");
                //    Thread.Sleep(30000);


            }

        }

     
    }
}