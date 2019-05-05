<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Poruke.aspx.cs" Inherits="WebApplication42.Poruke" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <style>


        

        .konteiner{

            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
            width:700px;
            margin:auto;


        }

          .konteiner1{

            display:flex;
            justify-content:center;
            align-items:center;
            width:700px;
            margin:auto;


        }

          
          .konteiner2{

            display:flex;
            justify-content:center;
            align-items:center;
            width:200px;
         


        }

        .dugme{

            width:120px;
            height:40px;
            background-color:black;
            color:white;
           // margin-left:10px;
            display:flex;
            justify-content:center;
            align-items:center;
            cursor:pointer;


        }

        textarea{

            width:350px;
            border-width:1px;
            padding:0px;
            height:250px;

        }

        input{


            width:350px;
            border-width:1px;
            padding:0px;
            height:25px;

        }


        .prostor{


            height:50px;
        }

        @media only screen and (max-width:800px){

            .konteiner1{


                width:500px;

            }

            .konteiner{


                width:500px;
            }

        }

            @media only screen and (max-width:500px){

            .konteiner1{


                width:100%;

            }

            textarea{

                width:100%;

            }

            input{


                width:100%;
            }

            .konteiner{


                width:100%;
            }

        }
    </style>

    <script src="jquery-3.3.1.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>

            STRANA ZA PORUKE!

            <div class="konteiner">
                <label>Naslov</label>
            <input type="text" id="naslov" />
              <%--  </div>--%>

                 <div class="prostor"></div>
<%--            <div class="konteiner">--%>

                <label>Poruka</label>
            <textarea id="polje"></textarea>
           </div>

            <div class="prostor"></div>

                  <div class="konteiner1">
         <div class="konteiner2">

           <div id="posalji" class="dugme">Posalji</div>
             </div>
                  <div class="konteiner2">
           <div id="odustani" class="dugme">Odustani</div>

                </div>

                      </div>

        </div>
    </form>


    <script>

        document.getElementById("posalji").addEventListener("click", function () {

            $("body").css("cursor", "wait");
            $("#dugme").css("cursor", "wait");

            var adresa = location.href;
            var index = adresa.lastIndexOf("=") + 1;
            var vlasnik = adresa.substring(index);

            var naslov = document.getElementById("naslov").value;
            var text = document.getElementById("polje").value;

            var objekat = { vlasnik: vlasnik, naslov: naslov, text: text };
            var objekatString = JSON.stringify(objekat);
            var dzejsonObjekat = {podaci:objekatString}

            $.ajax({
                url: "Poruke.aspx/UpisPoruke",
                method: "POST",
                contentType: "application/json; charset=utf-8",
                // data: JSON.stringify({ vlasnik: vlasnik }),
                data: JSON.stringify(dzejsonObjekat),
                success: function (result) {


                    alert("Radi");
                    alert(result.d);
                     $("body").css("cursor", "default");
                     $("#dugme").css("cursor", "pointer");


                },
                error: function () {

                    alert("Ne radi");
                    $("body").css("cursor", "default");
                    $("#dugme").css("cursor", "pointer");


                }

            })

        })

        document.getElementById("odustani").addEventListener("click", function () {


            history.back();


        })




    </script>

</body>
</html>
