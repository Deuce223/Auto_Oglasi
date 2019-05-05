using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Reflection;

namespace WebApplication42
{
    public class DzejsonOtisak
    {
        string probni;

        public string marka { set; get; }
        public string model
        {
            set
            {

                if (value == null)
                {

                    this.probni = "";

                }

                else
                {

                    this.probni = value;
                }

            }

            get
            {

                return probni;

            }

        }

        public int[] karoserija { set; get; }
        public int[] gorivo { set; get; }
        public string vrata { set; get; }
        public string lokacija { set; get; }  // ovo treba isto da bude niz stringova!!!!!!!!!! NA Kraju Prepraviti
        public string[] godiste { set; get; } // datum i cena da budu nizovi brojeva           !!!! SAD JESU!!!  ipak da budu stringovi!!!!!
        public string[] cena { set; get; }
        public string sortiraj { set; get; }
        public int offset { set; get; }

        public void Naredba(StringBuilder naredba1, DzejsonOtisak objekat)
        {
            bool provera = false;
            // da li konverziju raditi u javaskriptu ili ovde;
            Type tip = objekat.GetType();
            PropertyInfo[] nizProp = tip.GetProperties();

            foreach (PropertyInfo ggg in nizProp)
            {


                object vrednost = ggg.GetValue(objekat);

                if (vrednost.GetType() == typeof(string) && !String.IsNullOrEmpty((string)vrednost))
                {


                    if (provera)
                    {

                        if (ggg.Name == "sortiraj")
                        {

                            naredba1.Append(" ORDER BY Auti." + vrednost);

                        }

                        else
                        {

                           // naredba.Append(" AND " + ggg.Name + " = " + vrednost);
                            naredba1.Append(" AND Auti." + ggg.Name + " = " + vrednost);

                        }

                    }

                    else
                    {

                        if(ggg.Name == "sortiraj")
                        {

                            naredba1.Append(" ORDER BY Auti." + vrednost);

                        }

                        else
                        {

                            provera = true;
                           // naredba.Append("WHERE " + ggg.Name + " = " + vrednost);
                            naredba1.Append("WHERE Auti." + ggg.Name + " = " + vrednost);
                            

                        }



                    }
                }

                else if (vrednost.GetType() == typeof(int[]))
                {

                    int[] klon = (int[])vrednost;
                    if (klon.Length != 0)
                    {

                        if (provera)
                        {

                            for (int i = 0; i < klon.Length; i++)
                            {
                                if (i == 0)
                                {

                                   // naredba.Append(" AND " + ggg.Name + " = " + klon[i]);
                                    naredba1.Append(" AND Auti." + ggg.Name + " = " + klon[i]);


                                }

                                else
                                {

                                   // naredba.Append(" OR " + ggg.Name + " = " + klon[i]);
                                    naredba1.Append(" OR Auti." + ggg.Name + " = " + klon[i]);

                                }


                            }

                        }

                        else
                        {
                            provera = true;


                            for (int i = 0; i < klon.Length; i++)
                            {
                                if (i == 0)
                                {

                                   // naredba.Append(" WHERE " + ggg.Name + " = " + klon[i]);
                                    naredba1.Append(" WHERE Auti." + ggg.Name + " = " + klon[i]);


                                }

                                else
                                {

                                  //  naredba.Append(" OR " + ggg.Name + " = " + klon[i]);
                                    naredba1.Append(" OR Auti." + ggg.Name + " = " + klon[i]);

                                }
                            }
                        }

                    }

                }

                else if (vrednost.GetType() == typeof(string[]))
                {

                    string[] klon = (string[])vrednost;

                    if (klon[0] != "" && klon[1] == "")
                    {
                        if (provera)
                        {

                          //  naredba.Append(" AND " + ggg.Name + " >= " + klon[0]);
                            naredba1.Append(" AND Auti." + ggg.Name + " >= " + klon[0]);

                        }

                        else
                        {
                            provera = true;
                          //  naredba.Append(" WHERE " + ggg.Name + " >= " + klon[0]);
                            naredba1.Append(" WHERE Auti." + ggg.Name + " >= " + klon[0]);

                        }

                    }


                    else if (klon[0] == "" && klon[1] != "")
                    {
                        if (provera)
                        {

                          //  naredba.Append(" AND " + ggg.Name + " <= " + klon[1]);
                            naredba1.Append(" AND Auti." + ggg.Name + " <= " + klon[1]);

                        }

                        else
                        {
                            provera = true;
                          //  naredba.Append(" WHERE " + ggg.Name + " <= " + klon[1]);
                            naredba1.Append(" WHERE Auti." + ggg.Name + " <= " + klon[1]);

                        }

                    }

                    else if (klon[0] != "" && klon[1] != "")
                    {

                        if (Convert.ToInt32(klon[0]) > Convert.ToInt32(klon[1]))
                        {

                            string privremeni = klon[1];
                            klon[1] = klon[0];
                            klon[0] = privremeni;

                            if (provera)
                            {

                              //  naredba.Append(" AND " + ggg.Name + " BETWEEN " + klon[0] + " AND " + klon[1]);
                                naredba1.Append(" AND Auti." + ggg.Name + " BETWEEN " + klon[0] + " AND " + klon[1]);


                            }

                            else
                            {

                                provera = true;
                              //  naredba.Append(" WHERE " + ggg.Name + " BETWEEN " + klon[0] + " AND " + klon[1]);
                                naredba1.Append(" WHERE Auti." + ggg.Name + " BETWEEN " + klon[0] + " AND " + klon[1]);

                            }


                        }

                        else
                        {

                            if (provera)
                            {

                               // naredba.Append(" AND " + ggg.Name + " BETWEEN " + klon[0] + " AND " + klon[1]);
                                naredba1.Append(" AND Auti." + ggg.Name + " BETWEEN " + klon[0] + " AND " + klon[1]);


                            }

                            else
                            {

                                provera = true;
                              //  naredba.Append(" WHERE " + ggg.Name + " BETWEEN " + klon[0] + " AND " + klon[1]);
                                naredba1.Append(" WHERE Auti." + ggg.Name + " BETWEEN " + klon[0] + " AND " + klon[1]);

                            }


                        }


                    }

                }

            }


        }

        public void Naredba1(StringBuilder naredba, DzejsonOtisak objekat)
        {
            bool provera = false;
            // da li konverziju raditi u javaskriptu ili ovde;
            Type tip = objekat.GetType();
            PropertyInfo[] nizProp = tip.GetProperties();

            foreach (PropertyInfo ggg in nizProp)
            {


                object vrednost = ggg.GetValue(objekat);

                if (vrednost.GetType() == typeof(string) && !String.IsNullOrEmpty((string)vrednost))
                {


                    if (provera)
                    {

                        if (ggg.Name == "sortiraj")
                        {

                            //naredba1.Append(" ORDER BY Auti." + vrednost);

                        }

                        else
                        {

                            naredba.Append(" AND " + ggg.Name + " = " + vrednost);
                            

                        }

                    }

                    else
                    {

                        if (ggg.Name == "sortiraj")
                        {

                            //naredba1.Append(" ORDER BY Auti." + vrednost);

                        }

                        else
                        {

                            provera = true;
                            naredba.Append("WHERE " + ggg.Name + " = " + vrednost);
                           


                        }



                    }
                }

                else if (vrednost.GetType() == typeof(int[]))
                {

                    int[] klon = (int[])vrednost;
                    if (klon.Length != 0)
                    {

                        if (provera)
                        {

                            for (int i = 0; i < klon.Length; i++)
                            {
                                if (i == 0)
                                {

                                    naredba.Append(" AND " + ggg.Name + " = " + klon[i]);
                                    


                                }

                                else
                                {

                                    naredba.Append(" OR " + ggg.Name + " = " + klon[i]);
                                    

                                }


                            }

                        }

                        else
                        {
                            provera = true;


                            for (int i = 0; i < klon.Length; i++)
                            {
                                if (i == 0)
                                {

                                    naredba.Append(" WHERE " + ggg.Name + " = " + klon[i]);
                                    


                                }

                                else
                                {

                                    naredba.Append(" OR " + ggg.Name + " = " + klon[i]);
                                   

                                }
                            }
                        }

                    }

                }

                else if (vrednost.GetType() == typeof(string[]))
                {

                    string[] klon = (string[])vrednost;

                    if (klon[0] != "" && klon[1] == "")
                    {
                        if (provera)
                        {

                            naredba.Append(" AND " + ggg.Name + " >= " + klon[0]);
                            

                        }

                        else
                        {
                            provera = true;
                            naredba.Append(" WHERE " + ggg.Name + " >= " + klon[0]);
                           

                        }

                    }


                    else if (klon[0] == "" && klon[1] != "")
                    {
                        if (provera)
                        {

                            naredba.Append(" AND " + ggg.Name + " <= " + klon[1]);
                            

                        }

                        else
                        {
                            provera = true;
                            naredba.Append(" WHERE " + ggg.Name + " <= " + klon[1]);
                            

                        }

                    }

                    else if (klon[0] != "" && klon[1] != "")
                    {

                        if (Convert.ToInt32(klon[0]) > Convert.ToInt32(klon[1]))
                        {

                            string privremeni = klon[1];
                            klon[1] = klon[0];
                            klon[0] = privremeni;

                            if (provera)
                            {

                                naredba.Append(" AND " + ggg.Name + " BETWEEN " + klon[0] + " AND " + klon[1]);
                                


                            }

                            else
                            {

                                provera = true;
                                naredba.Append(" WHERE " + ggg.Name + " BETWEEN " + klon[0] + " AND " + klon[1]);
                                

                            }


                        }

                        else
                        {

                            if (provera)
                            {

                                naredba.Append(" AND " + ggg.Name + " BETWEEN " + klon[0] + " AND " + klon[1]);
                         


                            }

                            else
                            {

                                provera = true;
                                naredba.Append(" WHERE " + ggg.Name + " BETWEEN " + klon[0] + " AND " + klon[1]);
                            
                            }


                        }


                    }

                }

            }


        }

    }
}