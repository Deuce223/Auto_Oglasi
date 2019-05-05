using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;


namespace WebApplication42
{
    public partial class Login : System.Web.UI.Page
    {
      //  static string CS = ("Data Source=DESKTOP-BL84MTN\\SQLEXPRESS;Initial Catalog=Automobili;Integrated Security=True;MultipleActiveResultSets=True");
       static string stranaBackTrack;
        static string vlasnik;

        protected void Page_Load(object sender, EventArgs e)
        {
            stranaBackTrack = Request.QueryString["id"];
            vlasnik = Request.QueryString["vlasnik"];

        }


        [WebMethod(EnableSession = true)]       
        public static string Provera(string podaci)
        {

            

          Cekiranje sesija = new Cekiranje();
          sesija = JsonConvert.DeserializeObject<Cekiranje>(podaci);

          SqlConnection conn = new SqlConnection(Konekcija.CS());
          SqlDataAdapter adapt = new SqlDataAdapter("SELECT * FROM KORISNICI WHERE USERNAME = " + "'" + sesija.username + "'" + " OR MeJL = " + "'" + sesija.username + "'", conn);
          DataTable info = new DataTable();
            adapt.Fill(info);

            if(info.Rows.Count == 0)
            {

                return "ne postoji takav korisnik!";


            }

            else
            {

                if(sesija.lozinka == info.Rows[0]["LOZINKA"].ToString())
                {
                    HttpContext.Current.Session["ID"] = info.Rows[0]["ID"].ToString();
                    HttpContext.Current.Session["USERNAME"] = info.Rows[0]["USERNAME"].ToString();
                    HttpContext.Current.Session["MEJL"] = info.Rows[0]["MEJL"].ToString();
                    HttpContext.Current.Session["LOZINKA"] = info.Rows[0]["LOZINKA"].ToString();
                    HttpContext.Current.Session["IME"] = info.Rows[0]["IME"].ToString();
                    HttpContext.Current.Session["PREZIME"] = info.Rows[0]["PREZIME"].ToString();
                    HttpContext.Current.Session["OVLASCENJE"] = info.Rows[0]["OVLASCENJE"].ToString();
                    HttpContext.Current.Session["STANJE"] = info.Rows[0]["STANJE"].ToString();

                    if (stranaBackTrack == "postavljanje")
                    {

                        return "Postavljanje.aspx";

                    }

                    else if (stranaBackTrack == "poruke")
                    {

                        return "Poruke.aspx?vlasnik=" + vlasnik;


                    }

                    else
                    {

                        return "WebForm1.aspx";

                    }
                   

                  //  return HttpContext.Current.Session["OVLASCENJE"].ToString();

                }

                else
                {

                    return "pogresna lozinka";


                }


            }
           

        }
    }

    public class Cekiranje
    {

        public string username { set; get; }
        public string lozinka { set; get; }


    }
}