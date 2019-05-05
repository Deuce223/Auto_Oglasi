using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using System.IO;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication42
{
    /// <summary>
    /// Summary description for Handler2
    /// </summary>
    public class Handler2 : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {

            string vlasnik = context.Session["ID"].ToString();
            string idVozila = context.Request["idVozila"];


            string test = "1";

         

           


            
            //string marka = context.Request["marka"];

            ////if(marka != context.Session["podaci"].ToString())
            ////{

            ////    context.Request.Params.Keys
           





            ////}


            DataTable podaci = (DataTable)context.Session["info"];

            foreach (string k in context.Request.Form.Keys)
            {

                string provera1 = k;   //kljucevi
                string check = context.Request[k]; // vrednosti

                if(k == "oprema")
                {

                    if (context.Request["oprema"] != "[]")
                    {

                        string[] oprema = JsonConvert.DeserializeObject<string[]>(context.Request["oprema"]);
                      //  string provera = "1";
                        DataTable opremica = (DataTable)context.Session["gear"];

                        int duzina = opremica.Rows.Count;
                        bool prov = false;


                        if(opremica.Rows.Count != 0)
                        {

                            for (int i = 0; i < oprema.Length; i++)
                            {

                                for (int j = 0; j < opremica.Rows.Count; j++)
                                {

                                    if (oprema[i] != opremica.Rows[j]["Naziv"].ToString())
                                    {


                                        prov = true;

                                    }

                                    else
                                    {


                                        prov = false;
                                        break;


                                    }



                                }

                                if (prov)
                                {


                                    SqlConnection conn = new SqlConnection(Konekcija.CS());
                                    SqlCommand komanda_unos = new SqlCommand("INSERT INTO DODATNA(Naziv,Kola) VALUES(" + "'" + oprema[i] + "', " + idVozila + ")", conn);
                                    conn.Open();
                                    komanda_unos.ExecuteNonQuery();
                                    conn.Close();
                                    prov = false;


                                }

                            }

                            bool check1 = false;
                            for (int brojac = 0; brojac < opremica.Rows.Count; brojac++)
                            {

                                for (int l = 0; l < oprema.Length; l++)
                                {

                                    if (opremica.Rows[brojac]["Naziv"].ToString() != oprema[l])             /*oprema[k] != opremica.Rows[l]["Naziv"].ToString()*/
                                    {


                                        check1 = true;

                                    }

                                    else
                                    {


                                        check1 = false;
                                        break;


                                    }



                                }

                                if (check1)
                                {


                                    SqlConnection conn = new SqlConnection(Konekcija.CS());
                                    SqlCommand komanda_brisanje = new SqlCommand("DELETE FROM DODATNA WHERE Naziv = " + "'" + opremica.Rows[brojac]["Naziv"].ToString() + "'", conn);
                                    conn.Open();
                                    komanda_brisanje.ExecuteNonQuery();
                                    conn.Close();
                                    check1 = false;


                                }

                            }


                        }

                        else
                        {


                            for(int i = 0; i < oprema.Length; i++)
                            {

                                SqlConnection conn = new SqlConnection(Konekcija.CS());
                                SqlCommand komanda_unos = new SqlCommand("INSERT INTO DODATNA(Naziv,Kola) VALUES(" + "'" + oprema[i] + "', " + idVozila + ")", conn);
                                conn.Open();
                                komanda_unos.ExecuteNonQuery();
                                conn.Close();


                            }




                        }

             

                    }

                    else
                    {

                        DataTable opremica = (DataTable)context.Session["gear"];
                        if (opremica.Rows.Count != 0)
                        {


                            SqlConnection conn = new SqlConnection(Konekcija.CS());
                            SqlCommand obrisi_opremu = new SqlCommand("DELETE FROM DODATNA WHERE Kola = " + idVozila, conn);
                            conn.Open();
                            obrisi_opremu.ExecuteNonQuery();
                            conn.Close();


                        }


                    }

                }

                else if (k == "linkovizaBrisanje")
                {


                    if (context.Request["linkovizaBrisanje"] != "[]")
                    {


                        string[] del_slike = JsonConvert.DeserializeObject<string[]>(context.Request["linkovizaBrisanje"]);

                        for (int i = 0; i < del_slike.Length; i++)
                        {

                            string location = AppContext.BaseDirectory + del_slike[i];

                            location.Replace('/', '\\');

                            string provera = location.Replace("/", "\\");
                            File.Delete(provera);

                            SqlConnection conn = new SqlConnection(Konekcija.CS());
                            SqlCommand komanda = new SqlCommand("DELETE FROM SLIKE WHERE SLIKA = '" + del_slike[i] + "'", conn);
                            conn.Open();
                            komanda.ExecuteNonQuery();
                            conn.Close();


                            //onda obrisati iz baze jedan po jedan!

                        }


                    }


                }


                else
                {
                    if(k!= "idVozila")
                    {
                        if(k == "registrovan_do")
                        {

                            //check = check.Replace("'", "");
                            DateTime sada = DateTime.Now;
                            string vreme1;
                            if(podaci.Rows[0]["Registrovan_do"].ToString() != "")
                            {

                                DateTime vreme = (DateTime)podaci.Rows[0]["Registrovan_do"];
                                vreme1 = "'" + vreme.Year.ToString() + vreme.Month.ToString().PadLeft(2, '0') + sada.Day.ToString().PadLeft(2, '0') + "'";

                            }

                            else
                            {

                                vreme1 = podaci.Rows[0]["Registrovan_do"].ToString();
                                   

                            }
                           
                            if(check != vreme1)
                            {

                                SqlConnection conn = new SqlConnection(Konekcija.CS());
                                SqlCommand update_glavni = new SqlCommand("UPDATE AUTI SET " + k + " = " + check + " WHERE ID = " + idVozila, conn);
                                conn.Open();
                                update_glavni.ExecuteNonQuery();
                                conn.Close();

                            }

                        }

                       else if (check != podaci.Rows[0][k].ToString())
                        {


                            SqlConnection conn = new SqlConnection(Konekcija.CS());

                            //if (k == "registrovan_do")
                            //{

                            SqlCommand update_glavni = new SqlCommand("UPDATE AUTI SET " + k + " = " + "'" + check + "'" + " WHERE ID = " + idVozila, conn);
                            conn.Open();
                            update_glavni.ExecuteNonQuery();
                            conn.Close();


                            //}

                            //else
                            //{

                            //SqlCommand update_glavni = new SqlCommand("UPDATE AUTI SET " + k + " = " + "'" + check + "'" + " WHERE ID = " + idVozila, conn);
                            //    conn.Open();
                            //    update_glavni.ExecuteNonQuery();
                            //    conn.Close();

                            //}


                        }


                    }

              

                }
            }


            if (context.Request.Files.Count > 0)
            {

                int broj_fajlova = context.Request.Files.Count;

                if(!Directory.Exists(context.Server.MapPath("~/Slike/"+ idVozila + "/")))
                {

                    Directory.CreateDirectory(context.Server.MapPath("~/Slike/" + idVozila + "/"));

                }


                for (int i = 0; i < context.Request.Files.Count; i++)
                {

                    HttpPostedFile fajl = context.Request.Files[i];
                    // string lokacija = AppDomain.CurrentDomain.BaseDirectory;




                    for (int j = 0; j < 10; j++)
                    {

                        string folderPath = context.Server.MapPath("~/Slike/" + idVozila + "/");
                        string ekstenzija = fajl.FileName;
                        string[] niz = ekstenzija.Split('.');
                        string novo_ime = j + "." + niz[1];
                        string cekiranje = folderPath + novo_ime;


                        if (!File.Exists(cekiranje))
                        {

                            ////string postojeci = context.Server.MapPath("~/Slike/" + novo_ime);
                            //continue;
                            fajl.SaveAs(folderPath + novo_ime);

                            SqlConnection conn = new SqlConnection(Konekcija.CS());
                            SqlCommand komanda2 = new SqlCommand("INSERT INTO Slike(Slika,Automobil) VALUES(" + "'" + "Slike/" + idVozila + "/" + novo_ime + "', " + idVozila + ")", conn);
                            conn.Open();
                            komanda2.ExecuteNonQuery();
                            conn.Close();

                            break;



                        }


                    }


                    //File.Exists(folderPath + novo_ime);
                    // upis fajla

                }




            }



            //string model = context.Request["model"];
            //string oznaka = context.Request["oznaka"];
            //string godiste = context.Request["godiste"];
            //string karoserija = context.Request["karoserija"];
            //string gorivo = context.Request["gorivo"];
            //string kubikaza = context.Request["kubikaza"];
            //string snaga = context.Request["snaga"];
            //string kilometraza = context.Request["kilometraza"];
            //string pogon = context.Request["pogon"];

            //string menjac = context.Request["menjac"];
            //string brojVrata = context.Request["brojVrata"];
            //string stranaVolana = context.Request["stranaVolana"];
            //string boja = context.Request["boja"];
            //string porekloVozila = context.Request["porekloVozila"];
            //string registrovanDo = context.Request["registrovanDo"];
            //string klima = context.Request["klima"];
            //string cena = context.Request["cena"];
            //string lokacija = context.Request["lokacija"];
            //string zamena = context.Request["zamena"];


            ////    string vlasnik = context.Session["ID"].ToString();

            //string text = context.Request["text"];
            //string cena_status = context.Request["cena_status"];



            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            Rez C1 = new Rez();
            C1.rezultat = "OK";
            string dzejson = JsonConvert.SerializeObject(C1);
            context.Response.Write(dzejson);

       
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }

    public class Rez
    {

       public string rezultat { set; get; }

    }
}