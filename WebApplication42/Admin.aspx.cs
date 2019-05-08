using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace WebApplication42
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            //DateTime xxx = new DateTime(0, 0, 30);

            TimeSpan xxx = new TimeSpan(30, 0, 0, 0);

            DateTime sada = DateTime.Now;
            sada = sada.ToUniversalTime();
            sada = sada.Subtract(xxx);

            //   DateTime opet = sada;

            string procedura = "'" + sada.Year.ToString() + sada.Month.ToString().PadLeft(2, '0') + sada.Day.ToString().PadLeft(2, '0') + " " + sada.Hour.ToString().PadLeft(2, '0') + ":" + sada.Minute.ToString().PadLeft(2, '0') + "'";

            // pokrenuti neku proceduru koja ce izbrisati sve istekle oglase gde je date < sada!!!!(ne jednako vec manji!!!!)

            string adresa = AppDomain.CurrentDomain.BaseDirectory;

            SqlConnection conn = new SqlConnection(Konekcija.CS());
            SqlDataAdapter adapt = new SqlDataAdapter("EXEC Brisanje_isteklih " + procedura, conn);  //umesto procedura stavio modifikovan datum
            DataTable tab = new DataTable();
            adapt.Fill(tab);



            for (int j = 0; j < tab.Rows.Count; j++)
            {


                string id = tab.Rows[j]["ID"].ToString();
                if (Directory.Exists(adresa + "\\Slike\\" + id + "\\"))
                {

                    Directory.Delete(adresa + "\\Slike\\" + id + "\\", true);



                }

                //else
                //{


                //    string prove = "ne postoji";
                //}


            }

        }


        [WebMethod]
        public static void ObrisiSve()
        {

            //DateTime xxx = new DateTime(0, 0, 30);

            TimeSpan xxx = new TimeSpan(30, 0, 0, 0);

            DateTime sada = DateTime.Now;
            sada = sada.ToUniversalTime();
            sada = sada.Subtract(xxx);

            //   DateTime opet = sada;

            string procedura = "'" + sada.Year.ToString() + sada.Month.ToString().PadLeft(2, '0') + sada.Day.ToString().PadLeft(2, '0') + " " + sada.Hour.ToString().PadLeft(2, '0') + ":" + sada.Minute.ToString().PadLeft(2, '0') + "'";

            // pokrenuti neku proceduru koja ce izbrisati sve istekle oglase gde je date < sada!!!!(ne jednako vec manji!!!!)

            string adresa = AppDomain.CurrentDomain.BaseDirectory;

            SqlConnection conn = new SqlConnection(Konekcija.CS());
            SqlDataAdapter adapt = new SqlDataAdapter("EXEC Brisanje_isteklih " + procedura, conn);  //umesto procedura stavio modifikovan datum
            DataTable tab = new DataTable();
            adapt.Fill(tab);



            for (int j = 0; j < tab.Rows.Count; j++)
            {


                string id = tab.Rows[j]["ID"].ToString();
                if (Directory.Exists(adresa + "\\Slike\\" + id + "\\"))
                {

                    Directory.Delete(adresa + "\\Slike\\" + id + "\\", true);



                }

                //else
                //{


                //    string prove = "ne postoji";
                //}





            }

        }

        [WebMethod]
        public static string brojIsteklih()
        {

            TimeSpan xxx = new TimeSpan(30, 0, 0, 0);

            DateTime sada = DateTime.Now;
            sada = sada.ToUniversalTime();
            sada = sada.Subtract(xxx);

            //   DateTime opet = sada;

            string procedura = "'" + sada.Year.ToString() + sada.Month.ToString().PadLeft(2, '0') + sada.Day.ToString().PadLeft(2, '0') + " " + sada.Hour.ToString().PadLeft(2, '0') + ":" + sada.Minute.ToString().PadLeft(2, '0') + "'";
            SqlConnection conn = new SqlConnection(Konekcija.CS());
            SqlCommand komanda = new SqlCommand("SELECT COUNT(AUTI.ID) FROM AUTI WHERE Unos_vreme < " + procedura, conn);
            conn.Open();
            int broj = (int)komanda.ExecuteScalar();
            conn.Close();

            return broj + "";
            


        }


    }
}