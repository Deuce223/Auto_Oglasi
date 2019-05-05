using Newtonsoft.Json;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Net.Mail;
using System.Web;

namespace WebApplication42
{
    public partial class WebForm4 : System.Web.UI.Page
    {
       // static string CS = ("Data Source=DESKTOP-BL84MTN\\SQLEXPRESS;Initial Catalog=Automobili;Integrated Security=True;MultipleActiveResultSets=True");

        protected void Page_Load(object sender, EventArgs e)
        {

            
        }

        [WebMethod]
        public static string Provera(string podaci)
        {
            
            Forma reg = new Forma();
            reg = JsonConvert.DeserializeObject<Forma>(podaci);


            SqlConnection conn = new SqlConnection(Konekcija.CS());
            SqlDataAdapter adapt = new SqlDataAdapter("SELECT * FROM KORISNICI WHERE " + reg.sql + " = " + "'" + reg.vrednost + "'", conn);
            DataTable tabela = new DataTable();
            adapt.Fill(tabela);


            if (tabela.Rows.Count == 0)
            {

                return "OK" ;



            }

            else
            {

                return reg.sql + " ZAUZET";

            }


            //if (tabela.Rows.Count == 0)
            //{

            //    adapt = new SqlDataAdapter("SELECT * FROM KORISNICI WHERE Mejl = " + "'" + reg.nizPodataka[2] + "'", conn);
            //    DataTable tab1 = new DataTable();
            //    adapt.Fill(tab1);

            //    if (tab1.Rows.Count == 0)
            //    {

            //        // korisnik se moze upusati u bazu


            //    }


            //    else
            //    {

            //        return "Postoji korisnik sa "
            //        //password zauzet;


            //    }


            //}

            //else
            //{

            //  //username zauzet;

            //}



        }

        [WebMethod]
        public static string Registracija(string[] podaci)
        {
            string token = Convert.ToBase64String(Guid.NewGuid().ToByteArray()).Replace("=", "").Replace("/", "_").Replace("+", "-");

            string[] neki = podaci;
            SqlConnection conn = new SqlConnection(Konekcija.CS());
            SqlCommand komanda = new SqlCommand("INSERT INTO KORISNICI(USERNAME,MEJL,LOZINKA,IME,PREZIME,OVLASCENJE,STANJE,TOKEN) OUTPUT INSERTED.ID VALUES(" + "'" + neki[0] + "', '" + neki[2] + "', '" + neki[1] + "', '" + neki[3] + "', '" + neki[4] + "', " + 2 + ", " + 2 + ", '" + token + "')", conn);
            conn.Open();
            int redni = (int)komanda.ExecuteScalar();
            SqlCommand komanda1 = new SqlCommand("INSERT INTO TELEFONI(TELEFON,KORISNIK) VALUES(" + "'" + neki[5] + "', " + redni + ")", conn);

         

            //napisati store proceduru za ovaj insert!!!!!!!!

            komanda1.ExecuteNonQuery();
            conn.Close();


            if (neki.Length > 6)
            {

                int br = neki.Length - 6;
                for (int counter = 0; counter < br; counter++)
                {

                    SqlCommand komanda2 = new SqlCommand("INSERT INTO TELEFONI(TELEFON,KORISNIK) VALUES(" + "'" + neki[neki.Length - 1 - counter] + "', " + redni + ")", conn);
                    conn.Open();
                    komanda2.ExecuteNonQuery();
                    conn.Close();


                }


            }

            //  string link = "WebForm1.aspx";

            MailMessage msg = new MailMessage();
            SmtpClient klijent = new SmtpClient();

           

            try
            {
                msg.Subject = "Link za registraciju";
                //msg.IsBodyHtml = true;
                msg.Body = "http://localhost:59725/potvrda_registracije.aspx?token=" + token;
               // msg.Body = "<a href=" + "'" + link + "'" + ">link za registraciju</a>";
                msg.From = new MailAddress("BajaDragan10@gmail.com");
                msg.To.Add("maximusdemitrijus@yahoo.com");
                klijent.Host = "smtp.gmail.com";
                System.Net.NetworkCredential basic = new System.Net.NetworkCredential("BajaDragan10@gmail.com", "fakeakaunt10");
                klijent.EnableSsl = true;
                klijent.Port = 587;
                klijent.UseDefaultCredentials = false;
                klijent.Credentials = basic;
                klijent.DeliveryMethod = SmtpDeliveryMethod.Network;
                klijent.Send(msg);
                return "Prelazna.html?value=uspeh";
                // HttpContext.Current.Response.Redirect("potvrda_registracije.aspx");

            }


            catch(Exception ex)
            {

                return "Prelazna.html?value=neuspeh";
                

             //   HttpContext.Current.Response.Redirect("https://www.google.rs");
             //obrise sve iz tabele i kaze probajte ponovo!
             //registracija trenutno nije moguca molim vas pokusajte za minut-dva


            }

            //MailMessage msg = new MailMessage();
            //SmtpClient klijent = new SmtpClient();
            //try
            //{


            //    msg.Subject = "Registracija";
            //    msg.IsBodyHtml = true;
            //    msg.Body = "U ovom delu cu poslati link za potvrdu registracije";
            //    msg.From = new MailAddress("BajaDragan10@gmail.com");
            //    msg.To.Add("maximusdemitrijus@yahoo.com");
            //    klijent.Host = "smtp.gmail.com";
            //    System.Net.NetworkCredential basic = new System.Net.NetworkCredential("BajaDragan10@gmail.com", "fakeakaunt10");
            //    klijent.EnableSsl = true;
            //    klijent.Port = 587;
            //    klijent.UseDefaultCredentials = false;
            //    klijent.Credentials = basic;
            //    klijent.DeliveryMethod = SmtpDeliveryMethod.Network;
            //    klijent.Send(msg);


            //}

            //catch (Exception ex)
            //{

            //   // Response.Write("ne radi");


            //}

            //slanje mejla, pravljenje tokena u prethodnom selektu!!!



        }

    }


    public class Forma
    {

        public string vrednost { set; get; }
        public string sql { set; get; }

        //public string[] nizPodataka { set;get; }

        //public string korisnik { set; get; }
        //public string lozinka { set; get; }
        //public string ime { set; get; }
        //public string prezime { set; get; }
        //public string mobilni1 { set; get; }


    }


}