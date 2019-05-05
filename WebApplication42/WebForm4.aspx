<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="WebApplication42.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <style type="text/css">

         
        body
        {

            background-image:url(poyadina.png);

        }


        .glavni{width:70%;
                margin:auto;
                display:flex;
                flex-direction:column;
                justify-content:center;
                align-items:center;
        }

        input{

            width:220px;

        }
     </style>

    <script src="jquery-3.3.1.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="glavni">

          <input type="text" oninput="provera(this)" name="korisnik" onblur="regular(this)" /><label>Korisnicko ime</label>
          <input type="password" name="lozinka" oninput="regular(this)" /><label>Lozinka</label>
          <input type="password" name="druga_lozinka" oninput="regular(this)" /><label>Ponovi Lozinku</label>
          <input type="email" oninput="provera(this)"  name="email" onblur="regular(this)"/><label>Email</label>
          <input type="text" name="ime" oninput="regular(this)" /><label>Ime</label>
          <input type="text" name="prezime" oninput="regular(this)"/><label>Prezime</label>
          <input type="text" name="mob1" oninput="regular(this)" /><label>Mobilni telefon 1</label>
          <input type="text" name="mob2" oninput="regular(this)" /><label>Mobilni telefon 2</label>
          <input type="text" name="fixni" oninput="regular(this)" /><label>Fiksni telefon</label>

            <input type="button" id="dugme" onclick="return false"/>

        </div>
    </form>

    <div id="moj" ></div>

    <script>


        
        var korisnik = false;
        var lozinka = false;
        var lozinka_opet = false;
        var email = false;
        var ime = false;
        var prezime = false;
        var mobilni1 = false;
        var mobilni2 = false;
        var fiksni = false;


        function provera(element) {

            var vrednost = element.value;
            var sql;
            element.style.backgroundColor = "white";

                if (element.getAttribute("name") == "korisnik") {

                    sql = "USERNAME";

                    //if (vrednost.length > 2) {

                        var obk = { vrednost: vrednost, sql: sql }
                        var dzejson = JSON.stringify(obk);
                        var obk1 = { podaci: dzejson };
                        var dzejsonFinal = JSON.stringify(obk1);

                        mojAjax(dzejsonFinal, element);
                      

                    //}

                    //else {

                    //    korisnik = false;

                    //}

                   //ovde regular za username;


                }

                else {


                       sql = "MeJL";
                   // var reg = /^[A-Za-z][A-Za-z0-9\.\+\-]{2,}@[A-Za-z0-9]{3,}\.[A-Za-z]{2,4}$/;                  
                        var obk = { vrednost: vrednost, sql: sql }
                        var dzejson = JSON.stringify(obk);
                        var obk1 = { podaci: dzejson };
                        var dzejsonFinal = JSON.stringify(obk1);

                        mojAjax(dzejsonFinal, element);
                        



                }

        }


        function rezultat(rez, element) {


            if (rez == "OK") {

                
                element.style.backgroundColor = "green";
                document.getElementById("moj").innerHTML = "";

                if (element.getAttribute("name") == "korisnik") {

                    korisnik = true;

                }

                else {


                      email = true;


                }

            }

            else {

                element.style.backgroundColor = "red";
                document.getElementById("moj").innerHTML = rez;

                if (element.getAttribute("name") == "korisnik") {

                    korisnik = false;

                }

                else {

                    email = false;


                }

            }


        }



        function mojAjax(dzejsonFinal, element) {


                $.ajax({
                    url: "WebForm4.aspx/Provera",
                    method: "POST",
                    contentType: "application/json; charset=utf-8",
                    data: dzejsonFinal,
                    success: function (result) {

                        //alert("poziv radi");
                        //alert(result.d);

                        rezultat(result.d, element)
                       

                    },
                    error: function () {

                        alert("poziv nije uspeo");

                    }





                })



        }


        function regular(element) {

            document.getElementById("moj").innerHTML = "";

            if (element.getAttribute("name") == "korisnik") {


                if (element.value.length < 3) {


                    element.style.backgroundColor = "red";
                    korisnik = false;
                    document.getElementById("moj").innerHTML = "USERNAME mora biti duzi od 2 karaktera";

                }

                else {

                    // ne treba nista

                }


            }

            else if (element.getAttribute("name") == "email") {


                var reg = /^[A-Za-z][A-Za-z0-9\.\+\-]{2,}@[A-Za-z0-9]{3,}\.[A-Za-z]{2,4}$/

                if (!reg.test(element.value)) {


                    element.style.backgroundColor = "red";
                    email = false;
                    document.getElementById("moj").innerHTML = "UNESiTE Email u pravilnom formatu";


                }

                else {

                    //nista?

                }

            }

            else if (element.getAttribute("name") == "lozinka") {


                var reg6 = /\d/
                var reg7 = /[A-Z]/
                var reg8 = /[a-z]/
                var reg9 = /\s/

                if (reg6.test(element.value) && reg7.test(element.value) && reg8.test(element.value) && !reg9.test(element.value) && element.value.length > 6) {


                    element.style.backgroundColor = "green";
                    lozinka = true;


                }

                else {

                    document.getElementById("moj").innerHTML = "Lozinka mora sadrzati bar jedan broj i jedno malo i veliko slovo, minimalne duzine 7 karaktera";
                    element.style.backgroundColor = "red";
                    lozinka = false;

                }

            }

            else if (element.getAttribute("name") == "ime" || element.getAttribute("name") == "prezime") {

                //var vvvv = element.value;
                //var wwww = vvv.length;
                //var reg = /\s/;

                if (element.value.length < 3 ) {


                    document.getElementById("moj").innerHTML = "ime i prezime moraju biti duzi od 2 karaktera!";
                    element.style.backgroundColor = "red";

                    if (element.getAttribute("name") == "ime") {

                        ime = false;

                    }

                    else {


                        prezime = false;

                    }

                 

                }

                else {

                    
                    element.style.backgroundColor = "green";
                    ime = true;

                      if (element.getAttribute("name") == "ime") {

                        ime = true;

                    }

                    else {


                        prezime = true;

                    }

                }

            }


            else if (element.getAttribute("name") == "druga_lozinka") {


                if (element.value == document.getElementsByName("lozinka")[0].value) {


                    element.style.backgroundColor = "green";
                    lozinka_opet = true;

                }

                else {


                    element.style.backgroundColor = "red";
                    lozinka_opet = false;


                }

            }

                else if (element.getAttribute("name") == "mob1" || element.getAttribute("name") == "mob2" ) {

                var reg1 = /^06[\d]{7,8}$/;


                if (reg1.test(element.value)) {


                    element.style.backgroundColor = "green";

                    if (element.getAttribute("name") == "mob1") {

                        mobilni1 = true;

                    }

                    else {

                        mobilni2 = true;

                    }
                

                }

                else {


                    element.style.backgroundColor = "red";
                       if (element.getAttribute("name") == "mob1") {

                        mobilni1 = false;

                    }

                    else {

                        mobilni2 = false;

                    }


                }

            }

              else if (element.getAttribute("name") == "fixni" ) {

                var reg1 = /^0[\d]{9,10}$/;


                if (reg1.test(element.value)) {

                    element.style.backgroundColor = "green";
                    fiksni = true;

                   }

                    else {

                         element.style.backgroundColor = "red";
                        fiksni = false;

                    }
                
                }

        }

        //var objekatSlanje;

        $(document).ready(function(){

            document.getElementById("dugme").addEventListener("click", function () {

               $("body").css("cursor", "progress");


                if (korisnik && lozinka && lozinka_opet && email && ime && prezime && mobilni1) {


                    //var kor = document.getElementsByTagName("input").length;

                    var kor1 = document.getElementsByClassName("glavni")[0].getElementsByTagName("input").length - 1

                    var nizPodataka = [];

                    for (i = 0; i < kor1; i++) {

                        if (i == 2) {

                            continue;

                        }

                        nizPodataka.push(document.getElementsByClassName("glavni")[0].getElementsByTagName("input")[i].value);


                    }

                    // var obkDzejson = JSON.stringify({ korisnik: korisnik, lozinka: lozinka, email:email ime: ime, prezime: prezime, mobilni1: mobilni1 });
                    objekatSlanje = { podaci: nizPodataka };

                    $.ajax({
                        url: "WebForm4.aspx/Registracija",
                        method: "POST",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify(objekatSlanje),
                        success: function (result) {

                          //  alert("radi");
                            location.href = result.d;
                            //location.href = "WebForm1.aspx";


                        },
                        error: function () {


                            alert("ne radi");

                        }
                    })
                }
            })
        })




    </script>


</body>
</html>
