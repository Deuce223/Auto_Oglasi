<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication42.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery-3.3.1.min.js"></script>

    
    <style type="text/css">

        .row{
            
            width:50%;
            margin:auto;
            display:flex;
            justify-content: center;
            align-items: center;
            flex-direction:column;
            margin-bottom:20px;

        }


    </style>




</head>



<body>
 
     <div class="row">

         <input type="text" id="username" />
         </div>
           <div class="row">
          <input type="password" id="lozinka" />
               </div>
                 <div class="row">
          <input type="button" id="dugme" value="ULOGUJ SE"/>
                     </div>
         <div class="rezultat">


         </div>


   
          
   
   
    <script>

        $(document).ready(function () {

            $("#dugme").click(function () {

                var x = $("#username").val();
                var y = $("#lozinka").val();

                var objekat = { username: x, lozinka: y };
                var objekatZaSlanje = { podaci: JSON.stringify(objekat) };

                pozivAJAX(objekatZaSlanje);


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

                },
                error: function ()
                {

                    alert("poziv nije uspeo!");


                }

            })

        }

        function rezultat(rez)
        {
            if (rez == "pogresna lozinka") {

                $(".rezultat").text(rez);


            }


            else {


                location.href = rez;

            }

        }


    </script>


</body>
</html>
