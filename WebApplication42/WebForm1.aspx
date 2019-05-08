<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication42.WebForm1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <style type="text/css">

         
          /*body{


              background-color:#f5f3f3;

          }*/

         /*body
         {

            background-image:url(lightpaperfibers.png);

         }*/

         .oglas{

             width:60%;
             margin:auto;
             display:flex;
             justify-content:center;
             align-items:center;
             /*background-color:white;*/
             border-radius: 20% 70% 40% 80%;
             border-bottom:2px red solid;
             /*box-shadow: 9px 10px 10px -2px rgba(0,0,0,0.08);*/
            /*box-shadow: inset 2px -33px 19px -15px rgba(240,231,240,1);*/
            /*background-image:linear-gradient(to right, #ffffff, #62a3e1 40%, white 80%);*/
              margin-top:100px;
         }

         .oglas:before{

             content:"";
             display:block;
             padding-top:1%;


         }


         .sadrzaj{width:800px;
                 margin:auto;
                 text-align:center;
                 border-left: 3px solid rgb(244, 209, 66);
                 border-right: 3px solid rgb(244, 209, 66);
                 /*background-color:aliceblue;*/
        }

         @media only screen and (max-width:1200px){


             .sadrzaj{

                 width:100%;

             }

             /*.rezultat{

                 width:100%;
                background-color:darkblue;

             }*/

         }


        .rezultat{

            width:720px;
            margin:auto;
            background-color:white;
            /*border-top:1px solid black;*/
            /*border: 2px solid red;*/
            margin-bottom:20px;
            height:160px;
            display:flex;
           box-shadow: 7px 6px 10px 10px rgb(224, 222, 222);
           border:1px solid;
           border-color:cadetblue;
           border-radius:5px 5px;
        }

        /*@media only screen and (max-width:950px){


            .rezultat{

                 width:100%;
                

             }

         }*/



        .rezultat img{
           max-width:100%;
           max-height:100%;
        }


        .strane{

            width:50%;
            margin:auto;
            margin-bottom:15px;
            display:flex;
            justify-content:center;
            align-items:center;
       
        }

        .stranica{

            color:black;
            width:22px;
            height:22px;           
            margin-left:6px;
            display:inline-block;
            cursor:pointer;
            border:1px black solid;
            display:flex;
            justify-content:center;
            align-items:center;
            
            

        }

        .lista{
            width:220px;
            font-family:ariel;
            height:30px;
            font-size:18px;
            margin-left:10px;
            margin-bottom:10px;
            margin-top:10px;
            margin-right:10px;

        }

        .lista1{

             width:168px;
            font-family:ariel;
            height:30px;
            font-size:18px;
            /*margin-left:10px;*/
            /*margin-bottom:10px;
            margin-top:10px;*/
            /*border-bottom-width:1px;
            border-top-width:1px;
            border-left-width:1px;
            border-right-width:1px;*/

        }

        
        .lista2{

             width:163px;
            font-family:ariel;
            height:30px;
            font-size:18px;
            /*margin-left:10px;*/
            /*margin-bottom:10px;
            margin-top:10px;*/
            /*border-bottom-width:1px;
            border-top-width:1px;
            border-left-width:1px;
            border-right-width:1px;*/

        }

        #gornji{
            width:60%;
            /*margin:auto;*/
            /*background-color:darkgray;
            clip-path:polygon(0% 0%, 100% 0%, 100% 85%, 0% 100%);*/
            opacity:0.8;
            /*background-image: linear-gradient(to right, #f7f0f0, #1476ca);*/
            /*background-image:url("pozadina.jpg");
            background-position:center;
            background-size:cover;*/
            

        }

        #gornji:before{
            content:"";
            display:block;
            padding-top:4%;


        }

        #gornji:after{
            content:"";
            display:block;
            padding-top:15%;


        }

      .container{

          /*margin:auto;
          width:80%;*/

          display:flex;
          justify-content: center;
          align-items: center;
          

      }

    
      .cena{

          
          margin-top:10px;
          display:inline-block;
          background-color:red;
          font-weight:600;
          padding:7px;
          color:white;
          /*color:black;*/
          /*border:1px solid;
          border-color:blanchedalmond;*/
          margin-bottom:55px;
          font-size:medium;
      }

      .podaci{

          position:absolute;
          left:200px;
          bottom:50px;
          text-align:left;
      }

      .podaci p{

          margin-top:0px;
          margin-bottom:0px;
      }

      /*.paraf{

          position:absolute;
          bottom:5px;
          right:20px;
          font-weight:300;
          

      }*/


      .sortiranje{

          visibility:hidden;
          
      }

      .obelezen{

          background-color:blue;
          color:white;

      }

      .strelice {

            color:black;
            width:22px;
            height:22px;           
            text-align:center;
            display:inline-block;
            cursor:pointer;          
            visibility:hidden;
            display:flex;
            justify-content:center;
            align-items:center;
            border:1px black solid;
            margin-left:6px;
         
      }

        .inside {

            display:flex;
            justify-content:center;
            align-items:center;
         
        }


        .slikakont{

            width:176px;
            /*text-align:center;*/
            display:flex;
            justify-content: center;
            align-items: center;

            
        }

        .dodata{

            /*margin-left:10px;
            margin-right:10px;*/

            width:220px;
          /*//  font-family:ariel;
           // height:30px;
          //  font-size:18px;*/
            /*margin-left:10px;
            /*margin-bottom:10px;*/
            /*margin-top:10px;*/


        }

        
.q2{

width:136px;
/*background-color:red;*/
text-align:center;


}

.q1{

width:408px;
/*background-color:green;*/




}

.q1 p {


    margin:2px;
}


.unutra {

text-align:center;

}

.unutra h3 {

margin-top:5px;

}

.kontejner_slika{

    width:80%;
    margin:auto;
    height:90px;
    background-color:white;
    display:flex;
    justify-content:center;
    align-items:center;
}

#dugme_zamena{

    width:130px;
    height:50px;
    display:flex;
    justify-content:center;
    align-items:center;
    color:black;
    /*background-image:linear-gradient(to right, #f38585, #f80d0d);*/
    background-color:#ffb779;
    margin-top:20px;
    border-radius:5px 5px;
    cursor:pointer;
    
    


}

#dugme{

    display:none;


}

.label
{

    display:flex;
    justify-content:center;
    align-items:flex-end;
    width:160px;
    font-family:ariel;
    height:30px;
    font-size:18px;
    margin-left:10px;
    /*margin-bottom:10px;
    margin-top:10px;*/
    margin-right:10px;


}

.label1
{

    display:flex;
    justify-content:center;
    align-items:flex-end;
    font-family:ariel;
    height:30px;
    font-size:18px;
    margin-left:10px;
    /*margin-bottom:10px;
    margin-top:10px;*/
    margin-right:10px;
    width:168px;
    margin-left:10px;
            /*margin-bottom:10px;
            margin-top:10px;*/
            /*border-bottom-width:1px;
            border-top-width:1px;
            border-left-width:1px;
            border-right-width:1px;*/


}

.sortiranje{

    width:50%;
    margin:auto;
    text-align:right;
    margin-top:20px;
    margin-bottom:20px;


}

.drugaciji{


    width:700px;
    margin:auto;
    /*border:1px red solid;*/

}

.naslov{

    display:flex;
    justify-content:center;
    align-items:center;
    flex-direction:column;


}
        /*select{

            border-width:1px;

        }*/

        @media only screen and (max-width:1200px){

            #gornji{

                width:80%;


            }


        }

            @media only screen and (max-width:800px){

            .container{

                flex-direction:column;


            }

            .lista1{

                width:218px;

            }

            .lista2{

                width:218px;

            }

        }

            @media only screen and (max-width:750px){


                .rezultat{

                    width:95%;
                    margin:auto;
                    margin-bottom:10px;
                    font-size:2.6vw;

                }

                .rezultat div{

                    font-size:2.5vw;

                }


            }
    
    </style>


    <script src="jquery-3.3.1.min.js"></script>
    <script src="jquery.sumoselect.js"></script>
    <link href="sumoselect.css" rel="stylesheet" />


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="oglas" class="oglas">

       

                   <div id="gornji">

                         <div style="width:100%;height:120px"></div>
<%--                <div class="container">

                    
                    <label class="label">Model</label>
                    <label class="label">Karoserija</label>

                </div>--%>

               
            <div class="container">

    <div class="naslov">
        <label class="label">Marka</label>
         <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="lista"></asp:DropDownList>

    </div>                
    
        
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server" >
        </asp:ScriptManager>--%>

                <div class="naslov">
                        <label class="label">Model</label>
           
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
            <ContentTemplate>
     <asp:DropDownList ID="DropDownList2" runat="server" CssClass="lista">
                </asp:DropDownList>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>

                    </div>
             <div class="naslov">

                     <label class="label">Karoserija</label>
                     <div style="margin:10px">
                            <asp:ListBox ID="ListBox2" runat="server" SelectionMode="Multiple"></asp:ListBox>   

                     </div>
                     

             </div>

 
                </div>

            <%--      <div class="container">

                    <label class="label">Gorivo</label>
                    <label class="label">Broj vrata</label>
                    <label class="label">Lokacija</label>

                </div>--%>

                <div class="container">        
                    
     <div class="naslov">
                     <label class="label">Gorivo</label>
         <div style="margin:10px">
   <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple"></asp:ListBox>
             </div>
         </div>


    <div class="naslov">
        <label class="label">Broj vrata</label>
    <asp:DropDownList ID="DropDownList5" runat="server" CssClass ="lista">
        </asp:DropDownList>
        </div>

    <div class="naslov">
        <label class="label">Lokacija</label>
    <asp:DropDownList ID="DropDownList6" runat="server" CssClass ="lista">
        </asp:DropDownList>
        </div>
                </div>

             <%--         <div class="container drugaciji">

                    <label class="label1">Godiste od</label>
                    <label class="label1">Godiste do</label>
                    <label class="label1">Cena od</label>
                    <label class="label1">Cena do</label>

                </div>--%>

            <div class="container">
                
                 <div class="naslov">

                     <label class="label">Godiste od</label>

                      <div style="margin-top:10px;margin-bottom:10px;margin-left:4px;margin-right:4px">

                <asp:DropDownList ID="DropDownList7" runat="server" CssClass="lista1"></asp:DropDownList>

                          </div>

                     </div>
              
                 <div class="naslov">

                     <label class="label">Godiste do</label>

                      <div style="margin-top:10px;margin-bottom:10px;margin-left:4px;margin-right:4px">
                
                <asp:DropDownList ID="DropDownList8" runat="server" CssClass="lista1"></asp:DropDownList>

                          </div>

                     </div>
                

                 <div class="naslov">

                     <label class="label">Cena od</label>


                      <div style="margin-top:10px;margin-bottom:10px;margin-left:4px;margin-right:4px">

                <asp:TextBox ID="Text1" TextMode="Number" runat="server" min="0"  step="1" CssClass="lista2" Height="23px"/>

                         </div>

                     </div>

                 <div class="naslov">

                     <label class="label">Cena do</label>

     <div style="margin-top:10px;margin-bottom:10px;margin-left:4px;margin-right:4px">
                
                <asp:TextBox ID="Text2" TextMode="Number" runat="server" min="0"  step="1" CssClass="lista2" Height="23px" />


         </div>

                     </div>
               <%--  <button id="dugme" onclick="return false">klikni</button>--%>
            </div>
 
                
           <div class="container">
               <button id="dugme" onclick="return false">klikni</button>
               <div id="dugme_zamena">PRETRAGA</div>
           </div>
                        <div style="width:100%;height:120px"></div>

            </div>


        
      



    </div>


 
        <div id="sortiranje" class="sortiranje">

        <asp:DropDownList ID="DropDownList3" runat="server" onchange="selektPromena(this)"></asp:DropDownList>

    </div>



    <div id="strane" class="strane">

        <div class="strelice"><</div>
        <div class="strelice"><<</div>

        <div id="unutra" class="inside"></div>

        <div class="strelice">>></div>
        <div class="strelice">></div>

    </div>
    <div id="sadrzaj" class="sadrzaj"></div>
    <div id="strane1" class="strane">

        
        <div class="strelice"><</div>
        <div class="strelice"><<</div>

        <div id="unutra1" class="inside"></div>

        <div class="strelice">>></div>
        <div class="strelice">></div>


    </div>

   
<%--    <asp:Button ID="drugiTriger" runat="server" Text="Button" OnClick="Button1_Click" />--%>

      <script>

            //var objekat;
            var primljeni;
            var trenutnaStrana = null;
            var offset = 0;
            var objekatPocetni


            //var brojSTR;
            //var brojPGD;

            $(document).ready(function () {

               
             
                 // prepraviti!       


              //  var h3 = window.history.length;
                //pocetno stanje

                $(<%=ListBox1.ClientID%>).SumoSelect();
                $(<%=ListBox2.ClientID%>).SumoSelect();

                var sirina = $("#ContentPlaceHolder1_DropDownList1").css("width");

                $(".SumoSelect").each(function () {

                    //$(this).css({ "width": sirina });
                    $(this).addClass("dodata");


                })

                // document.getElementsByClassName("SumoSelect")[0].classList.add("dodata");

                //    if (history.state === null) {

                //      /* history.replaceState({ brojPogodaka: "pocetni" }, "", "");*/ // prepraviti!!!!
                //       var primljeni = { brojPogodaka: "pocetni" };
                //       var novi = { dobijen: primljeni };
                //         //var grupniObjekat = { dobijen: primljeni, poslat: objekatPocetni };
                //       history.replaceState(novi, "", "")
                       

                //}

                //else
                //{

                //  //  konstantno ulazi ovde;
                //    var h2 = window.history.length;
                //      // history.go(); //ovde zajebava a hoce -1 i 1!!!!

                //       primljeni = history.state.dobijen;
                //       objekatPocetni = history.state.poslat;
                //       izlistavanjeSadrzaja(history.state.dobijen);
                //       paging_osvezavanje(history.state.dobijen);

                //}
            

                 $(".strelice").each(function(){

                $(this).click(function(){

                    if ($(this).text() == "<") {
                        var trenutni = document.getElementById("unutra").getElementsByClassName("obelezen")[0].innerHTML
                        var trenutniBroj = parseInt(trenutni) - 1;

                        if (trenutniBroj > 0) {


                            document.getElementById("unutra").getElementsByClassName("stranica")[trenutniBroj - 1].click();

                        }
                    }

                    else if ($(this).text() == "<<") {

                        document.getElementById("unutra").getElementsByClassName("stranica")[0].click();

                    }

                    else if ($(this).text() == ">>") {
                        document.getElementById("unutra").getElementsByClassName("stranica")[document.getElementById("unutra").getElementsByClassName("stranica").length - 1].click();

                    }

                    else if ($(this).text() == ">")

                    {
                        var trenutni = document.getElementById("unutra").getElementsByClassName("obelezen")[0].innerHTML
                        var trenutniBroj = parseInt(trenutni) - 1;

                        if (trenutniBroj < document.getElementById("unutra").getElementsByClassName("stranica").length - 1) {


                            document.getElementById("unutra").getElementsByClassName("stranica")[trenutniBroj + 1].click();

                        }



                    }

                })
            })


            $("#dugme").click(function () {

              
                


                var marka = $("#ContentPlaceHolder1_DropDownList1").val();
                var model = $("#ContentPlaceHolder1_DropDownList2").val();


      

                var karoserija = [];
                nizListBox("ContentPlaceHolder1_ListBox2", karoserija);
                var gorivo = [];
                nizListBox("ContentPlaceHolder1_ListBox1", gorivo);

                //if (karoserija.length != 0) {

                //    for (i = 0; i < karoserija.length; i++) {


                //        alert(karoserija[i]);

                //    }


                //}




                var vrata = $("#ContentPlaceHolder1_DropDownList5").val();
                var lokacija = $("#ContentPlaceHolder1_DropDownList6").val();

                var godiste = [];
                var datum1 = $("#ContentPlaceHolder1_DropDownList7").val();
                var datum2 = $("#ContentPlaceHolder1_DropDownList8").val();
                godiste.push(datum1);
                godiste.push(datum2);

                var cena = [];
                var cena1 = $("#ContentPlaceHolder1_Text1").val();
                var cena2 = $("#ContentPlaceHolder1_Text2").val();
                cena.push(cena1);
                cena.push(cena2);

                var sortiraj = "ID DESC";

                objekatPocetni = { marka: marka, model: model, karoserija: karoserija, gorivo: gorivo, vrata: vrata, lokacija: lokacija, godiste: godiste, cena: cena, sortiraj: sortiraj, offset: offset }

                if (JSON.stringify(history.state.poslat) !== JSON.stringify(objekatPocetni)) //sta ako neko zeli da osvezi ako je stigao novi auto u bazu u medjuvremenu ?
                {

                    poziv(objekatPocetni, this);

                }

                

                })

                   if (history.state === null) {

                      /* history.replaceState({ brojPogodaka: "pocetni" }, "", "");*/ // prepraviti!!!!
                       var primljeni = { brojPogodaka: "pocetni" };
                       var novi = { dobijen: primljeni };
                         //var grupniObjekat = { dobijen: primljeni, poslat: objekatPocetni };
                       history.replaceState(novi, "", "WebForm1.aspx?history=da")
                       

                }

                else // if kveri string nije jednako pretraga
                {

                  //  konstantno ulazi ovde;
                    var h2 = window.history.length;
                      // history.go(); //ovde zajebava a hoce -1 i 1!!!!

                       primljeni = history.state.dobijen;
                       objekatPocetni = history.state.poslat;
                       izlistavanjeSadrzaja(history.state.dobijen);
                       paging_osvezavanje(history.state.dobijen);

                }

                //else nista

                //if (history.state.poslat !== objekatPocetni)
                //{

                //     poziv(objekatPocetni, this);

                //}

            })


            function klikRezultat() {


                var id = this.getAttribute("id");


                //history.pushState(primljeni, "", "");
                location.href = "WebForm2.aspx?ID=" + id;


            }


            function izlistavanjeSadrzaja(obk) {



                document.getElementById("sadrzaj").innerHTML = "";


                if (obk.brojPogodaka != 0 && obk.brojPogodaka != "pocetni") {


                    if (obk.brojPogodaka == 1) {


                        document.getElementById("sortiranje").style.visibility = "hidden";
                       
                    }

                    else
                    {

                         document.getElementById("sortiranje").style.visibility = "visible";



                    }
                       
                    var glavni = document.getElementById("sadrzaj");

                    for (i = 0; i < obk.podaci.length; i++) {

                        var rez = document.createElement("div");
                        rez.setAttribute("id", obk.podaci[i].ID);
                        rez.classList.add("rezultat");
                        rez.addEventListener("click", klikRezultat);
                        var divSlika = document.createElement("div");
                        divSlika.classList.add("slikakont");


                        var kontejner_slika = document.createElement("div");
                        kontejner_slika.classList.add("kontejner_slika");

                        var image = document.createElement("img");

                        if (obk.podaci[i].slika == "") {

                            image.setAttribute("src", "1024px-No_image_available.png");

                        }

                        else {

                            image.setAttribute("src", obk.podaci[i].slika + "?val=" + i);

                        }

                        kontejner_slika.appendChild(image);

                        divSlika.appendChild(kontejner_slika);

                        rez.append(divSlika);

                        var sredina = document.createElement("div");
                        sredina.classList.add("q1");
                        var desno = document.createElement("div");
                        desno.classList.add("q2");
                        var unutra = document.createElement("div");
                        unutra.classList.add("unutra");
                        var h3 = document.createElement("H3");
                        var h3_text = document.createTextNode(obk.podaci[i].marka + " " + obk.podaci[i].model + " " + obk.podaci[i].oznaka);
                        h3.appendChild(h3_text);






                        var parafDiv = document.createElement("div");
                        parafDiv.classList.add("paragraf");

                        var paraf1 = document.createElement("P");
                        var sup = document.createElement("SUP");
                        var brr = document.createTextNode("3");
                        sup.appendChild(brr);
                        var paraf1Text = document.createTextNode(obk.podaci[i].godiste + ". | " + obk.podaci[i].kilometraza + "km | " + obk.podaci[i].gorivo + " | " + obk.podaci[i].karoserija + ", " + obk.podaci[i].kubikaza + " cm")
                        paraf1.appendChild(paraf1Text);
                        paraf1.appendChild(sup);

                        var paraf2 = document.createElement("P");
                        var paraf2Text = document.createTextNode(obk.podaci[i].snaga_konja + ", " + obk.podaci[i].menjac + obk.podaci[i].klima);
                        paraf2.appendChild(paraf2Text);

                        //lokacija!!
                        var paraf3 = document.createElement("P");
                        var paraf3Text = document.createTextNode("Lokacija: " + obk.podaci[i].lokacija);
                        paraf3.appendChild(paraf3Text);

                        parafDiv.appendChild(paraf1);
                        parafDiv.appendChild(paraf2);
                        parafDiv.appendChild(paraf3);


                        unutra.appendChild(h3);
                        unutra.appendChild(parafDiv);
                        sredina.appendChild(unutra);




                        //var naslov = document.createElement("H3");
                        //var textNaslova = document.createTextNode(obk.podaci[i].marka + " " + obk.podaci[i].model + " " + obk.podaci[i].oznaka);
                        var cena = document.createElement("div");
                        cena.classList.add("cena");
                        var cenaText = document.createTextNode(obk.podaci[i].cena);
                        cena.appendChild(cenaText);
                        //cena.classList.add("cena");


                        desno.appendChild(cena);

                        //var infoDiv = document.createElement("div");
                        //infoDiv.classList.add("podaci");

                       

                        var vremeDiv = document.createElement("P");
                        //vremeDiv.classList.add("paraf");
                        var txtVreme = document.createTextNode(obk.podaci[i].vreme);
                        vremeDiv.appendChild(txtVreme);

                        desno.appendChild(vremeDiv);

                        rez.appendChild(sredina);
                        rez.appendChild(desno);
                        glavni.append(rez);


                        //infoDiv.appendChild(paraf1);
                        //infoDiv.appendChild(paraf2);
                        //infoDiv.appendChild(paraf3);

                        //naslov.appendChild(textNaslova);
                        //rez.appendChild(divSlika);
                        //rez.appendChild(naslov);
                        //rez.appendChild(cena);
                        //rez.appendChild(infoDiv);
                        //rez.appendChild(vremeDiv);
                        //glavni.appendChild(rez);

                    }


                }

                else if (obk.brojPogodaka == 0) {

                    $("#sadrzaj").html("<h2>NEMA REZULTATA</h2");
                    $(".strelice").each(function () {

                        $(this).css("visibility", "hidden");

                    })

                       document.getElementById("sortiranje").style.visibility = "hidden";

                }


                else if (obk.brojPogodaka == "pocetni") {

                    document.getElementById("sadrzaj").innerHTML = "";
                       document.getElementById("sortiranje").style.visibility = "hidden";


                }

            }

            function drugaSlika() {

                this.src = "1024px-No_image_available.png"

            }


            function izlistavanjeBrojaStrana(obk) {

                document.getElementById("unutra").innerHTML = "";
                document.getElementById("unutra1").innerHTML = "";
                
                

                if (obk.brojstrana > 1) {


                    //napraviti paging objekat

                    $(".strelice").each(function () {

                   
                        $(this).css("visibility", "visible");

                    })



                    var strane = document.getElementById("unutra");
                    var strane1 = document.getElementById("unutra1");

                    for (i = 0; i < obk.brojstrana; i++) {




                        var strana = document.createElement("div");
                        strana.classList.add("stranica");
                        if (i == 0) {

                            strana.classList.add("obelezen");


                        }
                        strana.addEventListener("click", pozivAjax);
                        var text = document.createTextNode(i + 1);
                        strana.appendChild(text);

                        var strana1 = document.createElement("div");
                        strana1.classList.add("stranica");
                        if (i == 0) {

                            strana1.classList.add("obelezen");


                        }
                        strana1.addEventListener("click", pozivAjax);
                        var text1 = document.createTextNode(i + 1);
                        strana1.appendChild(text1);

                        strane.appendChild(strana);
                        strane1.appendChild(strana1);

                    }

                   
                }

                else

                {

                    $(".strelice").each(function () {

                     
                        $(this).css("visibility", "hidden");

                    })


                }


            }


            function pozivAjax() {

                var kliknutaStranica = this.innerHTML;





                if ($(this).hasClass("obelezen") != true) {

                    $(".obelezen").each(function () {

                    $(this).removeClass("obelezen");


                })

                $(".stranica").each(function () {

                    if ($(this).text() == kliknutaStranica) {

                        $(this).addClass("obelezen");

                    }
                })


                    var brojKliknuteStranice = parseInt(kliknutaStranica);

                    if (brojKliknuteStranice == 1)
                    {


                        objekatPocetni.offset = 0;
                        //var dzejsonZaSlanje = JSON.stringify(objekatPocetni)
                        //objekat = {dzejson: dzejsonZaSlanje};

                    }

                    else
                    {

                        objekatPocetni.offset = (brojKliknuteStranice - 1) * 20;
                        //var dzejsonZaSlanje = JSON.stringify(objekatPocetni)
                        //objekat = {dzejson: dzejsonZaSlanje};

                    }

                    poziv(objekatPocetni, this)

                    //pozivAjax(objekatPocetni, element)

                    //$.ajax({
                    //    url: "WebForm1.aspx/Vrati",
                    //    method: "POST",
                    //    contentType: "application/json; charset=utf-8",
                    //    data: JSON.stringify(objekat),
                    //    success: function (result) {

                    //       alert("POZIV USPEO");
                    //       alert(result.d);
                    //        primljeni = JSON.parse(result.d);
                    //        izlistavanjeSadrzaja(primljeni);

                    //        if (trenutnaStrana == null) {

                    //            izlistavanjeBrojaStrana(primljeni);

                    //        }

                    //       // trenutnaStrana = "1";

                    //    },

                    //    error: function () {

                    //        alert("POZIV NIJE USPEO!")

                    //    }



                    //})

                    trenutnaStrana = this.innerHTML;
                }

            }


            function nizListBox(id, niz){

                 var Elementi = document.getElementById(id).children

                for (i = 0; i < Elementi.length; i++) {


                    if (Elementi[i].selected) {

                        niz.push(Elementi[i].value);

                    }


                }


            }


            //document.getElementById("DropDownList3").addEventListener("change", function () {

            //    document.getElementById("strane").innerHTML = "";
            //    document.getElementById("sadrzaj").innerHTML = "";
            //    var x = this.value;
            //    objekatPocetni.sortiraj = x;
            //    poziv(objekatPocetni);




            //})

            function selektPromena(ovaj) {

             //   document.getElementById("unutra").innerHTML = "";
             //   document.getElementById("unutra1").innerHTML = "";

                if (ovaj.value != "")
                {
                    
                document.getElementById("sadrzaj").innerHTML = "";
                var x = ovaj.value;
                objekatPocetni.sortiraj = x;
                objekatPocetni.offset = 0;
                poziv(objekatPocetni, ovaj);

                }

            }



           


            //document.getElementsByClassName("strelice").addEventListener("click", function () {

            // //  var br

            //    if (this.innerHTML == "<") {

            //       // br = parseInt(trenutnaStrana) - 1;

            //        var trenutni = document.getElementById("unutra").getElementsByClassName("obelezen")[0].innerHTML
            //        var trenutniBroj = parseInt(trenutni);

            //        if (trenutniBroj > 1) {


            //            document.getElementById("unutra").getElementsByClassName("stranica")[trenutniBroj - 1].click();

            //        }

            //    }

            //    else if (this.innerHTML == "<<") {


            //        br = 1;

            //    }

            //    else if (this.innerHTML == ">") {


            //        br = parseInt(trenutnaStrana) - 1;

            //    }

            //    else if (this.innerHTML == ">>") {




            //    }






            //})



            function poziv(objekatStart, hendlerPoziva) {

               // var hendlerPozivaID = $(hendlerPoziva).prop("id");

                var ime_kontrole = $(hendlerPoziva).prop("tagName");

                var dzejsonZaSlanje = JSON.stringify(objekatStart)

            //    alert(dzejsonZaSlanje)

               var  objekatZadnji = {
                    dzejson: dzejsonZaSlanje, kontrola: ime_kontrole
                }; //jos jedan parametar

                $.ajax({
                    url: "WebForm1.aspx/Vrati",
                    method: "POST",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(objekatZadnji),
                    success: function (result) {

                        //  alert("POZIV USPEO");
                    //    alert(result.d);
                        primljeni = JSON.parse(result.d);
                        //  alert(string.rezultat);

                        //primljeni = JSON.parse(result.d);

                        //   if (primljeni.hasOwnProperty("brojstrana")) {

                        //brojSTR = primljeni.brojstrana;
                        //brojPGD = primljeni.brojPogodaka;


                        //}
                        if (ime_kontrole == "BUTTON") {

                            izlistavanjeSadrzaja(primljeni);
                            izlistavanjeBrojaStrana(primljeni);

                        }

                        else if (ime_kontrole == "SELECT") {

                            izlistavanjeSadrzaja(primljeni);
                            // izlistavanjeBrojaStrana(primljeni);
                            // reset stranice na 1

                            if (primljeni.brojstrana > 1) {
                                //napraviti da ne menja sve ovo je stranica vec 1!!!!!!

                                $(".obelezen").each(function () {

                                    $(this).removeClass("obelezen");

                                })

                                $(".stranica").each(function () {

                                    if ($(this).text() == "1") {

                                        $(this).addClass("obelezen");

                                    }


                                })

                            }

                        }

                        else if (ime_kontrole = "DIV")

                        {

                            izlistavanjeSadrzaja(primljeni);


                        }
                     

                        trenutnaStrana = "1";
                    //    document.getElementById("sortiranje").style.visibility = "visible";

                        var grupniObjekat = { dobijen: primljeni, poslat: objekatPocetni };

                        history.pushState(grupniObjekat, "", "WebForm1.aspx?nov=novo");


                    },

                    error: function () {

                        alert("POZIV NIJE USPEO!")

                    }

                })

            }

            function paging_osvezavanje(obk_primljeni)
            {

               // alert("radi");
                //mozda moze i sa offsetom
             //   poslati je uvek zadnji, nemas histori za njega tj prethodni sacuvan !!!

                if (obk_primljeni.brojPogodaka == 0) {

                    document.getElementById("unutra").innerHTML = "";
                    document.getElementById("unutra1").innerHTML = "";
                    document.getElementById("sortiranje").style.visibility = "hidden";
                       $(".strelice").each(function () {

                        $(this).css("visibility", "hidden");

                    })

                }


                else if (obk_primljeni.brojstrana > 1) {

               

                    document.getElementById("sortiranje").style.visibility = "visible";
                    izlistavanjeBrojaStrana(obk_primljeni);
                    var brojProsleStrane = (obk_primljeni.offset / 20) + 1;
                    var imebrojstranice = brojProsleStrane + "";


                    $(".obelezen").each(function () {

                        $(this).removeClass("obelezen");

                    })

                    $(".stranica").each(function () {

                        if ($(this).text() == imebrojstranice) {

                            $(this).addClass("obelezen");

                        }

                    })

                }

                else if (obk_primljeni.brojstrana == 1)
                {

                    document.getElementById("unutra").innerHTML = "";
                    document.getElementById("unutra1").innerHTML = "";

                    if (obk_primljeni.brojPogodaka < 2)
                    {

                          document.getElementById("sortiranje").style.visibility = "hidden";


                    }

                  
                    $(".strelice").each(function () {

                    $(this).css("visibility", "hidden");

                    })


                }

                else if (obk_primljeni.brojPogodaka == "pocetni") {


                    document.getElementById("unutra").innerHTML = "";
                    document.getElementById("unutra1").innerHTML = "";
                    $(".strelice").each(function () {

                        $(this).css("visibility", "hidden");

                    })

                    //select
                    document.getElementById("sortiranje").style.visibility = "hidden";

                }

              

            }


          document.getElementById("dugme_zamena").addEventListener("click", function () {


              document.getElementById("dugme").click();



          })

          //function restart_pretraga(obk) {



          //    alert(obk.marka)

            
          //    $("#ContentPlaceHolder1_DropDownList1").val(obk.marka);


          //    //if (obk.model != null) {

          //    //    alert(obk.model);

          //    //    document.getElementById("ContentPlaceHolder1_drugiTriger").setAttribute("Text", obk.model)
          //    //    //document.getElementById("ContentPlaceHolder1_drugiTriger").setAttribute("name", obk.model)
          //    //    alert(document.getElementById("ContentPlaceHolder1_drugiTriger").getAttribute("Text"));


          //    //    document.getElementById("ContentPlaceHolder1_drugiTriger").click();


          //    //}
        


          //    //alert(obk.model);

          

          //    //  //var karoserija = [];
          //    //  nizListBox("ContentPlaceHolder1_ListBox2", karoserija);
          //    //  //var gorivo = [];
          //    //  nizListBox("ContentPlaceHolder1_ListBox1", gorivo);

          //      document.getElementById("ContentPlaceHolder1_drugiTriger").click();

          //      $("#ContentPlaceHolder1_DropDownList5").val(obk.vrata)
          //      $("#ContentPlaceHolder1_DropDownList6").val(obk.lokacija) 

          //      var godiste = [];
          //      $("#ContentPlaceHolder1_DropDownList7").val(obk.godiste[0]);
          //      $("#ContentPlaceHolder1_DropDownList8").val(obk.godiste[1]);
          //      //godiste.push(datum1);
          //      //godiste.push(datum2);

          //      var cena = [];
          //      $("#ContentPlaceHolder1_Text1").val(obk.cena[0]);
          //      $("#ContentPlaceHolder1_Text2").val(obk.cena[1]);
          //      //cena.push(cena1);
          //      //cena.push(cena2);


          //    KontraNizListBox("ContentPlaceHolder1_ListBox1", obk.gorivo);
          //    KontraNizListBox("ContentPlaceHolder1_ListBox2", obk.karoserija);

          //    //    if (obk.model != null) {

          //    //    alert(obk.model);
          //    //     $("#ContentPlaceHolder1_DropDownList2").val(obk.model);

          //    //}

          //}

          //     function KontraNizListBox(id, niz){

          //         alert("ulazi u metodu");

          //         var Elementi = document.getElementById(id).children
          //         var duzinaniza = niz.length

          //         alert(Elementi.length);
          //         alert(duzinaniza);


          //         if (duzinaniza == 0) {


          //             for (k = 0; k < Elementi.length; k++) {

          //                 if (Elementi[k].selected) {


          //                     Elementi[k].selected = false;
          //                 }



          //             }



          //         }

          //         else {

          //                 for (i = 0; i < duzinaniza; i++) {

          //             for (j = 0; j < Elementi.length; j++) {

                           
          //                 if (Elementi[j].value == niz[i]) {

          //                     alert(niz[i]);
          //                     alert(Elementi[j].value)
          //                     Elementi[j].selected = true;
          //                     break;


          //                 }

          //                 else {

          //                     alert("usao OVDE!!!!")
          //                     Elementi[j].selected = false;

          //                 }


          //          }


          //      }



          //         }

          //  }


            window.onpopstate = function (event) {

                //history.replaceState(event.state, "", "");
                primljeni = event.state.dobijen
                objekatPocetni = event.state.poslat
                var x = event.state;
                izlistavanjeSadrzaja(x.dobijen);
                paging_osvezavanje(x.dobijen);
                restart_pretraga(objekatPocetni);
                

            }


    </script>

</asp:Content>








      


  



