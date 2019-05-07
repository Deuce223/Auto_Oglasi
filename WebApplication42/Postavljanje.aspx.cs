using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System.Web.Services;
using System.Text;

namespace WebApplication42
{
    public partial class WebForm3 : System.Web.UI.Page
    {
       // static string CS = ("Data Source=DESKTOP-BL84MTN\\SQLEXPRESS;Initial Catalog=AUTOMOBILI;Integrated Security=True;MultipleActiveResultSets=True");

        protected void Page_Load(object sender, EventArgs e)
        {
             if(/*Session["USERNAME"].ToString() == "" && */Session["OVLASCENJE"].ToString() == "3" || Session["OVLASCENJE"].ToString() == "")
            {

                
                Response.Redirect("Login.aspx?id=postavljanje");


            }

            else
            {

                if (!IsPostBack)
                {

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
                        string Value = "'" +  sada.Year + sada.Month.ToString().PadLeft(2, '0') + sada.Day.ToString().PadLeft(2, '0') + "'";
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
        public static string Unos(string podaci)
        {


            string preuzimi = podaci;
            string preuzmi1 = podaci;

            string vlasnik = HttpContext.Current.Session["ID"].ToString();

            UpisOtisak C1 = JsonConvert.DeserializeObject<UpisOtisak>(podaci);
            
            //unos u bazu!  
            StringBuilder naredba = new StringBuilder();
            naredba.Append("INSERT INTO AUTI(Marka, Model, Karoserija, Gorivo, Vrata, Lokacija, Cena, Godiste, Kilometraza, Oznaka, Kubikaza, Menjac, Snaga, Volan, Pogon, Registrovan_do, Boja, Klima, Poreklo, Zamena, Cena_status, Opis, Vlasnik) OUTPUT INSERTED.ID VALUES(");
            naredba.Append(C1.marka + ", " + C1.model + ", " + C1.karoserija + ", " + C1.gorivo + ", " + C1.brojVrata + ", " + C1.lokacija + ", " + C1.cena + ", " + C1.godiste + ", " + C1.kilometraza + ", '" + C1.oznaka + "', " + C1.kubikaza + ", " + C1.menjac + ", '" + C1.snaga + "', " + C1.stranaVolana + ", " + C1.pogon + ", " + C1.registrovanDo + ", " + C1.boja + ", " + C1.klima + ", " + C1.porekloVozila + ", " + C1.zamena + ", " + C1.cena_status + ", '" + C1.text + "'" + ", " + vlasnik + ")");
            StringBuilder naredbaSlike = new StringBuilder();
            //StringBuilder naredbaZaBrisanje = new StringBuilder();
            //  naredbaSlike.Append("INSERT INTO SLIKE(Slika,Redni) VALUES");




            SqlConnection conn = new SqlConnection(Konekcija.CS());
            SqlCommand komanda = new SqlCommand(naredba.ToString(),conn);
            //SqlCommand komanda1;
            
            conn.Open();
            int brojReda = (int)komanda.ExecuteScalar();
         

            if (C1.slike.Length != 0)
            {
                for (int i = 0; i < C1.slike.Length; i++)
                {

                    //if(i == C1.slike.Length - 1)
                    //{

                    //    naredbaSlike.Append("('" + C1.slike[i] + "', " + brojReda + ")");
                    //    komanda = new SqlCommand(naredbaSlike.ToString(), conn);
                    //    komanda.ExecuteNonQuery();

                    //    break;

                    //}

                    naredbaSlike.Append("INSERT INTO PHOTOS(Slika, Del_Slika, Automobil) VALUES");
                    naredbaSlike.Append("('" + C1.slike[i] + "', '" + C1.brisanje[i] + "', " + brojReda + ")");


                    //naredbaSlike.Append("INSERT INTO SLIKE(Slika,Redni) VALUES");
                    //naredbaZaBrisanje.Append("INSERT INTO DELETE_SLIKE(Slika,Redni) VALUES");
                    //naredbaSlike.Append("('" + C1.slike[i] + "', " + brojReda + ")");
                    //naredbaZaBrisanje.Append("('" + C1.brisanje[i] + "', " + brojReda + ")");

                    komanda = new SqlCommand(naredbaSlike.ToString(), conn);
                    //komanda1 = new SqlCommand(naredbaZaBrisanje.ToString(), conn);
                    komanda.ExecuteNonQuery();
                    //komanda1.ExecuteNonQuery();   
                    naredbaSlike.Clear();
                    //naredbaZaBrisanje.Clear();

                }

            }


            if (C1.oprema.Length != 0)
            {
                for (int i = 0; i < C1.oprema.Length; i++)
                {

                    //if(i == C1.slike.Length - 1)
                    //{

                    //    naredbaSlike.Append("('" + C1.slike[i] + "', " + brojReda + ")");
                    //    komanda = new SqlCommand(naredbaSlike.ToString(), conn);
                    //    komanda.ExecuteNonQuery();

                    //    break;

                    //}


                    naredbaSlike.Append("INSERT INTO DODATNA(Naziv,Kola) VALUES");
                    naredbaSlike.Append("('" + C1.oprema[i] + "', " + brojReda + ")");

                    komanda = new SqlCommand(naredbaSlike.ToString(), conn);
                    komanda.ExecuteNonQuery();
                    naredbaSlike.Clear();

                }

            }


            conn.Close();

            return "Unos USPESAN!";

           

        }

    }


    public class UpisOtisak
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
                if(value == "")
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
        public string[] slike { set;get; }
        public string[] brisanje { set; get; }
        public int zamena { set; get; }
        public int cena_status { set; get; }
        public string[] oprema { set; get; }
        public string text { set; get; }
      

    }
}