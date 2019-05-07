using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;


namespace WebApplication42
{
    public partial class Poruke : System.Web.UI.Page
    {

        //string vlasnik;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["OVLASCENJE"].ToString() == "3" || Session["OVLASCENJE"].ToString() == "")
            {

                string vlasnik = Request.QueryString["vlasnik"];
                Response.Redirect("Login.aspx?id=poruke&vlasnik=" + vlasnik);



            }

            //else
            //{

            //   vlasnik = Request.QueryString["vlasnik"];

            //POKUPI OVO U JAVASCRIPTU!!!!!!!

            //}


        }

        [WebMethod]
        public static string UpisPoruke(string podaci)
        {
            
            Poruka message = new Poruka();
            message = JsonConvert.DeserializeObject<Poruka>(podaci);
            string salje = HttpContext.Current.Session["ID"].ToString();

            SqlConnection conn = new SqlConnection(Konekcija.CS());
            //   SqlCommand komanda = new SqlCommand("INSERT INTO PORUKE(NASLOV, Text_PORUKE, status_poruke,primio,poslao) VALUES(" + "'" + message.naslov + "', '" + message.text + "', " + 2 + ", '" + message.vlasnik + "', '" + salje + "')", conn);
            //   SqlCommand komanda = new SqlCommand("INSERT INTO CHAT(NASLOV, Text_PORUKE, status_poruke,primio,poslao) VALUES(" + "'" + message.naslov + "', '" + message.text + "', " + 2 + ", '" + message.vlasnik + "', '" + salje + "')", conn);
            SqlCommand komanda = new SqlCommand("EXEC Cetovanje " + "'" + message.naslov + "', '" + message.text + "', " + salje + ", " + message.vlasnik, conn);
            conn.Open();
            komanda.ExecuteNonQuery();
            conn.Close();

            return ("poruka poslata");


        }



    }


    public class Poruka
    {

        public string vlasnik { set; get; }
        public string naslov { set; get; }
        public string text { set; get; }



    }
}