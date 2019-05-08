<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Korisnicka_strana.aspx.cs" Inherits="WebApplication42.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .glavni{

            margin-top:50px;
            width:60%;
            margin:auto;
            display:flex;
            justify-content:center;
            align-items:center;

        }

        .dugme{


            width:33%;
            color:white;
            background-color:black;
            height:40px;
            display:flex;
            justify-content:center;
            align-items:center;
            cursor:pointer;

        }


        .sadrzaj{

            width:900px;
            margin:auto;
            margin-top:10px;
            /*background-color:goldenrod;*/

        }

        .stavke{

            /*padding-bottom:25px;*/
            margin-top:5px;
            width:500px;
            margin:auto;
            display:flex;
            justify-content:center;
            align-items:center;
            height:30px;
            /*border:1px solid cadetblue;
            border-radius: 2px 2px;
            margin-bottom:15px;*/
            margin-top:5px;
            margin-bottom:5px;


        }

        /*.stavke_poruke{

            margin-top:5px;
            width:600px;
            margin:auto;
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
            height:20px;
            border:1px solid cadetblue;
            border-radius: 4px 4px;
            margin-bottom:15px;
            cursor:pointer;



        }*/

        .slika{

            width:100px;
            height:60px;
            display:flex;
            justify-content:center;
            align-items:center;


        }

        img{

            max-height:100%;
            max-width:100%;

        }

        .button{

            height:30px;
            width:105px;
            color:white;
            background-color:black;
            display:flex;
            justify-content:center;
            align-items:center;
            margin-right:10px;
            font-size:smaller;
            cursor:pointer;


        }

        .sredina{


            width:200px;
            display:flex;
            justify-content:center;
            align-items:center;


        }

        .delovi{

            width:200px;
            display:flex;
            justify-content:center;
            align-items:center;


        }

        .bold{


            font-weight:800;

        }


        .delovi_convo{


            width:520px;
            margin:auto;
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:flex-start;
            /*border:1px solid cadetblue;*/
            /*box-shadow:silver, 10px, 10px;*/
            box-shadow: -2px -1px 32px 0px rgba(0,0,0,0.75);
            border-radius: 2px 2px;
            margin-bottom:15px;
            cursor:pointer;
            /*padding:15px;*/
        }

          .delovi_convo1{


            width:600px;
            margin:auto;
            display:flex;
            /*flex-direction:column;*/
            height:60px;
            justify-content:center;
            align-items:center;
            border:1px solid cadetblue;
            border-radius: 2px 2px;
            margin-bottom:15px;
            cursor:pointer;
            box-shadow: -2px -1px 32px 0px rgba(0,0,0,0.75);
            /*ova klasa je za oglase!!!*/
        
        }

        .otvoren
        {


        }

        .delovi_text{

            word-break:break-all;
            width:500px;
            text-align:left;
            /*margin-top:15px;*/
            padding-top:15px;
            margin-bottom:15px;
            /*display:flex;
            justify-content:center;
            align-items:center;*/
            background-color:lavender;


        }

        
        .stavke1{

            /*margin-top:20px;*/
            /*padding-top:25px;*/
            width:500px;
            margin:auto;
            display:flex;
            justify-content:center;
            align-items:center;
            flex-direction:column;
            /*height:30px;*/
            border:1px solid cadetblue;
            border-radius: 2px 2px;
            margin-bottom:25px;
            box-shadow: -2px -1px 15px -6px rgba(0,0,0,0.75);
           


        }

        .delovi_naslov{

              width:500px;
            display:flex;
            text-align:left;
            background-color:silver;



        }

        .ostatak{

            width:500px;
            margin:auto;
            display:flex;
            justify-content:center;
            align-items:center;
            flex-direction:column;
            margin-bottom:10px;
            margin-top:10px;
            /*padding:10px;*/
            

        }

        .zaStavke{


            width:500px;
            margin:auto;
            display:flex;
            justify-content:center;
            align-items:center;
            flex-direction:column;
            margin-bottom:10px;
            margin-top:10px;

        }

        .slanje{

            width:500px;
            margin:auto;
            display:flex;
            justify-content:center;
            align-items:center;
            flex-direction:column;


        }

        .klikSlanje{


            width:50px;
            height:30px;
            margin:auto;
            background-color:black;
            color:white;
            display:flex;
            justify-content:center;
            align-items:center;
            margin-top:10px;
            margin-bottom:10px;

        }

        .textareaDiv{

            margin:auto;
            width:500px;
            display:flex;
            justify-content:center;
            align-items:center;
            margin-top:10px;
            margin-bottom:10px;
            

        }

        .nevidljiv{


            display:none;
        }

        .pun{



        }

        textarea{


            width:500px;
            height:90px;
        }

        .paging{

            width:600px;
            margin:auto;
            display:flex;
            justify-content:center;
            align-items:center;
            visibility:hidden;

        }

        .strelice{

            width:30px;
            height:20px;
            display:flex;
            justify-content:center;
            align-items:center;
            cursor:pointer;
            border:1px solid black;
            margin-left:5px;

        }

        .strana{

            width:30px;
            height:20px;
            display:flex;
            justify-content:center;
            align-items:center;
            cursor:pointer;
            border:1px solid black;
            margin-left:5px;

        }


        .plava
        {

            background-color:blue;
            color:white;


        }

        .unutrasnji
        {


            display:flex;
            justify-content:center;
            align-items:center;
          

        }

        .obrisi{

            width:70px;
            height:40px;
            background-color:firebrick;
            color:white;
            cursor:pointer;
            display:flex;
            justify-content:center;
            align-items:center;
            margin:auto;


        }

        .obavestenje{

          
            height:60px;
            background-color:white;
            color:black;
            width:50%;
            margin:auto;
            display:flex;
            justify-content:center;
            align-items:center;

        }

    </style>
    <script src="jquery-3.3.1.min.js"></script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">

  <div style="width:100%;height:100px"></div>

    <div class="glavni">

        <div class="dugme" id="oglas">Oglasi</div>
        <div class="dugme" id="poruke">Poruke</div>
        <div class="dugme" id="info" runat="server">Admin</div>

    </div>

     <div style="width:100%;height:100px"></div>

    <div id="gornji" class="paging">

        <div class="strelice" onclick="strelice_klik(this)"><<</div>
           <div class="strelice" onclick="strelice_klik(this)"><</div>
        <div id="unutrasnji" class="unutrasnji"></div>
         <div class="strelice" onclick="strelice_klik(this)">></div>
           <div class="strelice" onclick="strelice_klik(this)">>></div>

    </div>

    <div class="sadrzaj" id="content">

    </div>

     <div id="donji" class="paging">

            <div class="strelice" onclick="strelice_klik(this)"><<</div>
           <div class="strelice" onclick="strelice_klik(this)"><</div>
        <div id="unutrasnji1" class="unutrasnji"></div>
         <div class="strelice" onclick="strelice_klik(this)">></div>
           <div class="strelice" onclick="strelice_klik(this)">>></div>


    </div>


    <script>

     //   var obkt;
    //    var brisanjeIndex;
        var brStr;
        var trenutnaStr;

        $(document).ready(function () {

            //sakri();
            //document.getElementById("content").innerHTML = "";

            $("#oglas").click(function () {

                //$("html").css("cursor", "wait");
                //$(".dugme").css("cursor", "wait");

                var objekat = { offset: 0, tip_pretrage: 1 };

                $.ajax({
                    url: "Korisnicka_strana.aspx/Oglas",
                    method: "POST",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(objekat),
                    success: function (result) {


                        //  $(".sadrzaj").first().text(result.d);
                        //$("html").css("cursor", "default");
                        //$(".dugme").css("cursor", "cursor");
                        //alert("radi");
                        //alert(result.d);

                        var obkt = JSON.parse(result.d);
                        //var obkt = { broj: 1 };
                        brStr = obkt.BrojStrana;
                        //       alert(obkt.BrojStrana);

                        var istorija = { sadrzaj: obkt, trenutnaStrana: 0 };

                        //         alert(istorija.sadrzaj.podaci[0].ID);

                        //alert(istorija.trenutnaStrana);
                        //alert(istorija.sadrzaj);
                        //alert(istorija.sadrzaj.broj);

                        trenutnaStr = 0;

                        history.pushState(istorija, "", "Korisnicka_strana.aspx?history=da");


                        //alert("poziv");
                        sadrzaj(result.d);



                        //  paging(result.d); za sad ne ovako!


                    },
                    error: function () {


                        alert("ne radi");
                        //$("html").css("cursor", "default");
                        // $(".dugme").css("cursor", "cursor");


                    }






                })




            })


            $("#poruke").click(function () {

                $.ajax({
                    url: "Korisnicka_strana.aspx/Poruke",
                    method: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {

                        //alert("radi");
                        //alert(result);
                        //alert(result.d);

                        var dobijenePoruke = JSON.parse(result.d);
                        sadrzaj_poruke(dobijenePoruke);
                        //sadrzaj_poruke(result.d);


                    },
                    error: function () {


                        alert("ne radi")

                    }






                })






            })




            //history

            if (history.state === null) {


                //pocetno stanje!!
                var ob1 = { BrojStrana: -1 };
                var ob2 = { sadrzaj: ob1 };
                history.replaceState(ob2, "", "Korisnicka_strana.aspx?history=da");


            }

            else {

                sadrzajHistory(history.state);
                brStr = history.state.sadrzaj.BrojStrana;
                //alert(brStr);
                //ovde pozovi trenutni objekat kad se vratis sa druge stranice!!!!!


            }




        


      

        })

              document.getElementById("ContentPlaceHolder4_info").addEventListener("click", function () {

                //mora jos neki ajax koji daje broj rezultata!!

                document.getElementById("content").innerHTML = "";
                //document.getElementById("gornji").innerHTML = "";
                  //document.getElementById("donji").innerHTML = "";
                  sakri();

                var div = document.createElement("div");
                div.classList.add("obrisi");
             
                  div.addEventListener("click", obrisiSve);

                var text = document.createTextNode("OBRISI");
                div.appendChild(text);
                  document.getElementById("content").appendChild(div);

               
                  kolicina();



        })

        function kolicina() {

               $.ajax({
                   url: "Admin.aspx/brojIsteklih",
                   method: "POST",
                   contentType: "application/json; charset=utf-8",
                   success: function (result) {

                     //  alert("obrisano i radi");
                       alert(result.d);


                       var por = document.createElement("div");
                       var text = document.createTextNode("UKUPNO " + result.d + " ISTEKLIH OGLASA");
                       por.classList.add("obavestenje");
                       por.appendChild(text);
                       document.getElementById("content").appendChild(por);




                   },
                   error: function (result) {

                        alert("ne radi");

                   }




                  })


        }



           function obrisiSve() {

                alert("usao");

                $.ajax({
                    url: "Admin.aspx/ObrisiSve",
                    method: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {

                     //   alert("obrisano i radi");

                    },
                    error: function (result) {

                        alert("ne radi");

                    }



                })

            }


            function sadrzaj(rezultat) {

                document.getElementById("content").innerHTML = "";
                //document.getElementById("gornji").innerHTML = "";
                //document.getElementById("donji").innerHTML = "";
                //document.getElementById("unutrasnji").innerHTML = "";
                //document.getElementById("unutrasnji1").innerHTML = "";
                var objekat1 = JSON.parse(rezultat);


                if (objekat1.BrojStrana == -1) {

                    document.getElementById("content").innerHTML = "";
                    sakri();
                    //alert('radi ovaj sa -1');


                    //pagging treba da bude nevidljiv

                }
                else {
                    var objekat = JSON.parse(rezultat);
                    //alert(rezultat);

                    //treba da bude vidljiv i da se izlista broj stranica!!!!!

                    for (i = 0; i < objekat.podaci.length; i++) {


                        var mainDiv = document.createElement("div");
                        mainDiv.classList.add("delovi_convo1");

                        var glavniDiv = document.createElement("div"); //glavni div   
                        glavniDiv.classList.add("stavke");


                        mainDiv.setAttribute("id", objekat.podaci[i].ID);
                        mainDiv.addEventListener("click", auto);
                        //    glavniDiv.setAttribute("id", i + "glavni");

                        var slikaDiv = document.createElement("div"); //div za sliku;
                        slikaDiv.classList.add("slika");

                        var slika = document.createElement("img");
                        slika.setAttribute("src", objekat.podaci[i].Slika);
                        //   slika.setAttribute("alt", objekat.podaci[i].LinkZaBrisanje);

                        slikaDiv.appendChild(slika);
                        glavniDiv.appendChild(slikaDiv);


                        var informacije = document.createElement("div");
                        informacije.classList.add("sredina");
                        var text = document.createTextNode(objekat.podaci[i].Marka + " " + objekat.podaci[i].Model + " " + objekat.podaci[i].Oznaka + " " + objekat.podaci[i].Godiste)
                        informacije.appendChild(text);

                        glavniDiv.appendChild(informacije);

                        var izmeniDugme = document.createElement("div");
                        izmeniDugme.classList.add("button");
                        izmeniDugme.addEventListener("click", izmena);
                        var textIzmena = document.createTextNode("IZMENI");

                        izmeniDugme.appendChild(textIzmena);

                        var obrisiDugme = document.createElement("div");
                        obrisiDugme.setAttribute("id", objekat.podaci[i].ID);
                        obrisiDugme.classList.add("button");
                        var textBrisanje = document.createTextNode("OBRISI");

                        obrisiDugme.appendChild(textBrisanje);

                        obrisiDugme.addEventListener("click", obrisi);


                        glavniDiv.appendChild(izmeniDugme);
                        glavniDiv.appendChild(obrisiDugme);
                        mainDiv.appendChild(glavniDiv);


                        document.getElementById("content").appendChild(mainDiv);

                    }
                    if (objekat.BrojStrana > 1) {
                        document.getElementById("unutrasnji").innerHTML = "";
                        document.getElementById("unutrasnji1").innerHTML = "";

                        otkri();
                        for (i = 0; i < objekat.BrojStrana; i++) {

                            var stranicaDiv = document.createElement("div");
                            var stranicaDiv1 = document.createElement("div");
                            stranicaDiv.classList.add("strelice");
                            stranicaDiv1.classList.add("strelice");
                            stranicaDiv.addEventListener("click", page);
                            stranicaDiv1.addEventListener("click", posredniKlik);

                            if (i == 0) {

                                stranicaDiv.classList.add("plava");
                                stranicaDiv1.classList.add("plava");

                            }

                            var textstranica = document.createTextNode(i + 1);
                            var textstranica1 = document.createTextNode(i + 1);

                            stranicaDiv.appendChild(textstranica);
                            stranicaDiv1.appendChild(textstranica1);
                            //ovde dodati event na dugme


                            document.getElementById("unutrasnji").appendChild(stranicaDiv);
                            document.getElementById("unutrasnji1").appendChild(stranicaDiv1);

                            //$("#unutrasnji").appendChild(stranicaDiv);
                            //$("#unutrasnji").appendChild(stranicaDiv);

                        }


                    }

                }

            }
        

        function sadrzaj_poruke(rezultat) {

            document.getElementById("content").innerHTML = "";

            sakri();

            for (i = 0; i < rezultat.podaci.length; i++) {

                var joglavniji = document.createElement("div");
                joglavniji.classList.add("delovi_convo");
                joglavniji.setAttribute("id", rezultat.podaci[i].id);

                var glavniDiv = document.createElement("div");
             //   glavniDiv.setAttribute("id", rezultat.podaci[i].id);
                glavniDiv.classList.add("stavke");

                if (rezultat.podaci[i].status_poruke == 2)
                {

                    glavniDiv.classList.add("bold");

                }

                joglavniji.addEventListener("click", convo);

                var redniBroj = document.createElement("div");
                redniBroj.classList.add("delovi");
                var brojText = document.createTextNode(i + 1);
                redniBroj.appendChild(brojText);


                var saljeDiv = document.createElement("div");
                saljeDiv.classList.add("delovi");
                var saljeText = document.createTextNode(rezultat.podaci[i].naslov);
                saljeDiv.appendChild(saljeText);
            

                var naslovDiv = document.createElement("div");
                naslovDiv.classList.add("delovi");
                var naslovText = document.createTextNode(rezultat.podaci[i].Poceo_chat);
                naslovDiv.appendChild(naslovText);


                glavniDiv.appendChild(redniBroj);
                glavniDiv.appendChild(saljeDiv);
                glavniDiv.appendChild(naslovDiv);
                joglavniji.appendChild(glavniDiv);


                //ostatak

                var ostatakDiv = document.createElement("div");
                ostatakDiv.classList.add("ostatak");
                ostatakDiv.classList.add("nevidljiv");

                var zaStavkeDiv = document.createElement("div");
                zaStavkeDiv.classList.add("zaStavke"); //u stavke idu stavke1 tj poruke!!!!

                var textAreaDiv = document.createElement("div");
                textAreaDiv.classList.add("textreaDiv");
                var textarea = document.createElement("textarea");
                textAreaDiv.appendChild(textarea);
                textAreaDiv.addEventListener("click", propagacija);

                var dugmeDiv = document.createElement("div");
                dugmeDiv.classList.add("klikSlanje");
                var textDugme = document.createTextNode("posalji");
                dugmeDiv.appendChild(textDugme);
                dugmeDiv.addEventListener("click", propagacijaDugme);
                textAreaDiv.appendChild(dugmeDiv);

                ostatakDiv.appendChild(zaStavkeDiv);
                ostatakDiv.appendChild(textAreaDiv);

                joglavniji.appendChild(ostatakDiv);


                document.getElementById("content").appendChild(joglavniji);



            }





        }

        function obrisi(event) {

            event.stopPropagation();

            var id = this.getAttribute("id");
         //   var element = $(this).parent();
        //    brisanjeIndex = parseInt(element.getAttribute("id"));

            $.ajax({
                url: "Korisnicka_strana.aspx/Obrisi",
                method: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: id }),
                success: function (result) {

                    //alert('radi');
                    //alert(result.d);
                    //alert(result);

                   

                    document.getElementById("oglas").click();
                     //ajax za brisanje slika OVDE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



                    //ne radi!
                    //$(this).parent().html("");
                    //$(this).parent().text("");
                    //var x = $(this).parent();

                    //document.getElementById("#content").removeChild(x)

                //    sadrzajBrisanje(obkt);
                   


                },
                error: function () {


                    alert('ne radi!');
                }



            })

        }

        function convo() {

            var id = this.getAttribute("id");

            var porukeHederi = document.getElementsByClassName("delovi_convo");

            if (this.classList.contains("otvoren"))
            {

                //treba sakriti ili otkriti .ostatak


             //   if (this.getElementsByClassName("ostatak")[0].classList.contains("nevidljiv")) {


                  //  this.getElementsByClassName("ostatak")[0].classList.remove("nevidljiv");
                 //   this.classList.remove("otvoren");



             //   }

             //   else {


                     this.getElementsByClassName("ostatak")[0].classList.add("nevidljiv");
                     this.classList.remove("otvoren");
                     document.getElementById(id).getElementsByClassName("stavke")[0].style.paddingBottom = "0px";
             //   }




               
                //var sadrzajStavke = this.getElementsByClassName("stavke1");
                //for (i = 0; i < sadrzajStavke.length; i++)
                //{

                //    this.removeChild(this.getElementsByClassName("stavke1")[i]);
                //    i--;
                //}

                //this.classList.remove("otvoren");
                //document.getElementById(id).getElementsByClassName("stavke")[0].style.paddingBottom = "0px";

            }

            else
            {

                
            for (i = 0; i < porukeHederi.length; i++)
            {

                if (porukeHederi[i].classList.contains("otvoren"))
                {

                    porukeHederi[i].getElementsByClassName("ostatak")[0].classList.add("nevidljiv");
                    porukeHederi[i].classList.remove("otvoren");
                    document.getElementById(id).getElementsByClassName("stavke")[0].style.paddingBottom = "0px";

                    //var stavkeSve = porukeHederi[i].getElementsByClassName("stavke1");
                    //for (j = 0; j < stavkeSve.length; j++)
                    //{

                    //    porukeHederi[i].removeChild(porukeHederi[i].getElementsByClassName("stavke1")[j]);
                    //    j--;

                    //}

                    //porukeHederi[i].classList.remove("otvoren");
                    document.getElementById(id).getElementsByClassName("stavke")[0].style.paddingBottom = "0px";
                    //break;

                }



            }

                this.classList.add("otvoren");
                this.getElementsByClassName("ostatak")[0].classList.remove("nevidljiv");

                if (!this.classList.contains("pun"))
                {

                    this.classList.add("pun");

                       $.ajax({
                url: "Korisnicka_strana.aspx/Convo1",
                method: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: id }),
                success: function (result) {

                 //   alert("radi");
                //    alert(result.d);

                    var podaci = JSON.parse(result.d);

                    izlistavanjePoruka(podaci, id);
                    

                },
                error: function () {


                    alert("ne radi");
                  
                }

            })



                }

         

            }

        }

        function izlistavanjePoruka(objekat, id) {

            //document.getElementById(id).style.height = "400px";

        //    document.getElementById(id).getElementsByClassName("stavke")[0].style.paddingBottom = "25px";

            for (i = 0; i < objekat.convo_lista.length; i++)
            {
                var glavniDiv = document.createElement("div");
                glavniDiv.classList.add("stavke1");

                if (objekat.convo_lista[i].bold == "da")
                {

                     glavniDiv.classList.add("bold");

                }

                var poslaoDiv = document.createElement("div");
                poslaoDiv.classList.add("delovi_naslov");
                var poslaoText = document.createTextNode(objekat.convo_lista[i].username + " wrote");
                poslaoDiv.appendChild(poslaoText);

                var sadrzajDiv = document.createElement("div");
                sadrzajDiv.classList.add("delovi_text");
                var sadrzajText = document.createTextNode(objekat.convo_lista[i].sadrzaj);
                sadrzajDiv.appendChild(sadrzajText);

                var datumDiv = document.createElement("div");
                datumDiv.classList.add("delovi");
                var datumText = document.createTextNode(objekat.convo_lista[i].datum);
                datumDiv.append(datumText);

                glavniDiv.appendChild(poslaoDiv);
                glavniDiv.appendChild(sadrzajDiv);
                glavniDiv.appendChild(datumDiv);

                document.getElementById(id).getElementsByClassName("ostatak")[0].getElementsByClassName("zaStavke")[0].appendChild(glavniDiv);

              //  document.getElementById(id).appendChild(glavniDiv);


            }





        }


        function propagacija(event) {

            event.stopPropagation();


        }

        function propagacijaDugme(event) {

            event.stopPropagation();

           //naci odgovarajuci textbox;

            var id = this.parentElement.parentElement.parentElement.getAttribute("id");
            //alert(id);
            //alert(y);

            var textPoruke = $(this).prev().val();

            if (textPoruke != "") {

                //alert("ima nesto otkucano")

                var objekat = { id: id, textPoruke: textPoruke };
                var objekatDzejson = JSON.stringify(objekat);
                var obk = { podaci: objekatDzejson };


                $.ajax({
                    url: "Korisnicka_strana.aspx/UpisiPoruku",
                    method: "POST",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(obk),
                    success: function (result) {

                        //alert(result.d);
                        //alert("poziv uspeo");
                        var objekat = JSON.parse(result.d);
                        izlistavanjePoruka(objekat,id);

                     //   objekat koji vratim iz upisiPoruku metode, id imam gore !!!
                       // izlistavanjePoruka()


                    },
                    error: function () {


                        alert("poziv neuspesan");

                    }

                })

            }

            else {

                alert("morate uneti text");

            }
        }

        function sakri()
        {
            document.getElementById("gornji").style.visibility = "hidden";
            document.getElementById("donji").style.visibility = "hidden";
            //document.getElementById("content").style.visibility = "hidden";

        }

        function otkri()
        {

            document.getElementById("gornji").style.visibility = "visible";
            document.getElementById("donji").style.visibility = "visible";
            //document.getElementById("content").style.visibility = "visible";


        }

        function page() {

            if (!this.classList.contains("plava")) {


                if (this.innerHTML == "1")
                {

                    var broj = 0;

                }
                else
                {

                    var broj = (parseInt(this.innerHTML) - 1) * 5;

                }

                    $(".plava").each(function () {


                        $(this).removeClass("plava");

                    })

                    //for (j = 0; j < document.getElementsByClassName("plava").length; j++) {

                    //    document.getElementsByClassName("plava")[j].classList.remove("plava");

                    //}

                this.classList.add("plava");

                var redni = parseInt(this.innerHTML) - 1;
                //alert(redni);
                

                document.getElementById("unutrasnji1").getElementsByClassName("strelice")[redni].classList.add("plava");
                    // dodati klasu u dole ili gore !!!!


                    //   this.classList.add("plava")


                    var objekat = { offset: broj, tip_pretrage: 2 };

                    $.ajax({
                        url: "Korisnicka_strana.aspx/Oglas",
                        method: "POST",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(objekat),
                        success: function (result) {


                            //  $(".sadrzaj").first().text(result.d);
                            //$("html").css("cursor", "default");
                            //$(".dugme").css("cursor", "cursor");
                        //    alert("radi");
                       //     alert(result.d);

                            obkt = JSON.parse(result.d);
                            obkt.BrojStrana = brStr;
                            //alert(brStr);
                            //alert(obkt.BrojStrana);
                         //   trenutnaStr = parseInt(this.innerHTML) - 1;
                          //  alert(trenutnaStr);
                            istorija = { sadrzaj: obkt, trenutnaStrana: redni };
                            history.pushState(istorija, "", "Korisnicka_strana.aspx?history=da");
                            sadrzaj(result.d);

                            //  paging(result.d); za sad ne ovako!


                        },
                        error: function () {


                            alert("ne radi");
                            //$("html").css("cursor", "default");
                            // $(".dugme").css("cursor", "cursor");


                        }


                    })


                }


        }

        function posredniKlik()
        {

            var trenutniIndex = parseInt(this.innerHTML) - 1;
            document.getElementById("unutrasnji").getElementsByClassName("strelice")[trenutniIndex].click();



        }

        function strelice_klik(element)
        {

            var znak = element.innerHTML;
         //   alert(znak);

            if (znak == "&lt;") {

                var trenutni = parseInt(document.getElementById("unutrasnji").getElementsByClassName("plava")[0].innerHTML) - 1;
           //     alert(trenutni);
                if (trenutni > 0) {

                    document.getElementById("unutrasnji").getElementsByClassName("strelice")[trenutni - 1].click();

                }


            }

            else if (znak == "&gt;") {

                var trenutni = parseInt(document.getElementById("unutrasnji").getElementsByClassName("plava")[0].innerHTML) - 1;
                if (trenutni < document.getElementById("unutrasnji").getElementsByClassName("strelice").length - 1) {

                    document.getElementById("unutrasnji").getElementsByClassName("strelice")[trenutni + 1].click();

                }



            }

            else if (znak == "&lt;&lt;") {


                document.getElementById("unutrasnji").getElementsByClassName("strelice")[0].click();

            }

            else
            {

                document.getElementById("unutrasnji").getElementsByClassName("strelice")[document.getElementById("unutrasnji").getElementsByClassName("strelice").length - 1].click();


            }

        

        }

        function auto()
        {

            var id = this.getAttribute("id");

            location.href = "WebForm2.aspx?ID=" + id;


        }

        window.onpopstate = function (event)
        {

            sadrzajHistory(event.state);



        }
        

         function sadrzajHistory(rezultat) {

             document.getElementById("content").innerHTML = "";

             //var objekat = JSON.parse(rezultat) //znak pitanja

             if (rezultat.sadrzaj.BrojStrana == -1)
            {

                document.getElementById("content").innerHTML = "";
                 sakri();
               //  alert("radi!!!!!!!!!!!!!!!!!!!!!!!!!!yeah MCSTOJA")


                //pagging treba da bude nevidljiv

            }
            else
            {
                //alert(JSON.stringify(rezultat))
                //alert(rezultat.trenutnaStrana);
                //alert(JSON.stringify(rezultat.sadrzaj));
                
              
                //var objekat = JSON.parse(rezultat);
                //alert(rezultat);

                //alert(rezultat.trenutnaStrana);
                //alert(rezultat.sadrzaj);
                //alert(rezultat.sadrzaj.BrojStrana);
                //treba da bude vidljiv i da se izlista broj stranica!!!!!

                for (i = 0; i < rezultat.sadrzaj.podaci.length; i++)
                {
                  //  alert(JSON.stringify(rezultat.sadrzaj.podaci[i].ID));

                    var mainDiv = document.createElement("div");
                    mainDiv.classList.add("delovi_convo1");

                    var glavniDiv = document.createElement("div"); //glavni div   
                    glavniDiv.classList.add("stavke");


                    mainDiv.setAttribute("id", rezultat.sadrzaj.podaci[i].ID);
                 //   alert(rezultat.sadrzaj.podaci[i].ID);
                    mainDiv.addEventListener("click", auto);
                    //    glavniDiv.setAttribute("id", i + "glavni");

                    var slikaDiv = document.createElement("div"); //div za sliku;
                    slikaDiv.classList.add("slika");

                    var slika = document.createElement("img");
                    slika.setAttribute("src", rezultat.sadrzaj.podaci[i].Slika);
                    slika.setAttribute("alt", rezultat.sadrzaj.podaci[i].LinkZaBrisanje);

                    slikaDiv.appendChild(slika);
                    glavniDiv.appendChild(slikaDiv);


                    var informacije = document.createElement("div");
                    informacije.classList.add("sredina");
                    var text = document.createTextNode(rezultat.sadrzaj.podaci[i].Marka + " " + rezultat.sadrzaj.podaci[i].Model + " " + rezultat.sadrzaj.podaci[i].Oznaka + " " + rezultat.sadrzaj.podaci[i].Godiste)
                    informacije.appendChild(text);

                    glavniDiv.appendChild(informacije);

                    var izmeniDugme = document.createElement("div");
                    izmeniDugme.classList.add("button");
                    izmeniDugme.addEventListener("click", izmena);
                    var textIzmena = document.createTextNode("IZMENI");

                    izmeniDugme.appendChild(textIzmena);

                    var obrisiDugme = document.createElement("div");
                    obrisiDugme.setAttribute("id", rezultat.sadrzaj.podaci[i].ID);
                    obrisiDugme.classList.add("button");
                    var textBrisanje = document.createTextNode("OBRISI");

                    obrisiDugme.appendChild(textBrisanje);

                    obrisiDugme.addEventListener("click", obrisi);


                    glavniDiv.appendChild(izmeniDugme);
                    glavniDiv.appendChild(obrisiDugme);
                    mainDiv.appendChild(glavniDiv);


                    document.getElementById("content").appendChild(mainDiv);

                }
                    if (rezultat.sadrzaj.BrojStrana > 1)
                    {
                         document.getElementById("unutrasnji").innerHTML = "";
                          document.getElementById("unutrasnji1").innerHTML = "";
                        otkri();
                        for (i = 0; i < rezultat.sadrzaj.BrojStrana; i++)
                        {

                            var stranicaDiv = document.createElement("div");
                            var stranicaDiv1 = document.createElement("div");
                            stranicaDiv.classList.add("strelice");
                            stranicaDiv1.classList.add("strelice");
                            stranicaDiv.addEventListener("click", page);
                            stranicaDiv1.addEventListener("click", posredniKlik);

                            if (rezultat.trenutnaStrana == i)
                            {

                                stranicaDiv.classList.add("plava");
                                stranicaDiv1.classList.add("plava");

                            }
                        
                            var textstranica = document.createTextNode(i + 1);
                            var textstranica1 = document.createTextNode(i + 1);
                            
                            stranicaDiv.appendChild(textstranica);
                            stranicaDiv1.appendChild(textstranica1);
                        //ovde dodati event na dugme


                            document.getElementById("unutrasnji").appendChild(stranicaDiv);
                            document.getElementById("unutrasnji1").appendChild(stranicaDiv1);

                            //$("#unutrasnji").appendChild(stranicaDiv);
                            //$("#unutrasnji").appendChild(stranicaDiv);

                        }


                    }

                }

        }


        function izmena(event)
        {
            event.stopPropagation();
            var idAuta = this.parentElement.parentElement.getAttribute("id");
            //alert(idAuta);
            location.href = "WebForm7.aspx?ID=" + idAuta;





        }


    </script>
</asp:Content>
