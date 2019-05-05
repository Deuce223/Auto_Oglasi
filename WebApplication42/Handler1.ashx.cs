using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System.Text;
using System.IO;

namespace WebApplication42
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {

         

            //context.Response.Clear();
            //context.Response.Cache.SetCacheability(HttpCacheability.Public);
            //context.Response.Cache.SetExpires(DateTime.MinValue);

            // HttpResponse.Current.Cache.SetNoStore();
            string vlasnik = context.Session["ID"].ToString();

            

            string marka = context.Request["marka"];
            string model = context.Request["model"];
            string oznaka = context.Request["oznaka"];
            string godiste = context.Request["godiste"];
            string karoserija = context.Request["karoserija"];
            string gorivo = context.Request["gorivo"];
            string kubikaza = context.Request["kubikaza"];
            string snaga = context.Request["snaga"];
            string kilometraza = context.Request["kilometraza"];
            string pogon = context.Request["pogon"];

            string menjac = context.Request["menjac"];
            string brojVrata = context.Request["brojVrata"];
            string stranaVolana = context.Request["stranaVolana"];
            string boja = context.Request["boja"];
            string porekloVozila = context.Request["porekloVozila"];
            string registrovanDo = context.Request["registrovanDo"];
            string klima = context.Request["klima"];
            string cena = context.Request["cena"];
            string lokacija = context.Request["lokacija"];
            string zamena = context.Request["zamena"];


        //    string vlasnik = context.Session["ID"].ToString();

            string text = context.Request["text"];
            string cena_status = context.Request["cena_status"];

 

            //unos ovih podataka i vratiti red tog auta zbog slika!!!!!!!
            //string vlasnik = HttpContext.Current.Session["ID"].ToString();
            

            StringBuilder naredba = new StringBuilder();
            naredba.Append("INSERT INTO AUTI(Marka, Model, Karoserija, Gorivo, Vrata, Lokacija, Cena, Godiste, Kilometraza, Oznaka, Kubikaza, Menjac, Snaga, Volan, Pogon, Registrovan_do, Boja, Klima, Poreklo, Zamena, Cena_status, Opis, Vlasnik) OUTPUT INSERTED.ID VALUES(");
            naredba.Append(marka + ", " + model + ", " + karoserija + ", " + gorivo + ", " + brojVrata + ", " + lokacija + ", " + cena + ", " + godiste + ", " + kilometraza + ", '" + oznaka + "', " + kubikaza + ", " + menjac + ", '" + snaga + "', " + stranaVolana + ", " + pogon + ", " + registrovanDo + ", " + boja + ", " + klima + ", " + porekloVozila + ", " + zamena + ", " + cena_status + ", '" + text + "'" + ", " + vlasnik + ")");

            SqlConnection conn = new SqlConnection(Konekcija.CS());
            SqlCommand komanda = new SqlCommand(naredba.ToString(), conn);
            //SqlCommand komanda1;

            conn.Open();
            int brojReda = (int)komanda.ExecuteScalar();
            conn.Close();


            string prelaz_oprema = context.Request["oprema"]; //videti sta se dobija kada se ne posalje nista !!!!!
            if (prelaz_oprema != "[]")
            {
                string[] oprema1 = JsonConvert.DeserializeObject<string[]>(prelaz_oprema);
                for(int i = 0; i < oprema1.Length; i++)
                {
                    SqlCommand komanda1 = new SqlCommand("INSERT INTO DODATNA(Naziv,Kola) VALUES(" + "'" + oprema1[i] + "', " + brojReda +")", conn);
                    conn.Open();
                    komanda1.ExecuteNonQuery();
                    conn.Close();

                }

            }

            //if(oprema1.Length > 0)


            //uneti opremu

            if (context.Request.Files.Count > 0)
            {
                //Fetch the Uploaded File.



                for (int i = 0; i < context.Request.Files.Count; i++)
                {

                    HttpPostedFile postedFile = context.Request.Files[i];
                    //  string ime = context.Request["ime"];
                    
                    
                    string folderPath = context.Server.MapPath("~/Slike/");
                    string provera = postedFile.FileName;

                    string izmena = postedFile.FileName;
                    string[] nazivi = izmena.Split('.');
                    string izmena1 = "" + i + "." + nazivi[1];

                    Directory.CreateDirectory(folderPath + "/" + brojReda);
                    postedFile.SaveAs(folderPath + "/" + brojReda + "/" + izmena1);                    
                    SqlCommand komanda2 = new SqlCommand("INSERT INTO Slike(Slika,Automobil) VALUES(" + "'" + "Slike/" + brojReda + "/" + izmena1 + "', " + brojReda + ")", conn);
                    conn.Open();
                    komanda2.ExecuteNonQuery();
                    conn.Close();


                }


            }

            //context.Items.Clear();



            //context.Response.Clear();
            //context.Response.Cache.SetCacheability(HttpCacheability.Public);
            //context.Response.Cache.SetExpires(DateTime.MinValue);

            context.Response.ContentType = "text/plain"; //ovo isto izgleda ne treba !!!!!!!

            ResponseMsg r = new ResponseMsg();
            r.name = "Milos";
            r.status = "success";

            context.Response.Write(JsonConvert.SerializeObject(r));

        }

    
        

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }

    public class ResponseMsg
    {
        public string status;
        public string name;
    }

}