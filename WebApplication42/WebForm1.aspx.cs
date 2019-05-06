using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Text;
using Newtonsoft.Json;
using System.Reflection;
using System.Text.RegularExpressions;
using System.IO;

namespace WebApplication42
{
    public partial class WebForm1 : System.Web.UI.Page
    {
      
       // static string CS = ("Data Source=DESKTOP-BL84MTN\\SQLEXPRESS;Initial Catalog=Automobili;Integrated Security=True;MultipleActiveResultSets=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                SqlConnection conn = new SqlConnection(Konekcija.CS());
                DataTable marka = new DataTable();
                SqlDataAdapter adapt = new SqlDataAdapter("SELECT * FROM MARKA", conn);
                adapt.Fill(marka);

                

                DropDownList1.DataSource = marka;
                DropDownList1.DataTextField = "Naziv";
                DropDownList1.DataValueField = "ID";
                DropDownList1.DataBind();

                DropDownList1.Items.Insert(0, new ListItem("", ""));


                DataTable karoserija = new DataTable();
                adapt = new SqlDataAdapter("SELECT * FROM Karoserija", conn);
                adapt.Fill(karoserija);


                ListBox2.DataSource = karoserija;
                ListBox2.DataTextField = "Naziv";
                ListBox2.DataValueField = "ID";
                ListBox2.DataBind();


                //DropDownList3.DataSource = karoserija;
                //DropDownList3.DataTextField = "Naziv";
                //DropDownList3.DataValueField = "ID";
                //DropDownList3.DataBind();

                //DropDownList3.Items.Insert(0, new ListItem("", ""));

                DataTable gorivo = new DataTable();
                adapt = new SqlDataAdapter("SELECT * FROM Gorivo", conn);
                adapt.Fill(gorivo);

                //DropDownList4.DataSource = gorivo;
                //DropDownList4.DataTextField = "Naziv";
                //DropDownList4.DataValueField = "ID";
                //DropDownList4.DataBind();

                //DropDownList4.Items.Insert(0, new ListItem("", ""));

                ListBox1.DataSource = gorivo;
                ListBox1.DataTextField = "Naziv";
                ListBox1.DataValueField = "ID";
                ListBox1.DataBind();


                DataTable vrata = new DataTable();
                adapt = new SqlDataAdapter("SELECT * FROM Vrata", conn);
                adapt.Fill(vrata);

                DropDownList5.DataSource = vrata;
                DropDownList5.DataTextField = "Naziv";
                DropDownList5.DataValueField = "ID";
                DropDownList5.DataBind();

                DropDownList5.Items.Insert(0, new ListItem("", ""));


                DataTable lokacija = new DataTable();
                adapt = new SqlDataAdapter("SELECT * FROM Lokacija", conn);
                adapt.Fill(lokacija);

                DropDownList6.DataSource = lokacija;
                DropDownList6.DataTextField = "Naziv";
                DropDownList6.DataValueField = "ID";
                DropDownList6.DataBind();

                DropDownList6.Items.Insert(0, new ListItem("", ""));

                DropDownList1.CssClass = "lista";


                int godina1 = DateTime.Now.Year;
                for (int i = 0; i < 60; i++)
                {

                    ListItem item = new ListItem(godina1.ToString(), godina1.ToString());
                    DropDownList7.Items.Add(item);
                    DropDownList8.Items.Add(item);
                    godina1 = godina1 - 1;

                }

                DropDownList7.Items.Insert(0, new ListItem("", ""));
                DropDownList8.Items.Insert(0, new ListItem("", ""));


                ListItem pocetni = new ListItem("...", "");
                ListItem prvi = new ListItem("Sortiraj po ceni uzlazno", "Cena ASC, Auti.ID DESC");
                ListItem drugi = new ListItem("Sortiraj po ceni silazno", "Cena DESC, Auti.ID DESC");
                ListItem treci = new ListItem("Sortiraj po datumu objave uzlazno", "Unos_vreme ASC, Auti.ID DESC");
                ListItem cetvrti = new ListItem("Sortiraj po datumu objave silazno", "Unos_vreme DESC, Auti.ID DESC");
                ListItem peti = new ListItem("Sortiraj po godini proizvodnje uzlazno", "Godiste ASC, Auti.ID DESC");
                ListItem sesti = new ListItem("Sortiraj po godini proizvodnje silazno", "Godiste DESC, Auti.ID DESC");
                ListItem sedmi = new ListItem("Sortiraj po kilometrazi uzlazno", "Kilometraza ASC, Auti.ID DESC");
                ListItem osmi = new ListItem("Sortiraj po kilomtrazi silazno", "Kilometraza DESC, Auti.ID DESC");

                DropDownList3.Items.Add(pocetni);
                DropDownList3.Items.Add(prvi);
                DropDownList3.Items.Add(drugi);
                DropDownList3.Items.Add(treci);
                DropDownList3.Items.Add(cetvrti);
                DropDownList3.Items.Add(peti);
                DropDownList3.Items.Add(sesti);
                DropDownList3.Items.Add(sedmi);
                DropDownList3.Items.Add(osmi);
                
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

                DropDownList2.Items.Insert(0, new ListItem("", ""));
                DropDownList2.SelectedIndex = 1;

            }

            else
            {
               
                DropDownList2.Items.Clear();

            }
        }

     

        public class Otisak
        {

             double prelazSnage;
             string snage;
            string klimaPrelaz;
            string cena_tt;

            public string ID { set; get; }
            public string marka { set; get; }
            public string model { set; get; }
            public string karoserija { set; get; }
            public string gorivo { set; get; }
            public string vrata { set; get; }
            public string lokacija { set; get; }
            public string slika { set; get; }
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
            public string snaga_konja {

                set {

                    this.prelazSnage = Math.Round(Convert.ToInt32(value) / 0.73549875);
                    this.snage = value;

                }

                get {

                    return this.snage + "/" + prelazSnage + "(kW/KS)";

                }


            }


            //public int konja
            //{

            //    get
            //    {

            //        return this.prelazSnage;
            //    }

            //}

            public string vreme { set; get; }

           // public DateTime vrime { set; get; }

            public string klima
            {

                set
                {

                    if (value == "Nema klimu")
                    {

                        this.klimaPrelaz = "";

                    }

                    else
                    {

                        this.klimaPrelaz = ", " + value;

                    }

                }

                get
                {

                    return klimaPrelaz;

                }

            }

        }

        public class Lista
        {
            public List<Otisak> podaci { set; get; }
            public decimal brojstrana { set; get; }
            public int brojPogodaka { set; get; }
            public int offset { set; get; }


        }

        // proba sa deserijalizacijom

   

        [WebMethod(EnableSession = true)]
        public static string Vrati(string dzejson, string kontrola)
        {
        
            string provera_kontrole = kontrola;

            DzejsonOtisak C1 = new DzejsonOtisak();

            C1 = JsonConvert.DeserializeObject<DzejsonOtisak>(dzejson);


            

            StringBuilder naredba1 = new StringBuilder();
            naredba1.Append("SELECT Auti.ID, Marka.Naziv, Modeli.Model, Karoserija.Naziv, Gorivo.Naziv, Vrata.Naziv, Lokacija.Naziv, Unos_vreme, Cena, Godiste, Kilometraza, Oznaka, Kubikaza, Menjac.Naziv, Snaga, Klima.Naziv FROM Auti INNER JOIN Marka ON Marka.ID = Auti.Marka INNER JOIN Modeli ON Modeli.ID = AUTI.Model INNER JOIN Karoserija ON Karoserija.ID = Auti.Karoserija INNER JOIN Gorivo ON Gorivo.ID = Auti.Gorivo INNER JOIN Vrata ON Vrata.ID = Auti.Vrata INNER JOIN Lokacija ON Lokacija.ID = Auti.Lokacija INNER JOIN Menjac ON Menjac.ID = Auti.Menjac INNER JOIN KLIMA ON KLIMA.ID = AUTI.Klima ");
            C1.Naredba(naredba1, C1);
            naredba1.Append(" OFFSET " + C1.offset + " ROWS FETCH NEXT 20 ROWS ONLY");
            SqlConnection conn = new SqlConnection(Konekcija.CS());
            if (provera_kontrole == "BUTTON"){

                StringBuilder naredba = new StringBuilder();
                naredba.Append("SELECT COUNT(Auti.ID) FROM Auti ");
            
                C1.Naredba1(naredba, C1);

                
                SqlCommand komanda = new SqlCommand(naredba.ToString(), conn);
                conn.Open();
                int brojPogodaka = (int)komanda.ExecuteScalar();
                conn.Close();

                if (brojPogodaka == 0)
                {
                   // HttpContext.Current.Session["brojPogodaka"] = brojPogodaka;
                    return ("{\"brojPogodaka\":0}"); //broj rezultata 0 ovde!!!!!

                }


                else
                {

                    // vrati broj strana i prvih 20 pogodaka!!!
                    //vrati i broj pogodaka!!!!

                    SqlCommand kom1 = new SqlCommand(naredba1.ToString(), conn);
                    conn.Open();
                    SqlDataReader citac = kom1.ExecuteReader();


                    Lista A1 = new Lista();

                    List<Otisak> privremena = new List<Otisak>();

                    while (citac.Read())
                    {

                        Otisak B1 = new Otisak();
                        B1.ID = citac[0].ToString();
                        B1.marka = citac[1].ToString();
                        B1.model = citac[2].ToString();
                        B1.karoserija = citac[3].ToString();
                        B1.gorivo = citac[4].ToString();
                        B1.vrata = citac[5].ToString();
                        B1.lokacija = citac[6].ToString();
                        B1.vreme = Convert.ToDateTime(citac[7]).Day.ToString() + "." + Convert.ToDateTime(citac[7]).Month.ToString() + "." + Convert.ToDateTime(citac[7]).Year.ToString();
                     //   B1.slika = citac[8].ToString();
                        B1.cena = citac[8].ToString();
                        B1.godiste = citac[9].ToString();
                        B1.kilometraza = citac[10].ToString();
                        B1.oznaka = citac[11].ToString();
                        B1.kubikaza = citac[12].ToString();
                        B1.menjac = citac[13].ToString();
                        B1.snaga_konja = citac[14].ToString(); ;
                        B1.klima = citac[15].ToString();

                       

                        privremena.Add(B1);



                    }

                    conn.Close();

                    foreach(Otisak ff in privremena)
                    {

                        string putanja = AppDomain.CurrentDomain.BaseDirectory + "\\Slike\\" + ff.ID + "\\";
                        if (Directory.Exists(putanja))
                        {
                            
                           if(File.Exists(putanja + "0.jpg"))
                            {

                                ff.slika = "Slike/" + ff.ID + "/0.jpg?ime=Milos";


                            }

                           else if(File.Exists(putanja + "0.png"))
                           {


                                ff.slika = "Slike/" + ff.ID + "/0.png?ime=Milos";

                            }



                        }

                        else
                        {

                            ff.slika = "";

                        }

                    }



                    A1.podaci = privremena;

                    HttpContext.Current.Session["brojPogodaka"] = brojPogodaka;
                    decimal brojStrana = Math.Ceiling((decimal)brojPogodaka / 20);
                    HttpContext.Current.Session["brojStrana"] = brojStrana;

                    A1.brojstrana = brojStrana;
                    A1.brojPogodaka = brojPogodaka;
                    A1.offset = C1.offset;


                    string dzejsonVrati = JsonConvert.SerializeObject(A1);
                    return dzejsonVrati;


                }


            }

            else
            {

                SqlCommand kom1 = new SqlCommand(naredba1.ToString(), conn);
                conn.Open();
                SqlDataReader citac = kom1.ExecuteReader();


                Lista A1 = new Lista();

                List<Otisak> privremena = new List<Otisak>();

                while (citac.Read())
                {

                    Otisak B1 = new Otisak();
                    B1.ID = citac[0].ToString();
                    B1.marka = citac[1].ToString();
                    B1.model = citac[2].ToString();
                    B1.karoserija = citac[3].ToString();
                    B1.gorivo = citac[4].ToString();
                    B1.vrata = citac[5].ToString();
                    B1.lokacija = citac[6].ToString();
                    B1.vreme = Convert.ToDateTime(citac[7]).Day.ToString() + "." + Convert.ToDateTime(citac[7]).Month.ToString() + "." + Convert.ToDateTime(citac[7]).Year.ToString();
                    //B1.slika = citac[8].ToString();
                    B1.cena = citac[8].ToString();
                    B1.godiste = citac[9].ToString();
                    B1.kilometraza = citac[10].ToString();
                    B1.oznaka = citac[11].ToString();
                    B1.kubikaza = citac[12].ToString();
                    B1.menjac = citac[13].ToString();
                    B1.snaga_konja = citac[14].ToString(); ;
                    B1.klima = citac[15].ToString();

                    privremena.Add(B1);



                }

                //ovde isto prepraviti slike!!!1

                foreach (Otisak ff in privremena)
                {

                    string putanja = AppDomain.CurrentDomain.BaseDirectory + "\\Slike\\" + ff.ID + "\\";
                    if (Directory.Exists(putanja))
                    {

                        if (File.Exists(putanja + "0.jpg"))
                        {

                            ff.slika = "Slike/" + ff.ID + "/0.jpg?ime=Milos";


                        }

                        else if (File.Exists(putanja + "0.png"))
                        {


                            ff.slika = "Slike/" + ff.ID + "/0.png?ime=Milos";

                        }



                    }

                    else
                    {


                        ff.slika = "";
                    }

                }

                conn.Close();

                A1.podaci = privremena;

                //decimal brojStrana = Math.Ceiling((decimal)brojPogodaka / 20);
                //A1.brojstrana = brojStrana;
                //A1.brojPogodaka = brojPogodaka;

                //brojpogodaka i brojstrana se uvek setuju na nulu, cak i kad ne dodelim vrednost
                //kako da ih zapamtim ili pa da saljem one prethodne
                //moraces opet da pepravljas izlistavanje stranica i sadrzaja u zavisnosti od objekta, ako svaki objekat koji vracas bude imao stari broj strana i pogodaka!!!!!!!

                //sad napraviti prepravke u javascriptu!!!!

                A1.brojstrana = (decimal)HttpContext.Current.Session["brojStrana"];
                A1.brojPogodaka = (int)HttpContext.Current.Session["brojPogodaka"];
                A1.offset = C1.offset;

                string dzejsonVrati = JsonConvert.SerializeObject(A1);
                return dzejsonVrati;




            }


        }


    } 


}



    
