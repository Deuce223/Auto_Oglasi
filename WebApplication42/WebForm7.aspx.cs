using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace WebApplication42
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (/*Session["USERNAME"].ToString() == "" && */Session["STANJE"].ToString() == "2" || Session["STANJE"].ToString() == "")
            {


                Response.Redirect("Login.aspx?id=postavljanje");


            }

            else
            {

                if (!IsPostBack)
                {

                    //select gde su polja popunjavaju sa atributima tog auta iz baze!

              
                    SqlConnection conn = new SqlConnection(Konekcija.CS());
                    SqlDataAdapter adapt = new SqlDataAdapter("SELECT * FROM MARKA", conn);
                    DataTable marka = new DataTable();
                    adapt.Fill(marka);

                    DropDownList1.DataSource = marka;
                    DropDownList1.DataTextField = "Naziv";
                    DropDownList1.DataValueField = "ID";
                    DropDownList1.DataBind();


                    DropDownList1.Items.Insert(0, new ListItem("Marka", ""));



                    //ListItem proba = new ListItem("", "");
                    //proba.Enabled = false;
                    //DropDownList1.Items.Insert(0, proba);

                    adapt = new SqlDataAdapter("SELECT * FROM KAROSERIJA", conn);
                    DataTable karoserija = new DataTable();
                    adapt.Fill(karoserija);

                    DropDownList3.DataSource = karoserija;
                    DropDownList3.DataTextField = "Naziv";
                    DropDownList3.DataValueField = "ID";
                    DropDownList3.DataBind();

                    DropDownList3.Items.Insert(0, new ListItem("Karoserija", ""));

                    adapt = new SqlDataAdapter("SELECT * FROM Gorivo", conn);
                    DataTable gorivo = new DataTable();
                    adapt.Fill(gorivo);

                    DropDownList4.DataSource = gorivo;
                    DropDownList4.DataTextField = "Naziv";
                    DropDownList4.DataValueField = "ID";
                    DropDownList4.DataBind();

                    DropDownList4.Items.Insert(0, new ListItem("Gorivo", ""));

                    adapt = new SqlDataAdapter("SELECT * FROM POGON", conn);
                    DataTable pogon = new DataTable();
                    adapt.Fill(pogon);

                    DropDownList5.DataSource = pogon;
                    DropDownList5.DataTextField = "Naziv";
                    DropDownList5.DataValueField = "ID";
                    DropDownList5.DataBind();

                    DropDownList5.Items.Insert(0, new ListItem("Pogon", ""));

                    adapt = new SqlDataAdapter("SELECT * FROM Menjac", conn);
                    DataTable menjac = new DataTable();
                    adapt.Fill(menjac);

                    DropDownList6.DataSource = menjac;
                    DropDownList6.DataTextField = "Naziv";
                    DropDownList6.DataValueField = "ID";
                    DropDownList6.DataBind();

                    DropDownList6.Items.Insert(0, new ListItem("Menjac", ""));

                    adapt = new SqlDataAdapter("SELECT * FROM Vrata", conn);
                    DataTable vrata = new DataTable();
                    adapt.Fill(vrata);

                    DropDownList7.DataSource = vrata;
                    DropDownList7.DataTextField = "Naziv";
                    DropDownList7.DataValueField = "ID";
                    DropDownList7.DataBind();

                    DropDownList7.Items.Insert(0, new ListItem("Broj vrata", ""));

                    adapt = new SqlDataAdapter("SELECT * FROM VOLAN", conn);
                    DataTable volan = new DataTable();
                    adapt.Fill(volan);

                    DropDownList8.DataSource = volan;
                    DropDownList8.DataTextField = "Naziv";
                    DropDownList8.DataValueField = "ID";
                    DropDownList8.DataBind();

                    DropDownList8.Items.Insert(0, new ListItem("Strana volana", ""));

                    adapt = new SqlDataAdapter("SELECT * FROM BOJA", conn);
                    DataTable boja = new DataTable();
                    adapt.Fill(boja);

                    DropDownList9.DataSource = boja;
                    DropDownList9.DataTextField = "Naziv";
                    DropDownList9.DataValueField = "ID";
                    DropDownList9.DataBind();

                    DropDownList9.Items.Insert(0, new ListItem("Boja", ""));

                    adapt = new SqlDataAdapter("SELECT * FROM POREKLO", conn);
                    DataTable poreklo = new DataTable();
                    adapt.Fill(poreklo);

                    DropDownList10.DataSource = poreklo;
                    DropDownList10.DataTextField = "Naziv";
                    DropDownList10.DataValueField = "ID";
                    DropDownList10.DataBind();

                    DropDownList10.Items.Insert(0, new ListItem("Poreklo vozila", ""));

                    adapt = new SqlDataAdapter("SELECT * FROM KLIMA", conn);
                    DataTable klima = new DataTable();
                    adapt.Fill(klima);

                    DropDownList12.DataSource = klima;
                    DropDownList12.DataTextField = "Naziv";
                    DropDownList12.DataValueField = "ID";
                    DropDownList12.DataBind();

                    DropDownList12.Items.Insert(0, new ListItem("Klima", ""));




                    //registrovan do

                    DateTime sada = DateTime.Now;
                    Dictionary<string, string> recnik = new Dictionary<string, string>();

                    recnik.Add("Nije registrovan", "NULL");

                    for (int i = 0; i < 13; i++)
                    {

                        string Text = "" + sada.Month + "." + sada.Year;
                        string Value = "'" + sada.Year + sada.Month.ToString().PadLeft(2, '0') + sada.Day.ToString().PadLeft(2, '0') + "'";
                        recnik.Add(Text, Value);
                        sada = sada.AddMonths(1);

                    }

                    DropDownList11.DataSource = recnik;
                    DropDownList11.DataValueField = "value";
                    DropDownList11.DataTextField = "key";
                    DropDownList11.DataBind();

                    DropDownList11.Items.Insert(0, new ListItem("Registracija", ""));



                    adapt = new SqlDataAdapter("SELECT * FROM Lokacija", conn);
                    DataTable lokacija = new DataTable();
                    adapt.Fill(lokacija);

                    DropDownList13.DataSource = lokacija;
                    DropDownList13.DataTextField = "Naziv";
                    DropDownList13.DataValueField = "ID";
                    DropDownList13.DataBind();

                    DropDownList13.Items.Insert(0, new ListItem("Lokacija", ""));

                    adapt = new SqlDataAdapter("SELECT * FROM Zamena", conn);
                    DataTable zamena = new DataTable();
                    adapt.Fill(zamena);

                    DropDownList14.DataSource = zamena;
                    DropDownList14.DataTextField = "Naziv";
                    DropDownList14.DataValueField = "ID";
                    DropDownList14.DataBind();

                    DropDownList14.Items.Insert(0, new ListItem("Zamena", ""));


                    string brojAuta = Request.QueryString["ID"];
                    SqlDataAdapter adapt1 = new SqlDataAdapter("EXEC Izmene_selekt " + brojAuta, conn);
                    DataSet ds = new DataSet();
                    adapt1.Fill(ds);

                    DataTable podaci = new DataTable();
                    DataTable oprema = new DataTable();
                    DataTable slike = new DataTable();

                    int duzina = oprema.Rows.Count;

             

                    podaci = ds.Tables[0];
                    oprema = ds.Tables[1];
                    slike = ds.Tables[2];

                    Session["info"] = podaci;
                    Session["gear"] = oprema;

                    DropDownList1.SelectedValue = podaci.Rows[0]["Marka"].ToString();


                    string vrednost = DropDownList1.SelectedValue;

                    if (DropDownList1.SelectedValue != "")
                    {
                        
                        DataTable model = new DataTable();
                        SqlDataAdapter adapt2 = new SqlDataAdapter("SELECT * FROM Modeli WHERE Marka = " + DropDownList1.SelectedValue, conn);
                        adapt2.Fill(model);

                        DropDownList2.DataSource = model;
                        DropDownList2.DataTextField = "Model";
                        DropDownList2.DataValueField = "ID";
                        DropDownList2.DataBind();

                        DropDownList2.Items.Insert(0, new ListItem("Model", ""));
                        DropDownList2.SelectedIndex = 1;

                    }

                    DropDownList2.SelectedValue = podaci.Rows[0]["Model"].ToString();
                    DropDownList3.SelectedValue = podaci.Rows[0]["Karoserija"].ToString();
                    DropDownList4.SelectedValue = podaci.Rows[0]["Gorivo"].ToString();
                    TextBox3.Text = podaci.Rows[0]["Snaga"].ToString();

                    int broj = Convert.ToInt32(podaci.Rows[0]["Snaga"]);
                    double konja = Math.Round(broj / 0.73549875);

                    TextBox4.Text = konja + "";
                    TextBox1.Text = podaci.Rows[0]["Godiste"].ToString();
                    TextBox2.Text = podaci.Rows[0]["Kubikaza"].ToString();

                    DropDownList7.SelectedValue = podaci.Rows[0]["Vrata"].ToString();
                    TextBox5.Text = podaci.Rows[0]["Kilometraza"].ToString();
                    DropDownList5.SelectedValue = podaci.Rows[0]["Pogon"].ToString();
                    DropDownList6.SelectedValue = podaci.Rows[0]["Menjac"].ToString();
                    DropDownList8.SelectedValue = podaci.Rows[0]["Volan"].ToString();
                    DropDownList9.SelectedValue = podaci.Rows[0]["Boja"].ToString();


                    if (podaci.Rows[0]["Registrovan_do"].ToString() != "")
                    {

                        DateTime vreme = (DateTime)podaci.Rows[0]["Registrovan_do"];
                        int trenutni_mesec = DateTime.Now.Month;
                        int kola_mesec = vreme.Month;

                        if(trenutni_mesec > kola_mesec)
                        {

                            DropDownList11.SelectedValue = "NULL";

                        }

                        else
                        {

                            string vreme1 = "'" + vreme.Year.ToString() + vreme.Month.ToString().PadLeft(2, '0') + sada.Day.ToString().PadLeft(2, '0') + "'";
                            DropDownList11.SelectedValue = vreme1;

                        }

           


                    }

                    else
                    {

                        DropDownList11.SelectedValue = "NULL";


                    }

                    DropDownList12.SelectedValue = podaci.Rows[0]["Klima"].ToString();
                    DropDownList13.SelectedValue = podaci.Rows[0]["Lokacija"].ToString();
                    DropDownList14.SelectedValue = podaci.Rows[0]["Zamena"].ToString();
                    DropDownList10.SelectedValue = podaci.Rows[0]["Poreklo"].ToString();
                    TextBox6.Text = podaci.Rows[0]["Cena"].ToString();
                    TextBox7.Text = podaci.Rows[0]["Oznaka"].ToString();
                    opis_vozila.InnerText = podaci.Rows[0]["OPIS"].ToString();

                    if (podaci.Rows[0]["Cena_status"].ToString() == "2") //cena checkbox
                    {

                        CheckBox1.Checked = true;

                    }

                    if (oprema.Rows.Count != 0)
                    {

                        for (int i = 0; i < oprema.Rows.Count; i++)
                        {

                            if (oprema.Rows[i]["Naziv"].ToString() == "Elektricni podizaci")
                            {

                                podizaci.Checked = true;

                            }

                            if (oprema.Rows[i]["Naziv"].ToString() == "Servo")
                            {

                                servo.Checked = true;

                            }

                            if (oprema.Rows[i]["Naziv"].ToString() == "Elektricni retrovizori")
                            {

                                Elektricni.Checked = true;

                            }

                            if (oprema.Rows[i]["Naziv"].ToString() == "Putni racunar")
                            {

                                Putni_racunar.Checked = true;

                            }

                            if (oprema.Rows[i]["Naziv"].ToString() == "Centralna brava")
                            {

                                centralna.Checked = true;

                            }

                            if (oprema.Rows[i]["Naziv"].ToString() == "Daljinsko zakljucavanje")
                            {

                                daljinsko.Checked = true;

                            }

                            if (oprema.Rows[i]["Naziv"].ToString() == "Metalik boja")
                            {

                                metalik.Checked = true;

                            }

                            if (oprema.Rows[i]["Naziv"].ToString() == "Tonirana stakla")
                            {

                                tonirana.Checked = true;

                            }

                        }


                    }

                    if(slike.Rows.Count != 0)
                    {
                        for(int j = 0; j < slike.Rows.Count; j++)
                        {
                            int broj1 = j + 1;
                            string slika = "slika" + broj1;
                            string br = "l" + broj1;
                            string r = "i" + broj1;
                            //glavni.FindControl("slika" + broj1); //ovo izgleda trazi samo serverske kontrole?!
                            HtmlControl C1 = (HtmlControl)glavni.FindControl(slika);

                            HtmlControl R1 = (HtmlControl)glavni.FindControl(r);
                            R1.Attributes.Remove("class");
                            R1.Attributes.Add("class", "slikica");

                            C1.Attributes.Add("src", slike.Rows[j]["Slika"].ToString() + "?id=" + j);  //dodajem neki q string
                          //  C1.Attributes.Add("alt", slike.Rows[j]["Del_slika"].ToString());
                            C1.Attributes.Add("name", slike.Rows[j]["ID"].ToString());
                            HtmlControl D1 = (HtmlControl)glavni.FindControl(br);
                            D1.Attributes.Add("class", "nevidljiv bazaslika");
                            D1.Attributes.CssStyle.Add("visibility", "visible");

                            //Type kk = slika1.GetType();
                            //string prov = kk.ToString();
                            //string prov1 = kk.ToString();




                        }
                      




                    }

 
                }

            }

        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            string vrednost = DropDownList1.SelectedValue;

            if (DropDownList1.SelectedValue != "")
            {
                SqlConnection conn = new SqlConnection(Konekcija.CS());
                DataTable model = new DataTable();
                SqlDataAdapter adapt = new SqlDataAdapter("SELECT * FROM Modeli WHERE Marka = " + DropDownList1.SelectedValue, conn);
                adapt.Fill(model);

                DropDownList2.DataSource = model;
                DropDownList2.DataTextField = "Model";
                DropDownList2.DataValueField = "ID";
                DropDownList2.DataBind();

                DropDownList2.Items.Insert(0, new ListItem("Model", ""));
                DropDownList2.SelectedIndex = 1;

            }

            else
            {

                DropDownList2.Items.Clear();

            }


        }

        [WebMethod]
        public static void Unos(string podaci)
        {
            //ovo treba da bude update!!!!!!!!!!

            string preuzimi = podaci;
            string preuzmi1 = podaci;

            //string vlasnik = HttpContext.Current.Session["ID"].ToString();

            //UpisOtisakIzmena C1 = JsonConvert.DeserializeObject<UpisOtisakIzmena>(podaci);

            ////unos u bazu!  
            //StringBuilder naredba = new StringBuilder();
            //naredba.Append("INSERT INTO AUTI(Marka, Model, Karoserija, Gorivo, Vrata, Lokacija, Cena, Godiste, Kilometraza, Oznaka, Kubikaza, Menjac, Snaga, Volan, Pogon, Registrovan_do, Boja, Klima, Poreklo, Zamena, Cena_status, Opis, Vlasnik) OUTPUT INSERTED.ID VALUES(");
            //naredba.Append(C1.marka + ", " + C1.model + ", " + C1.karoserija + ", " + C1.gorivo + ", " + C1.brojVrata + ", " + C1.lokacija + ", " + C1.cena + ", " + C1.godiste + ", " + C1.kilometraza + ", '" + C1.oznaka + "', " + C1.kubikaza + ", " + C1.menjac + ", '" + C1.snaga + "', " + C1.stranaVolana + ", " + C1.pogon + ", " + C1.registrovanDo + ", " + C1.boja + ", " + C1.klima + ", " + C1.porekloVozila + ", " + C1.zamena + ", " + C1.cena_status + ", '" + C1.text + "'" + ", " + vlasnik + ")");
            //StringBuilder naredbaSlike = new StringBuilder();
            ////StringBuilder naredbaZaBrisanje = new StringBuilder();
            ////  naredbaSlike.Append("INSERT INTO SLIKE(Slika,Redni) VALUES");




            //SqlConnection conn = new SqlConnection(Konekcija.CS());
            //SqlCommand komanda = new SqlCommand(naredba.ToString(), conn);
            ////SqlCommand komanda1;

            //conn.Open();
            //int brojReda = (int)komanda.ExecuteScalar();


            //if (C1.slike.Length != 0)
            //{
            //    for (int i = 0; i < C1.slike.Length; i++)
            //    {

            //        //if(i == C1.slike.Length - 1)
            //        //{

            //        //    naredbaSlike.Append("('" + C1.slike[i] + "', " + brojReda + ")");
            //        //    komanda = new SqlCommand(naredbaSlike.ToString(), conn);
            //        //    komanda.ExecuteNonQuery();

            //        //    break;

            //        //}

            //        naredbaSlike.Append("INSERT INTO PHOTOS(Slika, Del_Slika, Automobil) VALUES");
            //        naredbaSlike.Append("('" + C1.slike[i] + "', '" + C1.brisanje[i] + "', " + brojReda + ")");


            //        //naredbaSlike.Append("INSERT INTO SLIKE(Slika,Redni) VALUES");
            //        //naredbaZaBrisanje.Append("INSERT INTO DELETE_SLIKE(Slika,Redni) VALUES");
            //        //naredbaSlike.Append("('" + C1.slike[i] + "', " + brojReda + ")");
            //        //naredbaZaBrisanje.Append("('" + C1.brisanje[i] + "', " + brojReda + ")");

            //        komanda = new SqlCommand(naredbaSlike.ToString(), conn);
            //        //komanda1 = new SqlCommand(naredbaZaBrisanje.ToString(), conn);
            //        komanda.ExecuteNonQuery();
            //        //komanda1.ExecuteNonQuery();   
            //        naredbaSlike.Clear();
            //        //naredbaZaBrisanje.Clear();

            //    }

            //}


            //if (C1.oprema.Length != 0)
            //{
            //    for (int i = 0; i < C1.oprema.Length; i++)
            //    {

            //        //if(i == C1.slike.Length - 1)
            //        //{

            //        //    naredbaSlike.Append("('" + C1.slike[i] + "', " + brojReda + ")");
            //        //    komanda = new SqlCommand(naredbaSlike.ToString(), conn);
            //        //    komanda.ExecuteNonQuery();

            //        //    break;

            //        //}


            //        naredbaSlike.Append("INSERT INTO DODATNA(Naziv,Kola) VALUES");
            //        naredbaSlike.Append("('" + C1.oprema[i] + "', " + brojReda + ")");

            //        komanda = new SqlCommand(naredbaSlike.ToString(), conn);
            //        komanda.ExecuteNonQuery();
            //        naredbaSlike.Clear();

            //    }

            //}


            //conn.Close();

            //return "Unos USPESAN!";



        }

        [WebMethod]
        public static void ObrisiSliku(string id)
        {

            string provera = id;
            string provera1 = id;

            SqlConnection conn = new SqlConnection(Konekcija.CS());
            SqlCommand komanda = new SqlCommand("DELETE FROM PHOTOS WHERE ID = " + id, conn);
            conn.Open();
            komanda.ExecuteNonQuery();
            conn.Close();




        }

    }

    public class UpisOtisakIzmena
    {

        public string cena_prelaz;

        public int marka { set; get; }
        public int model { set; get; }
        public int karoserija { set; get; }
        public int gorivo { set; get; }
        public int brojVrata { set; get; }
        public int lokacija { set; get; }
        public string cena
        {
            set
            {
                if (value == "")
                {

                    cena_prelaz = "NULL";

                }

                else
                {

                    cena_prelaz = value;

                }

            }

            get
            {
                return cena_prelaz;


            }


        } //null ako je prazan objekat iz javaskripta!!!
        public int godiste { set; get; }
        public int kilometraza { set; get; }
        public string oznaka { set; get; } //oznaka string
        public int kubikaza { set; get; }
        public int menjac { set; get; }
        public string snaga { set; get; } //snaga je string
        public string registrovanDo { set; get; } // datum
        public int stranaVolana { set; get; }
        public int pogon { set; get; }
        //status cene check box
        // public int zamena { set; get; }
        public int boja { set; get; }
        public int klima { set; get; }
        public int porekloVozila { set; get; }
        public string[] slike { set; get; }
        public string[] brisanje { set; get; }
        public int zamena { set; get; }
        public int cena_status { set; get; }
        public string[] oprema { set; get; }
        public string text { set; get; }


    }
}