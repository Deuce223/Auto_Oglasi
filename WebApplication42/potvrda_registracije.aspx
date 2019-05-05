<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="potvrda_registracije.aspx.cs" Inherits="WebApplication42.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery-3.3.1.min.js"></script>

    <style>

        .flex{

            display:flex;
            justify-content:center;
            align-items:center;

        }


    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="flex">

            <div id="moj" runat="server"><h3 id="heder" runat="server"></h3>
                <h3>BROWSER CE VAS  REDIREKTOVATI NA POCETNU STRANU</h3>

        </div>
        
            

        </div>
    </form>

    <script>
      
        $(document).ready(function () {

            var x = $("#heder").text();

            if (x == "USPESNO STE SE REGISTROVALI" ) {

                setTimeout(redirekcija, 5000);

            }
            else {


                setTimeout(redirekcija, 5000);

            }


        })

        function redirekcija() {


            location.href = "WebForm1.aspx";

        }


    </script>

</body>
</html>
