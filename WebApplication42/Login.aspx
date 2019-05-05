<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication42.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery-3.3.1.min.js"></script>

    
    <style type="text/css">



        body{

            background-image:url(poyadina.png);

        }

        .modal{

            position:absolute;
            top:0px;
            left:0px;
            right:0px;
            bottom:0px;
            display:flex;
            justify-content:center;
            align-items:center;
           


        }

        .dialog{

            width:350px;
            height:250px;
            border:1px solid #0094ff;
            border-radius:5px;
            margin:auto;
            display:flex;
            justify-content:center;
            align-items:center;
            flex-direction:column;
            box-shadow: 3px 4px 16px 1px rgba(0,0,0,0.6);
            background-color:white;


        }

        .row{

            display:flex;
            justify-content:center;
            align-items:center;
            width:300px;
            height:45px;
            margin-top:7px;
            margin-bottom:7px;


        }

        input[type=button]{


            height:30px;
            width:100%;
            background-image:linear-gradient(to right,#038afe, #8cc9fc 50%, #038afe );
            color:white;
            border:none;

        }

        input[type=text]{


            height:26px;
            width:100%;


        }
 
        
        input[type=password]{


            height:26px;
            width:100%;


        }

    </style>




</head>



<body>
 
  
    <div class="modal">
   <%--     <div style="width:100%;height:20px"></div>--%>
    <div class="dialog">

     <div class="row">

         <input type="text" id="username" placeholder="username ili email" />
         </div>
           <div class="row">
          <input type="password" id="lozinka" placeholder="lozinka" />
               </div>
                 <div class="row">
          <input type="button" id="dugme" value="ULOGUJ SE"/>
                     </div>


            <div class="rezultat" style="margin-top:5px;margin-bottom:5px;color:red;font-family:Arial, Helvetica, sans-serif;height:15px;">


         </div>

        <div><a href="WebForm4.aspx">Ako nemate nalog registrujte se</a></div>

        
      
        </div>
   
        </div>
     

        

   
          
   
   
    <script>

        $(document).ready(function () {

            $("#dugme").click(function () {

                $("body").css("cursor", "progress");

                document.getElementsByClassName("rezultat")[0].innerHTML = "";

                var usr = false;
                var psw = false;

                var x = $("#username").val();
                var y = $("#lozinka").val();

                if (x == "") {

                    document.getElementsByClassName("rezultat")[0].innerHTML = "unesite username ili email";
                    $("body").css("cursor", "default");

                }

                else {

                    usr = true;

                    if (y == "")
                    {

                        document.getElementsByClassName("rezultat")[0].innerHTML = "unesite lozinku";
                        $("body").css("cursor", "default");

                    }

                    else
                    {

                    psw = true;

                    }

                }


                if (usr == true && psw == true)
                {


                var objekat = { username: x, lozinka: y };
                var objekatZaSlanje = { podaci: JSON.stringify(objekat) };

                pozivAJAX(objekatZaSlanje);

                }

            })
        })

        function pozivAJAX(obkZaSlanje)
        {

            $.ajax({
                url: "Login.aspx/Provera",
                method: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(obkZaSlanje),
                success: function (result)
                {
                 //   alert("poziv uspeo");
                 //   alert(result.d);
                    rezultat(result.d);
                    $("body").css("cursor", "default");

                },
                error: function ()
                {

                    alert("poziv nije uspeo!");


                }

            })

        }

        function rezultat(rez)
        {
            if (rez == "pogresna lozinka" || rez == "ne postoji takav korisnik!") {

                $(".rezultat").text(rez);


            }


            else {


                location.href = rez;

            }

        }


    </script>


</body>
</html>
