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
    public partial class WebForm2 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            //Response.Cache.SetNoStore();

            List<string> heder = new List<string>();
            List<string> strana = new List<string>();
            List<string> karakteristike = new List<string>();

            List<string> dodatna_oprema = new List<string>();


            List<string> pictures = new List<string>();

            DateTime razlika = new DateTime();

            string ID = Request.QueryString["ID"];

         //   string CS = ("Data Source=DESKTOP-BL84MTN\\SQLEXPRESS;Initial Catalog=AUTOMOBILI;Integrated Security=True;MultipleActiveResultSets=True");
            SqlConnection conn = new SqlConnection(Konekcija.CS());
            SqlDataAdapter adapt = new SqlDataAdapter("EXEC Detalj " + ID, conn);

            DataSet set = new DataSet();

            DataTable podaci = new DataTable();
            DataTable oprema = new DataTable();
            DataTable slike = new DataTable();

            adapt.Fill(set);

            podaci = set.Tables[0];
            oprema = set.Tables[2];
            slike = set.Tables[1];


            OtisakNovi C1 = new OtisakNovi();
            C1.marka = podaci.Rows[0][1].ToString();
            C1.model = podaci.Rows[0][2].ToString();
            C1.karoserija = podaci.Rows[0][3].ToString();
            C1.gorivo = podaci.Rows[0][4].ToString();
            C1.vrata = podaci.Rows[0][5].ToString();
            C1.lokacija = podaci.Rows[0][6].ToString();
            C1.vremeUnosa = podaci.Rows[0][7].ToString();
            C1.cena = podaci.Rows[0][8].ToString();
            C1.godiste = podaci.Rows[0][9].ToString();
            C1.kilometraza = podaci.Rows[0][10].ToString();
            C1.oznaka = podaci.Rows[0][11].ToString();
            C1.kubikaza = podaci.Rows[0][12].ToString();
            C1.menjac = podaci.Rows[0][13].ToString();
            C1.snaga_konja = podaci.Rows[0][14].ToString();
            C1.volan = podaci.Rows[0][15].ToString();
            C1.pogon = podaci.Rows[0][16].ToString();
            C1.regDo = podaci.Rows[0][17].ToString();
            C1.cenaStatus = podaci.Rows[0][18].ToString();
            C1.zamena = podaci.Rows[0][19].ToString();
            C1.boja = podaci.Rows[0][20].ToString();
            C1.klima = podaci.Rows[0][21].ToString();
            C1.poreklo = podaci.Rows[0][22].ToString();
            C1.opis = podaci.Rows[0][23].ToString();
            C1.vlasnik = podaci.Rows[0][24].ToString();

            if(oprema.Rows.Count != 0)
            {
                for(int brojac = 0; brojac < oprema.Rows.Count; brojac++)
                {

                    dodatna_oprema.Add(oprema.Rows[brojac]["Naziv"].ToString());

                }

            }

            if(slike.Rows.Count != 0)
            {

                for(int ggg = 0; ggg< slike.Rows.Count; ggg++)
                {

                    pictures.Add(slike.Rows[ggg]["Slika"].ToString());

                }

            }


            //SqlCommand komanda = new SqlCommand("SELECT AUTI.ID, Marka.Naziv, Modeli.Model, Karoserija.Naziv, Gorivo.Naziv, Vrata.Naziv, Lokacija.Naziv, Unos_vreme, Cena, Godiste, Kilometraza, Oznaka, Kubikaza, Menjac.Naziv, Slika, Snaga, Volan.Naziv, Pogon.Naziv, Registrovan_do, Status_CENE.Naziv, ZAMENA.Naziv, BOJA.Naziv, KLIMA.Naziv, Poreklo.Naziv, DODATNA.Naziv, Opis, Vlasnik FROM AUTI INNER JOIN Marka ON Marka.ID = AUTI.Marka INNER JOIN Modeli ON Modeli.ID = Auti.Model INNER JOIN Karoserija ON Karoserija.ID = Auti.Karoserija INNER JOIN Gorivo ON Gorivo.ID = Auti.Gorivo INNER JOIN Vrata ON Vrata.ID = Auti.Vrata INNER JOIN Lokacija ON Lokacija.ID = Auti.Lokacija INNER JOIN Menjac ON Menjac.ID = Auti.Menjac INNER JOIN Status_CENE ON Status_CENE.ID = AUTI.Cena_status INNER JOIN ZAMENA ON ZAMENA.ID = AUTI.Zamena INNER JOIN VOLAN ON VOLAN.ID = AUTI.VOLAN INNER JOIN POGON ON POGON.ID = AUTI.POGON INNER JOIN BOJA ON BOJA.ID = AUTI.Boja LEFT JOIN KLIMA ON KLIMA.ID = Auti.Klima INNER JOIN POREKLO ON POREKLO.ID = AUTI.Poreklo LEFT JOIN DODATNA ON DODATNA.Kola = AUTI.ID LEFT JOIN SLIKE ON SLIKE.AUTOMOBIL = Auti.ID WHERE AUTI.ID = " + ID, conn);
            //conn.Open();
            //SqlDataReader citac = komanda.ExecuteReader();

            //OtisakNovi C1 = new OtisakNovi();
            //string prvi = "";
            //string drugi = "";

            //string slika = "";
            //string slika1 = "";
            //string oprema = "";
            //string oprema1 = "";

            //bool provera = true;
            //string oprema_prvi = "";
            //if (citac.HasRows)
            //{


            //    //moze da bude samo jedan red ako ima samo jedna slika, pogledati da li to menja nesto za ovaj kod!!!!!!!!!!!!
            //    while (citac.Read())
            //    {
            //        prvi = citac[0].ToString();
            //        slika = citac[14].ToString();
            //        oprema = citac[24].ToString();

            //        if (provera)
            //        {

            //            provera = false;
            //            oprema_prvi = citac[24].ToString();

            //        }


            //        if (prvi == drugi)
            //        {

            //            if (oprema != oprema1)
            //            {

            //                dodatna_oprema.Add(citac[24].ToString());
            //            }

            //            else
            //            {
            //                if (oprema == oprema_prvi)
            //                {

            //                    pictures.Add(citac[14].ToString());

            //                }

            //            }


            //        }

            //        else
            //        {


            //            C1.marka = citac[1].ToString();
            //            C1.model = citac[2].ToString();
            //            C1.karoserija = citac[3].ToString();
            //            C1.gorivo = citac[4].ToString();
            //            C1.vrata = citac[5].ToString();
            //            C1.lokacija = citac[6].ToString();
            //            C1.vremeUnosa = citac[7].ToString();
            //            razlika = Convert.ToDateTime(citac[7]);
            //            C1.cena = citac[8].ToString();
            //            C1.godiste = citac[9].ToString();
            //            C1.kilometraza = citac[10].ToString();
            //            C1.oznaka = citac[11].ToString();
            //            C1.kubikaza = citac[12].ToString();
            //            C1.menjac = citac[13].ToString();


            //            if (citac[14].ToString() != "")
            //            {
            //                pictures.Add(citac[14].ToString());

            //            }


            //            C1.snaga_konja = citac[15].ToString();
            //            C1.volan = citac[16].ToString();
            //            C1.pogon = citac[17].ToString();
            //            C1.regDo = citac[18].ToString();
            //            C1.cenaStatus = citac[19].ToString();
            //            C1.zamena = citac[20].ToString();
            //            C1.boja = citac[21].ToString();
            //            C1.klima = citac[22].ToString();
            //            C1.poreklo = citac[23].ToString();



            //            if (citac[24].ToString() != "")
            //            {
            //                dodatna_oprema.Add(citac[24].ToString());

            //            }

            //            C1.opis = citac[25].ToString();
            //            C1.vlasnik = citac[26].ToString();

            //        }


            //        drugi = citac[0].ToString();
            //        slika1 = citac[14].ToString();
            //        oprema1 = citac[24].ToString();

            //    }

            //}

            //conn.Close(); //ovde je komantar stop!

            poruka.Attributes.Add("name", C1.vlasnik);

            //if (Session["STANJE"].ToString() == "2" || Session["STANJE"].ToString() == "")
            //{

            //    poruka.Attributes.Add("class", "skriven");

            //}

            string proveraxx = Session["ID"].ToString();

            if(C1.vlasnik == Session["ID"].ToString())
            {


                poruka.Attributes.Add("style", "display:none");

            }

            else
            {

                poruka.Attributes.Remove("style");

            }

            if(Session["ID"].ToString() != "")
            {

                C1.log = "da";


            }

            else
            {


                C1.log = "ne";

            }

            karakteristike.Add(C1.menjac);
            karakteristike.Add(C1.pogon);
            karakteristike.Add(C1.klima);
            karakteristike.Add(C1.volan);
            karakteristike.Add(C1.regDo);
            karakteristike.Add(C1.boja);
            karakteristike.Add(C1.vrata);


            Dictionary<string, string> karakteri = new Dictionary<string, string>();
            karakteri.Add("Menjač", C1.menjac);
            karakteri.Add("Pogon", C1.pogon);
            karakteri.Add("Klima", C1.klima);
            karakteri.Add("Strana volana", C1.volan);
            karakteri.Add("Registrovan do", C1.regDo);
            karakteri.Add("Boja", C1.boja);
            karakteri.Add("Vrata", C1.vrata);
            karakteri.Add("Poreklo", C1.poreklo);


            prvi_desno.InnerHtml = "";
            prvi_levo.InnerHtml = "";
            drugi_desno.InnerHtml = "";
            drugi_levo.InnerHtml = "";

            for (int i = 0; i < karakteri.Count; i++)
            {

                if (i < 5)
                {
                    //if(karakteri.ElementAt(i).Value != "")
                    //  {
                    prvi_desno.InnerHtml += "<p>" + karakteri.ElementAt(i).Value + "</p>";
                    prvi_levo.InnerHtml += "<p>" + karakteri.ElementAt(i).Key + "</p>";

                    //   }


                }

                else
                {
                    //   if (karakteri.ElementAt(i).Value != "")
                    //   {

                    drugi_desno.InnerHtml += "<p>" + karakteri.ElementAt(i).Value + "</p>";
                    drugi_levo.InnerHtml += "<p>" + karakteri.ElementAt(i).Key + "</p>";

                    //   }


                }

            }

            //foreach(string karakt in karakteristike)
            //{

            //    prvi_desno.InnerHtml += "<p>" + karakt + "</p>";

            //}


            //if (pictures.Count == 1 && pictures[0] == "")
            //{
            //    pictures.Add("1024px-No_image_available.png");
            //    pictures.RemoveAt(0);

            //}

            if (pictures.Count == 0)
            {
                pictures.Add("1024px-No_image_available.png");


            }

            else
            {

                for (int k = 0; k < pictures.Count; k++)
                {

                    pictures[k] = pictures[k] + "?id=" + k;


                }


            }

            C1.slike = pictures;



            string jvratiti = JsonConvert.SerializeObject(C1);

            moj1.InnerText = jvratiti;

            int broj = dodatna_oprema.Count;

            //List<string> naslov1 = new List<string>();
            //naslov1.Add(C1.marka);
            //naslov1.Add(C1.model);
            //naslov1.Add(C1.oznaka);
            //naslov1.Add(C1.godiste);

            //foreach(string k in naslov1)
            //{

            //    naslov.InnerText += k + " ";


            //}


            //DateTime trenutno = DateTime.Now;             //ubaciti ovo u klasu
            //TimeSpan diff1 = trenutno.Subtract(razlika);
            //double brojDana = Math.Floor(diff1.TotalDays);

            ////double konjaza = Math.Round(Convert.ToInt32(C1.snaga) / 0.73549875);

            //string postavka;
            //if (brojDana == 0)
            //{

            //    postavka = "danas";

            //}
            //else
            //{

            //    postavka = "pre " + brojDana + " dana";

            //}
          // sve ovo oko 
            
            naslov.InnerHtml = C1.marka + " " + C1.model + " " + C1.oznaka + " " + C1.godiste + ". <span>godište</span>";

            //if(C1.cena == "Cena po dogovoru")
            //{

            //    side.InnerHtml = "<h3 class=" + "cenaside" + ">" + C1.cena;

            //}

            //else
            //{

            //    side.InnerHtml = "<h3 class=" + "cenaside" + ">" + C1.cena + '\u20AC';

            //}

            side.InnerHtml = "<h3 class=" + "'cenaside'" +  ">" + C1.cena  + "</h3>" + "<p>" + C1.marka + "</p>" + "<p>" + C1.model + "</p>" + "<p>" + C1.godiste + " god." + "</p>" + "<p>" + C1.karoserija + "</p>" + "<p>" + C1.gorivo + "</p>" + "<p>" + C1.kubikaza + "cm\xB3" + "</p>"+ "<p>" + C1.snaga_konja + "</p>" + "<p>" + C1.cenaStatus + "</p>" + "<p class=" + "'deblje'" + ">" + C1.zamena + "</p >" + "<p class=" + "'deblje'" + ">" + "Postavljeno: " + C1.vremeUnosa + "</p>";

            prvi_oprema.InnerHtml = "";
            drugi_oprema.InnerHtml = "";
            treci_oprema.InnerHtml = "";


            if(dodatna_oprema.Count > 0)
            {
                for(int k = 0; k < dodatna_oprema.Count; k++)
                {

                    if(k % 3 == 0)
                    {

                        prvi_oprema.InnerHtml += "<p>" + dodatna_oprema[k] + "</p>";

                    }

                    else if (k % 3 == 1)
                    {

                        drugi_oprema.InnerHtml += "<p>" + dodatna_oprema[k] + "</p>";

                    }

                    else if (k % 3 == 2)
                    {

                        treci_oprema.InnerHtml += "<p>" + dodatna_oprema[k] + "</p>";

                    }


                }

            }

            else
            {

                opremaX.Style.Add("display", "none");

            }


            if(C1.opis != "")
            {

                opisni.InnerHtml = "";

                opisni.InnerHtml += C1.opis;


            }

            else
            {

                opis.Style.Add("display", "none");

            }
     

        }


    }


    public class OtisakNovi
    {
       
        DateTime vremeUns;
        string cena_tt;
        DateTime registracija;
        bool provera;
        string sng_knj;
        double konjaza;
        string postavka;

        public string marka { set; get; }
        public string model { set; get; }
        public string karoserija { set; get; }
        public string gorivo { set; get; }
        public string vrata { set; get; }
        public string lokacija { set; get; }
        public string vremeUnosa
        {
            set
            {
                vremeUns = Convert.ToDateTime(value);
                DateTime sada = DateTime.Now;

                TimeSpan diff1 = sada.Subtract(vremeUns);
                double brojDana = Math.Floor(diff1.TotalDays);

                //double konjaza = Math.Round(Convert.ToInt32(C1.snaga) / 0.73549875);

                
                if (brojDana == 0)
                {

                    postavka = "danas";

                }
                else
                {

                    postavka = "pre " + brojDana + " dana";

                }



            }

            get
            {
                return postavka;

            }

        }
        public string cena
        {
            set
            {
                if (value == "")
                {

                    this.cena_tt = "Cena po dogovoru";

                }

                else
                {

                    this.cena_tt = value + '\u20AC';

                }

            }

            get
            {

                return this.cena_tt;


            }

        }





        public string godiste { set; get; }
        public string kilometraza { set; get; }
        public string oznaka { set; get; }
        public string kubikaza { set; get; }
        public string menjac { set; get; }
        public List<string> slike
        {
            set;get;


        }




        public string snaga_konja

        {

            set
            {
                

                this.sng_knj = value;

                this.konjaza = Math.Round(Convert.ToInt32(value) / 0.73549875);

            }

            get
            {
                
                return this.sng_knj + "/" + konjaza + "(kW/KS)";


            }
        }
        public string cenaStatus { set; get; }
        public string zamena { set; get; }
        public string volan { set; get; }
        public string pogon { set; get; }
        public string regDo
        {

            set
            {
                if(value != "")
                {
                    this.provera = true;
                    this.registracija = Convert.ToDateTime(value);

                }
                

            }

            get
            {
                if(this.provera)
                {

                    return this.registracija.Month + "." + this.registracija.Year;

                }

               else
                {

                    return "Nije registrovan";

                }

            }

        }

        public string boja { set; get; }
        public string klima { set; get; }
        public string poreklo { set; get; }
        public string opis { set; get; }
        public string vlasnik { set; get; }
        public string log { set; get; }
    }

}
