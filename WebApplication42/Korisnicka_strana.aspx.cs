using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using Newtonsoft.Json;
using System.IO;

namespace WebApplication42
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        public static string korisnik;
        public static string username;

        protected void Page_Load(object sender, EventArgs e)
        {

            //samo ako je ulogovan i sa pravim statusom, isto i za login setovati 

            //Response.Cache.SetNoStore();

            if (/*Session["USERNAME"].ToString() == "" && */Session["OVLASCENJE"].ToString() == "3" || Session["OVLASCENJE"].ToString() == "")
            {


                Response.Redirect("Login.aspx?id=postavljanje");


            }

            else
            {

                korisnik = Session["ID"].ToString();
                username = Session["USERNAME"].ToString();

                if(Session["OVLASCENJE"].ToString() == "2")
                {

                    info.Attributes.CssStyle.Add("display", "none");


                }
                //sakriti oglase!!!!!

            }

            
        }

        [WebMethod]
        public static string UpisiPoruku(string podaci)
        {

            //string nesto = podaci;
            //string nesto1 = podaci;

            List<Convo> listaNovihPoruka = new List<Convo>();

            InsertPoruka Poruka = new InsertPoruka();
            Poruka = JsonConvert.DeserializeObject<InsertPoruka>(podaci);

            SqlConnection conn = new SqlConnection(Konekcija.CS());

            //pre ovoga treba pogledati da li ima neka nova poruka!?

          //  SqlCommand komanda = new SqlCommand("EXEC unosPoruke " + Poruka.id + ", " + korisnik + ", '" + Poruka.textPoruke + "'", conn);


            SqlDataAdapter adapt = new SqlDataAdapter("EXEC unosPoruke " + Poruka.id + ", " + korisnik + ", '" + Poruka.textPoruke + "'", conn);
            DataTable tabela = new DataTable();
            adapt.Fill(tabela);

            if(tabela.Rows.Count != 0)
            {


                for(int i = 0; i < tabela.Rows.Count; i++)
                {


                    Convo D1 = new Convo();
                    D1.sadrzaj = tabela.Rows[i]["Sadrzaj"].ToString();
                    D1.username = tabela.Rows[i]["username"].ToString();
                    D1.datumKonverzija = (DateTime)tabela.Rows[i]["Datum"];
                    D1.stanje = tabela.Rows[i]["Stanje"].ToString();

                    if(D1.stanje == "2"){

                        D1.bold = "da";

                    }

                    else
                    {

                        D1.bold = "ne";

                    }

                    listaNovihPoruka.Add(D1);


                }

                Convo unet = new Convo();
                unet.sadrzaj = Poruka.textPoruke;
                unet.stanje = "1";
                unet.username = username;
                unet.datumKonverzija = DateTime.Now;
                unet.bold = "ne";
                listaNovihPoruka.Add(unet);


                ListConvo E1 = new ListConvo();
                E1.convo_lista = listaNovihPoruka;
                string dzejson = JsonConvert.SerializeObject(E1);
                return dzejson;
            }

            else
            {


                Convo unet = new Convo();
                unet.sadrzaj = Poruka.textPoruke;
                unet.stanje = "1";
                unet.username = username;
                unet.datumKonverzija = DateTime.Now;
                unet.bold = "ne";
                listaNovihPoruka.Add(unet);


                ListConvo E1 = new ListConvo();
                E1.convo_lista = listaNovihPoruka;
                string dzejson = JsonConvert.SerializeObject(E1);
                return dzejson;

               // return "nije bilo poruka u medjuvremenu";

            }


         //   conn.Open();
          //   SqlDataReader citac = komanda.ExecuteReader();

            
            //provera da li je neka nova poruka stigla u medjuvremenu!!!!!!
            //if (citac.HasRows)
            //{

            //    while (citac.HasRows)
            //    {

            //        slanjeOsvezi C1 = new slanjeOsvezi();

            //        C1.sadrzaj = citac[1].ToString();
            //        C1.poslao = citac[2].to




            //    }


            //}

        //    conn.Close();



        }



        [WebMethod]
        public static string Oglas(int offset, int tip_pretrage)
        {

            //int test = offset;
            //int test1 = tip_pretrage;

            //int test2 = tip_pretrage;
            //int test3 = offset;
            List<USerOglas> podaci = new List<USerOglas>();

            SqlConnection conn = new SqlConnection(Konekcija.CS());
            //SqlDataAdapter adapt = new SqlDataAdapter("SELECT AUti.ID, Marka, Model, Oznaka, Godiste, (SELECT TOP 1 SLika FROM PHOTOS WHERE AUti.ID = PHOTOS.AUtomobil) as Slika, (SELECT TOP 1 Del_slika FROM PHOTOS WHERE AUti.ID = PHOTOS.AUtomobil) as Del FROM AUTI WHERE Vlasnik = " + korisnik, conn);
            //  SqlDataAdapter adapt = new SqlDataAdapter("SELECT AUti.ID, Marka.Naziv as Marka, Modeli.Model, Oznaka, Godiste, (SELECT TOP 1 SLika FROM PHOTOS WHERE AUti.ID = PHOTOS.AUtomobil) as Slika, (SELECT TOP 1 Del_slika FROM PHOTOS WHERE AUti.ID = PHOTOS.AUtomobil) as Del, Vlasnik FROM AUTI INNER JOIN MARKA ON MARKA.ID = AUTI.Marka INNER JOIN modeli on modeli.id = auti.model  WHERE Vlasnik = " + korisnik, conn);
            SqlDataAdapter adapt = new SqlDataAdapter("EXEC IZBOR " + korisnik + ", " + offset + ", " + tip_pretrage , conn);
            DataSet ds = new DataSet();
            adapt.Fill(ds);



            if ( /*s.Container.Components.Count == 1*/ ds.Tables.Count == 1)
            {

                if (tip_pretrage == 1)
                {

                    //nema rezultata;
                    LISTA1 ins = new LISTA1();
                    ins.BrojStrana = -1;
                    string Dzejson = JsonConvert.SerializeObject(ins);
                    return Dzejson;
                    

                }




                else
                {

                    DataTable user_oglasi = new DataTable();
                 //   DataTable brojhitova = new DataTable();
                    user_oglasi = ds.Tables[0];
                 //   brojhitova = ds.Tables[0];
                    LISTA1 ins = new LISTA1();
                 //   ins.BrojStrana = (int)brojhitova.Rows[0][0];


                    for (int i = 0; i < user_oglasi.Rows.Count; i++)
                    {


                        USerOglas oglas = new USerOglas();
                        oglas.ID = user_oglasi.Rows[i]["ID"].ToString();
                        oglas.Marka = user_oglasi.Rows[i]["Marka"].ToString();
                        oglas.Model = user_oglasi.Rows[i]["Model"].ToString();
                        oglas.Oznaka = user_oglasi.Rows[i]["Oznaka"].ToString();
                        oglas.Godiste = user_oglasi.Rows[i]["Godiste"].ToString();
                     //   oglas.Slika = user_oglasi.Rows[i]["Slika"].ToString();




                      //  oglas.LinkZaBrisanje = user_oglasi.Rows[i]["Del"].ToString();
                        //   oglas.Vlasnik = user_oglasi.Rows[i]["Vlasnik"].ToString();

                        //if (i == 0)
                        //{
                        //    if (user_oglasi.Rows[i]["BrojPogodaka"].ToString() != "")
                        //    {
                        //        // oglas.BrojStrana = (int)user_oglasi.Rows[i]["BrojPogodaka"];
                        //        ins.BrojStrana = (int)user_oglasi.Rows[i]["BrojPogodaka"];

                        //    }

                        //}

                        podaci.Add(oglas);

                    }

                    string putanja = AppDomain.CurrentDomain.BaseDirectory + "Slike\\";

                    foreach(USerOglas C1 in podaci)
                    {
                        if(Directory.Exists(putanja + C1.ID + "\\"))
                        {

                            string[] fajlovi = Directory.GetFiles(putanja + C1.ID + "\\");
                            if (fajlovi.Length == 0)
                            {

                                C1.Slika = "1024px-No_image_available.png";

                            }

                            else
                            {

                                int lokacija = fajlovi[0].IndexOf("Slike");
                                string link = fajlovi[0].Substring(lokacija).Replace('\\', '/') + "?ime=Milos";

                                C1.Slika = link;
                                string prov = "";

                            }




                        }

                        else
                        {

                            C1.Slika = "1024px-No_image_available.png";


                        }
                    

                    }

                    ins.podaci = podaci;
                    string Dzejson = JsonConvert.SerializeObject(ins);

                    //   HttpContext.Current.Session["ListaOglasa"] = ins;

                    return Dzejson;



                }

            }

            else
            {

                DataTable user_oglasi = new DataTable();
                DataTable brojhitova = new DataTable();
                user_oglasi = ds.Tables[1];
                brojhitova = ds.Tables[0];
                LISTA1 ins = new LISTA1();
                ins.BrojStrana = (int)brojhitova.Rows[0][0];


                for (int i = 0; i < user_oglasi.Rows.Count; i++)
                {


                    USerOglas oglas = new USerOglas();
                    oglas.ID = user_oglasi.Rows[i]["ID"].ToString();
                    oglas.Marka = user_oglasi.Rows[i]["Marka"].ToString();
                    oglas.Model = user_oglasi.Rows[i]["Model"].ToString();
                    oglas.Oznaka = user_oglasi.Rows[i]["Oznaka"].ToString();
                    oglas.Godiste = user_oglasi.Rows[i]["Godiste"].ToString();
                 //   oglas.Slika = user_oglasi.Rows[i]["Slika"].ToString();
                  //  oglas.LinkZaBrisanje = user_oglasi.Rows[i]["Del"].ToString();
                    //   oglas.Vlasnik = user_oglasi.Rows[i]["Vlasnik"].ToString();

                    //if (i == 0)
                    //{
                    //    if (user_oglasi.Rows[i]["BrojPogodaka"].ToString() != "")
                    //    {
                    //        // oglas.BrojStrana = (int)user_oglasi.Rows[i]["BrojPogodaka"];
                    //        ins.BrojStrana = (int)user_oglasi.Rows[i]["BrojPogodaka"];

                    //    }

                    //}

                    podaci.Add(oglas);

                }

                string putanja = AppDomain.CurrentDomain.BaseDirectory + "Slike\\";

                foreach (USerOglas C1 in podaci)
                {
                    if (Directory.Exists(putanja + C1.ID + "\\"))
                    {

                        string[] fajlovi = Directory.GetFiles(putanja + C1.ID + "\\");
                        if (fajlovi.Length == 0)
                        {

                            C1.Slika = "1024px-No_image_available.png";

                        }

                        else
                        {

                            int lokacija = fajlovi[0].IndexOf("Slike");
                            string link = fajlovi[0].Substring(lokacija).Replace('\\', '/') + "?ime=Milos";

                            C1.Slika = link;
                            string prov = "";

                        }



                    }

                    else
                    {

                        C1.Slika = "1024px-No_image_available.png";


                    }


                }



                ins.podaci = podaci;
                string Dzejson = JsonConvert.SerializeObject(ins);

                //   HttpContext.Current.Session["ListaOglasa"] = ins;

                return Dzejson;


            }





                    //}


                    //      DataTable user_oglasi = new DataTable();
                    //      adapt.Fill(user_oglasi);

                    //  LISTA1 ins = new LISTA1();

                    //if (user_oglasi.Rows[0]["BrojPogodaka"].ToString() == "0")
                    //{


                    //    //nema rezultata nije postavio nijedan oglas
                    //    return "USER NIJE POSTAVIO NIJEDAN OGLAS";



                    //}

                    //else
                    //{

                    //    for (int i = 0; i < user_oglasi.Rows.Count; i++)
                    //    {


                    //        USerOglas oglas = new USerOglas();
                    //        oglas.ID = user_oglasi.Rows[i]["ID"].ToString();
                    //        oglas.Marka = user_oglasi.Rows[i]["Marka"].ToString();
                    //        oglas.Model = user_oglasi.Rows[i]["Model"].ToString();
                    //        oglas.Oznaka = user_oglasi.Rows[i]["Oznaka"].ToString();
                    //        oglas.Godiste = user_oglasi.Rows[i]["Godiste"].ToString();
                    //        oglas.Slika = user_oglasi.Rows[i]["Slika"].ToString();
                    //        oglas.LinkZaBrisanje = user_oglasi.Rows[i]["Del"].ToString();
                    //        //   oglas.Vlasnik = user_oglasi.Rows[i]["Vlasnik"].ToString();

                    //        if(i == 0)
                    //        {
                    //            if (user_oglasi.Rows[i]["BrojPogodaka"].ToString() != "")
                    //            {
                    //                // oglas.BrojStrana = (int)user_oglasi.Rows[i]["BrojPogodaka"];
                    //                ins.BrojStrana = (int)user_oglasi.Rows[i]["BrojPogodaka"];

                    //            }

                    //        }               

                    //        podaci.Add(oglas);

                    //    }

                    //    //LISTA1 ins = new LISTA1();
                    //    ins.podaci = podaci;
                    //    string Dzejson = JsonConvert.SerializeObject(ins);

                    //    //   HttpContext.Current.Session["ListaOglasa"] = ins;

                    //    return Dzejson;







                }

            //if(user_oglasi.Rows.Count != 0)
            //{

            //    for (int i = 0; i < user_oglasi.Rows.Count; i++)
            //    {


            //        USerOglas oglas = new USerOglas();
            //        oglas.ID = user_oglasi.Rows[i]["ID"].ToString();
            //        oglas.Marka = user_oglasi.Rows[i]["Marka"].ToString();
            //        oglas.Model = user_oglasi.Rows[i]["Model"].ToString();
            //        oglas.Oznaka = user_oglasi.Rows[i]["Oznaka"].ToString();
            //        oglas.Godiste = user_oglasi.Rows[i]["Godiste"].ToString();
            //        oglas.Slika = user_oglasi.Rows[i]["Slika"].ToString();
            //        oglas.LinkZaBrisanje = user_oglasi.Rows[i]["Del"].ToString();
            //     //   oglas.Vlasnik = user_oglasi.Rows[i]["Vlasnik"].ToString();

            //        podaci.Add(oglas);



            //    }

            //    LISTA1 ins = new LISTA1();
            //    ins.podaci = podaci;
            //    string Dzejson = JsonConvert.SerializeObject(ins);

            // //   HttpContext.Current.Session["ListaOglasa"] = ins;

            //    return Dzejson;


            //}

            //else
            //{

            //    return "USER NIJE POSTAVIO NIJEDAN OGLAS";


            //}





        


        [WebMethod]
        public static void Obrisi(string id)
        {

          //string adresa = Path.GetFullPath("~/Slike/" + id + "/");

          //  string add = System.IO.Directory.GetCurrentDirectory();

          //  string adr = AppDomain.CurrentDomain.BaseDirectory;

            string lokacija = HttpContext.Current.Server.MapPath("~/Slike/" + id + "/");
            if (Directory.Exists(lokacija))
            {

                Directory.Delete(lokacija, true);


            }


            //List<string> del = new List<string>();

            string preuzet = id;
            string preuzet1 = id;
            SqlConnection conn = new SqlConnection(Konekcija.CS());
            SqlCommand obrisi = new SqlCommand("EXEC BRISANJE_OGLASA " + id, conn);
            //SqlDataAdapter adapt = new SqlDataAdapter("EXEC BRISANJE_OGLASA " + id, conn);
            conn.Open();
            obrisi.ExecuteNonQuery();
            conn.Close();
            //obrisati slike sad u folderu

            //Directory.Delete("~/Slike/" + id);



         //   DataTable del_linkovi = new DataTable();
         //   adapt.Fill(del_linkovi);
         //   LinkDelete C1 = new LinkDelete();

         //   if (del_linkovi.Rows.Count != 0)
         //   {

         //       for (int j = 0; j < del_linkovi.Rows.Count; j++)
         //       {


         //           del.Add(del_linkovi.Rows[j]["Del_slika"].ToString());
         //          // del.Add(C1);




         //       }


         //   }

         //   C1.slika = del;

         //   string dzejson = JsonConvert.SerializeObject(C1);

      

         //   return dzejson;

         ////   return "milos";



        }

        [WebMethod]
        public static string Poruke()
        {
            List<PorukeOtisak> listica = new List<PorukeOtisak>();
            //string provera = korisnik;
            //return provera;

            //daj mi sve za trenutnog korisnika where povezanost je null
            SqlConnection conn = new SqlConnection(Konekcija.CS());
            // SqlDataAdapter adapt = new SqlDataAdapter("SELECT PORUKE.ID, Korisnici.USERNAME, Naslov, status_poruke FROM PORUKE INNER JOIN KORISNICI ON PORUKE.Poslao = KORISNICI.ID WHERE PRIMIO = " + korisnik + " AND POVEZANOST IS NULL ORDER BY PORUKE.ID DESC", conn);

            // NAPRAVITI NOVU KOMANDU!!!!!!

            //   SqlDataAdapter adapt = new SqlDataAdapter("SELECT * FROM PORUKE_PREGLED WHERE Poceo_chat = '" + username + "' OR Sagovornik = '" + username + "' ORDER BY DATUM DESC", conn);

            SqlDataAdapter adapt = new SqlDataAdapter("EXEC PROBNA " + korisnik + ", " + username, conn);

            DataTable tabela = new DataTable();
            adapt.Fill(tabela);

            if(tabela.Rows.Count != 0)
            {

                for(int i = 0; i < tabela.Rows.Count; i++)
                {

                    PorukeOtisak C1 = new PorukeOtisak();
                    C1.id = tabela.Rows[i]["ID"].ToString();
                    C1.naslov = tabela.Rows[i]["Naslov"].ToString();
                  //  C1.datum_poslednje_poruke = tabela.Rows[i]["DATUM"].ToString();
                    C1.status_poruke = tabela.Rows[i]["Stanje"].ToString();
                    C1.Poceo_chat = tabela.Rows[i]["Poceo_chat"].ToString();
                    C1.Sagovornik = tabela.Rows[i]["Sagovornik"].ToString();
                    
                   // C1.status_poruke = tabela.Rows[i]["status_poruke"].ToString();

                    listica.Add(C1);

                }

            }


            ListaPorukeOtisak D1 = new ListaPorukeOtisak();
            D1.podaci = listica;

           string dzejson = JsonConvert.SerializeObject(D1);
           return dzejson;

        }

        [WebMethod]
        public static string Convo1(string id)
        {
            List<Convo> convo = new List<Convo>();

            string provera = id;
            string provera1 = id;
            //return provera;

            

            SqlConnection conn = new SqlConnection(Konekcija.CS());
            SqlDataAdapter adapt = new SqlDataAdapter("EXEC Convo " + id + ", " + korisnik, conn);
            DataTable tabela = new DataTable();
            adapt.Fill(tabela);

            if(tabela.Rows.Count != 0)
            {
                for(int i = 0; i < tabela.Rows.Count; i++)
                {


                    Convo C1 = new Convo();
                 //   C1.id = tabela.Rows[i]["ID"].ToString();
                    C1.sadrzaj = tabela.Rows[i]["Sadrzaj"].ToString();
                    C1.username = tabela.Rows[i]["USERNAME"].ToString();
                    C1.datumKonverzija = (DateTime)tabela.Rows[i]["Datum"];
                    //C1.datum = tabela.Rows[i]["Datum"].ToString();
                    C1.stanje = tabela.Rows[i]["Stanje"].ToString();

                    if (C1.username != username)//VIDETI DA LI OVO MOZE DA SE PREMESTI U KLASU!!!!!mozda mi ovo i ne treba???
                    {

                        if (C1.stanje == "2")
                        {

                            C1.bold = "da";

                        }

                        else
                        {

                            C1.bold = "ne";

                        }
                       

                    }

                    else
                    {

                          C1.bold = "ne";


                    }

                    convo.Add(C1);

                }

            }

            ListConvo D1 = new ListConvo();
            D1.convo_lista = convo;

            string dzejson = JsonConvert.SerializeObject(D1);
            return dzejson;


            //pokupiti sve poruke za taj convo!!!!!!!!
            //upisati za taj convo id sve poruke obeleziti sa status!

        }

        public class Convo
        {

            private DateTime prelazni;

         //   public string id { set; get; }
            public string sadrzaj { set; get; }
            public string username { set; get; }
         //   public string chat { set; get; }
            public string stanje { set; get; }
            public string datum { set; get; }
            public string bold { set; get; }
            


            public DateTime datumKonverzija
            {
                set
                {

                    prelazni = value;
                    prelazni = prelazni.ToLocalTime();
                    datum = " poslato " + prelazni.Day.ToString().PadLeft(2,'0') + "." + prelazni.Month.ToString().PadLeft(2,'0') + "." + prelazni.Year.ToString() + "." + " u " + prelazni.Hour.ToString() + ":" + prelazni.Minute.ToString().PadLeft(2,'0');


                }




            }


        }

        public class ListConvo
        {

            public List<Convo> convo_lista { set; get; }

        }


        public class PorukeOtisak
        {
            public string id { set; get; }
            public string naslov { set; get; }
          //  public string datum_poslednje_poruke { set; get; }
            public string status_poruke { set; get; }
            public string Poceo_chat { set; get; }
            public string Sagovornik { set; get; }
        }

        public class ListaPorukeOtisak
        {

            public List<PorukeOtisak> podaci { set; get; }

        }


        public class USerOglas
        {
            //private double broj_pogodaka;

       
            public string ID { set; get; }
            public string Marka { set; get; }
            public string Model { set; get; }
            public string Oznaka { set; get; }
            public string Godiste { set; get; }
            public string Slika { set; get; }
          //  public string LinkZaBrisanje { set; get; }
         //   public string Vlasnik { set; get; }
         //public int BrojStrana
         //   {
         //       set
         //       {

         //           broj_pogodaka = value / 5;

         //       }

         //       get
         //       {

         //           return (int)Math.Ceiling(broj_pogodaka);


         //       }
               
         //   }



        }


        public class LISTA1
        {

            private double broj_pogodaka;
            public List<USerOglas> podaci { set; get; }
            public int BrojStrana
            {
                set
                {
                    if(value == -1)
                    {

                        broj_pogodaka = value;
                    }

                    else
                    {

                        broj_pogodaka = value / 5;

                    }
                  

                }

                get
                {

                    return (int)Math.Ceiling(broj_pogodaka);


                }

            }

        }

        public class LinkDelete
        {
            
            public List<string> slika { set; get; }
           

        }

        public class InsertPoruka
        {

            public string id { set; get; }
            public string textPoruke { set; get; }


        }
      

        public class slanjeOsvezi
        {

            public string sadrzaj { set; get; }
            public string poslao { set; get; }
            public string stanje { set; get; }
            public DateTime vreme { set; get; }
            public string datum { set; get; }


        }
    }
}