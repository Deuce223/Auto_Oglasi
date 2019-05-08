<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication42.WebForm2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script src="jquery-3.3.1.min.js"></script>

<style type="text/css">


#glavni
{

width:660px;
margin:auto;


}

.kont
{

width:640px;
margin:auto;
overflow:auto;
}

#moj
{
    float:left;
    width: 384px;
	background-color:white;

}

#moj:before{
    content: "";
    display: block;
    padding-top: 70%;  /*What you want the height to be in relation to the width*/
}



.slika{
    /*position:relative;*/
    display:flex;
    justify-content:center;
    align-items:center;
    position:  absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
}

#slide{
   
    margin:auto;
  max-width: 100%;
  max-height: 100%;

}


#ContentPlaceHolder2_prvi_desno{


    font-weight:700;

}

#ContentPlaceHolder2_drugi_desno{


    font-weight:700;

}

#ContentPlaceHolder2_side{

width:192px;
float:right;

/*background-color:red;*/
text-align:center;
}


.strelice{
    width:100%;
    position:absolute;
  

}


.mojaL{

    float:left;
    width:35%;
        

}

.mojaD{

    
    float:right;
    width:35%;
}

.levo{

    width:50%;
    /*width:20%;
    float:left;*/
}


.desno{

    width:50%;
    /*width:20%;
    float:right;*/
}


#ContentPlaceHolder2_karakteristike h3{

          border-bottom:1px brown solid;

}


#ContentPlaceHolder2_karakteristike{

    margin-top:40px;

}

.cenaside{

    background-color:coral;
    color:white;
    margin-top:0px;
    

}

#ContentPlaceHolder2_side p{
    font-family:'Sans Pro', sans-serif;
    margin-bottom:10px;
    margin-top:10px;
    text-align:left;
    font-size:14px;
}

#ContentPlaceHolder2_side h3{

   padding-top:10px;
   padding-bottom:10px;


}

span{

    color:antiquewhite;
    font-size:30px;

}

.deblje {

    font-weight:600;

}


#moj1{

    color:white;
}

#ContentPlaceHolder2_opremaX h3{

    border-bottom:1px brown solid;

}

.moj{

position:relative;

}


.moj1{

position:static;
}


.X{
position:absolute;
display:none;
color:white;
border:1px white solid;
cursor:pointer;

}

.X1{
display:initial;
/*visibility:visible;*/
top:20px;
right:30px;

}

.strelice1{

width:70%;

}

.prob1{

background-color:rgba(0,0,0,1);
}

.dodatni{

    width:33%;
    float:left;

}

#ContentPlaceHolder2_opis h3{

    border-bottom:1px brown solid;

}

#ContentPlaceHolder2_info h3{

    border-bottom:1px brown solid;

}

#ContentPlaceHolder2_poruka{

    width:100px;
    height:50px;
    color:white;
    background-color:black;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:smaller;
    cursor:pointer;

}

#ContentPlaceHolder2_moj1{


    display:none;



}

.fiksiran
{

    position:fixed;

}


.centralni{

    display:flex;
    justify-content:flex-start;
    align-items:flex-start;
    width:100%;


}


.unutrasnji{

    display:flex;
    justify-content:center;
    align-items:flex-start;
    width:50%;
    

}
/*.poruke{


    visibility:visible;

}


.skriven{

    visibility:hidden;

}*/


.modal{


    position:fixed;
    background-color:rgba(0, 0, 0, 0.8);
    top:0px;
    bottom:0px;
    left:0px;
    right:0px;
    display:flex;
    justify-content:center;
    align-items:center;

}

.hidden{

    display:none;


}

.poruka{

    display:flex;
    justify-content:center;
    align-items:center;
    flex-direction:column;
    width:400px;
    background-color:lightgray;
    /*box-shadow: 0px 1px 15px 10px rgb(207, 202, 202);*/
    border-radius:10px 10px;
    border:1px solid cadetblue;


}

.tasteri{

    width:90%;
    margin:auto;
    display:flex;
    justify-content:center;
    align-items:center;
    margin-bottom:30px;
 
}

.gumb{

    width:80px;
    height:35px;
    /*background-image: linear-gradient(to right, #f7f0f0, #1476ca);*/
    background-color:darkorange;
    color:white;
    display:flex;
    justify-content:center;
    align-items:center;
    cursor:pointer;
    border-radius: 6px 6px;


}

  input{

            width:300px;
            

        }

        textarea{

            width:300px;
            height:200px;

        }

        .uspeh{

            position:fixed;
            top:0px;
            left:0px;
            right:0px;
            bottom:0px;
            display:flex;
            justify-content:center;
            align-items:center;
            background-color:rgba(255, 255, 255, 0.6);
            color:lightgray;
            /*text-align:center;*/
            visibility:hidden;

        }

        .prazna{

            background-color:green;
            display:flex;
            justify-content:center;
            align-items:center;
            color:aliceblue;
            padding:5px;

        }
        
        .phone{

           width:33%;
           text-align:center;


        }

        #ContentPlaceHolder2_fonovi{


            display:flex;
            justify-content:center;
            align-items:center;
            margin-top:17px;

        }

        #ContentPlaceHolder2_poruka{

            margin:auto;

        }

@media only screen and (max-width:700px){

    #moj{

        width:90%;
        float:none;
        margin:auto;
        margin-bottom:20px;
       

    }

    #ContentPlaceHolder2_side{

        margin-top:10px;
        width:90%;
        float:none;
        margin:auto;
        text-align:center;
        display:flex;
        justify-content:center;
        align-items:center;
        flex-direction:column;
    }

    #ContentPlaceHolder2_side h3{


        width:95%;

    }
    
    #ContentPlaceHolder2_side p{


        margin-top:3px;
        margin-bottom:3px;

    }

    #glavni{

        width:100%;

    }

    .kont{

        width:100%;

    }

    #ContentPlaceHolder2_naslov{

        font-size:5vw;
        text-align:center;


    }

    span{

        font-size:5vw;

    }

    #ContentPlaceHolder2_info{

        width:90%;
        margin:auto;

    }

    #ContentPlaceHolder2_karakteristike{

        width:90%;
        margin:auto;

    }

    #ContentPlaceHolder2_opremaX{


        width:90%;
        margin:auto;


    }

    #ContentPlaceHolder2_opis{

        width:90%;
        margin:auto;

    }

    body p{

        margin-top:3px;
        margin-bottom:3px;
        font-size:2.8vw;

    }

    .centralni{

        flex-direction:column;

    }

    .unutrasnji{

        width:100%;

    }

        #ContentPlaceHolder2_opis div{

        font-size:2.8vw;

    }

        input{

            width:90%;
            

        }

        textarea{

            width:90%;

        }

        .poruka{

            width:95%;

        }
}

    </style>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

         <p id="moj1" runat="server"></p>
 
    <div id="glavni">
        <div class="kont">

            <h1 id="naslov" runat="server"></h1>

            <div id="moj" class="moj">
                <div id="prob" class="slika">

                <img id="slide" src="trav3.jpg" />
                    <div id="strelice" class="strelice">

                    <div id="str1" class="mojaL"><img src="desno.png" style="max-height:30%;max-width:30%" /></div>
                     <div id="str2" class="mojaD"><img src="levo.png" style="float:right;max-height:30%;max-width:30%"/></div>
                        </div>

                    	<div id="X" class="X">X</div>

                    </div>
                </div>

                <div id="side" runat="server">
                   
                 </div>

           

              <div style="clear:both"></div>

             <div id="info" runat="server">

                   <h3>Informacije o prodavcu</h3>

                 <div id="rrrttt" runat="server">
                     <p id="paragrafic" runat="server"></p>
               <%--      <div id="mob1" class="phone" runat="server"></div>
                       <div id="mob2" class="phone" runat="server"></div>
                       <div id="mob3" class="phone" runat="server"></div>--%>
                 </div>
                 <!-- ovde ide modal -->


                 <div class="modal hidden">

                     <div class="poruka">

                         <h4>naslov</h4>
                         <input type="text" id="naslov_poruke" />
                         <h4>tekst poruke</h4>
                         <textarea style="margin-bottom:25px" id="text_poruke"></textarea>

                         <div class="tasteri">

                             <div id="posalji" onclick="posalji(this)" class="gumb">Posalji</div>
                             <div style="width:10px"></div>
                             <div class="gumb" onclick="odustani(this)">Odustani</div>


                         </div>


                     </div>




                 </div>

                 <div class="uspeh">
                     <div class="prazna">
                         <h2>PORUKA POSLATA</h2>

                     </div></div>


               <%--  <div id="poruka" onclick="kontakt(this)" runat="server" class="poruke">PORUKA</div>--%>
                    <div id="poruka" onclick="modal(this)" runat="server" class="poruke">PORUKA</div>


                 <div id="fonovi" runat="server"></div>

            </div>

<%--<button onclick="pokreni()">pokreni</button>

<button onclick="zaustavi()">zaustavi</button>--%>

<div id="karakteristike" runat="server">
    <h3>Karakteristike vozila</h3>


    <div class="centralni">

        <div class="unutrasnji">

            <div class="levo" id="prvi_levo" runat="server">        
        

    </div>
       <div class="levo" id="prvi_desno" runat="server">
      

    </div>

        </div>


        <div class="unutrasnji">


               <div class="desno" id="drugi_levo" runat="server">
       
    </div>
              
    <div class="desno" id="drugi_desno" runat="server">
       
    </div>
   

        </div>


        </div>
  

        </div>


             
       <div style="clear:both"></div>
  
    <div id="opremaX" runat="server">
    <h3>Dodatna oprema</h3>
   <%-- <div class="levo" id="Div2" runat="server">        
        

    </div>
       <div class="levo" id="Div3" runat="server">
      

    </div>
    <div class ="desno" id="Div4" runat="server">
       
    </div>
      <div class ="desno" id="Div5" runat="server">
       
    </div>--%>

        <div class="dodatni" id="prvi_oprema" runat="server">

        </div>
        <div class="dodatni" id="drugi_oprema" runat="server">

        </div>
        <div class="dodatni" id="treci_oprema" runat="server">


        </div>

</div>
              <div style="clear:both"></div>
            <div id="opis" runat="server">
                <h3>Opis</h3>
                <div id="opisni" runat="server"></div>


            </div>

            
        </div>

        </div>
 

     <script>

        $(document).ready(function () {

           

            var x = $("#ContentPlaceHolder2_moj1").text();
            //$("#ContentPlaceHolder2_moj1").css("display", "none");
            var obj = JSON.parse(x);

            //$("#naslov").text(obj.marka + " " + obj.model + " " + obj.oznaka);

            document.getElementById("slide").src = obj.slike[0];

            document.getElementById("moj").addEventListener("mouseover", function(){
document.getElementById("str1").style.visibility = "visible";
document.getElementById("str2").style.visibility = "visible";
})

document.getElementById("glavni").addEventListener("mouseout", function(){
document.getElementById("str1").style.visibility = "hidden";
document.getElementById("str2").style.visibility = "hidden";
})



document.getElementById("str2").addEventListener("click", function(event){

    event.stopPropagation();

var x = document.getElementById("slide");

    var ceoLink = x.src
    var index = ceoLink.indexOf("Slike");
    var slika = ceoLink.substr(index);

    for (i = 0; i < obj.slike.length; i++){

if(slika == obj.slike[i]){

    if (i < obj.slike.length - 1) {

x.src = obj.slike[i+1];
//dodeliKlasu(i+1);
pokreni1();
break;

}

else if( i == obj.slike.length - 1){

x.src = obj.slike[0];
//dodeliKlasu(0);
pokreni1();
break;

}

}

}

})

document.getElementById("str1").addEventListener("click", function(event){

    event.stopPropagation();

var x = document.getElementById("slide");

    var ceoLink = x.src
    var index = ceoLink.indexOf("Slike");
    var slika = ceoLink.substr(index);



    for (i = 0; i < obj.slike.length; i++){

if(slika == obj.slike[i]){

if(i > 0){

x.src = obj.slike[i-1];
//dodeliKlasu(i-1);
pokreni1();
break;


}

else if( i == 0){

    x.src = obj.slike[obj.slike.length - 1];
   // dodeliKlasu(obj.slike.length - 1);
pokreni1();
break;

}

}

}

})




document.getElementById("prob").addEventListener("click",function(){

document.getElementById("prob").classList.add("fiksiran");
document.getElementById("moj").classList.add("moj1");
document.getElementById("X").classList.add("X1");
document.getElementById("strelice").classList.add("strelice1");
document.getElementById("prob").classList.add("prob1");



})

document.getElementById("X").addEventListener("click",function(event){

event.stopPropagation();


document.getElementById("strelice").classList.remove("strelice1");
document.getElementById("prob").classList.remove("prob1");
document.getElementById("moj").classList.remove("moj1");
    document.getElementById("X").classList.remove("X1");


    document.getElementById("prob").classList.remove("fiksiran");


    document.getElementById("str1").click();
    document.getElementById("str2").click();

})




        })

        function pokreni1(){
document.getElementById("slide").style.opacity = "0.5";
var pokretac = setInterval(function(){


var prov = document.getElementById("slide").style.opacity;
var broj = parseFloat(prov);
if(broj < 1){
broj = broj + 0.1;
document.getElementById("slide").style.opacity = "" + broj;
}
else{
clearInterval(pokretac);
}

},100)}


         function kontakt(element) {

            var name = element.getAttribute("name");

             location.href = "Poruke.aspx?vlasnik=" + name;
             //varka da li tako treba!?

         }


         function modal(element) {

             
             var proveraLoga = JSON.parse(document.getElementById("ContentPlaceHolder2_moj1").innerHTML);
             var logovanje = proveraLoga.log;

             if (logovanje == "da") {

                 document.getElementsByClassName("modal")[0].classList.remove("hidden");

             }

            
             else
             {


                 window.location.href = "Login.aspx";

             }

         }

    function odustani(element){


        document.getElementById("naslov_poruke").value = "";
        document.getElementById("text_poruke").value = "";
        document.getElementsByClassName("modal")[0].classList.add("hidden");

         }




         /* document.getElementById("posalji").addEventListener("click", function */

         function posalji(element) {


                 $("body").css("cursor", "wait");
                 $("#dugme").css("cursor", "wait");

                 //naci vlasnika

                 //var adresa = location.href;
                 //var index = adresa.lastIndexOf("=") + 1;
                 //var vlasnik = adresa.substring(index);

                 var obdzekt = JSON.parse(document.getElementById("ContentPlaceHolder2_moj1").innerHTML)
                 var vlasnik = obdzekt.vlasnik;

                 //naci vlasnika

                 //var naslov = document.getElementById("naslov").value;
                 //var text = document.getElementById("polje").value;

                 var naslov = document.getElementById("naslov_poruke").value
                 var text = document.getElementById("text_poruke").value;

                 var objekat = { vlasnik: vlasnik, naslov: naslov, text: text };
                 var objekatString = JSON.stringify(objekat);
                 var dzejsonObjekat = { podaci: objekatString }

                 //alert(vlasnik);
                 //alert(naslov);
                 //alert(text);
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

                         ///
                         odustani();
                         document.getElementsByClassName("uspeh")[0].style.visibility = "visible";

                         setTimeout(function () {

                             document.getElementsByClassName("uspeh")[0].style.visibility = "hidden";


                         },2000)


                     },
                     error: function () {

                         alert("Ne radi");
                         $("body").css("cursor", "default");
                         $("#dugme").css("cursor", "pointer");


                     }

                 })

             }


        //document.getElementById("odustani").addEventListener("click", function () {


        //    history.back();


        //})



    </script>


</asp:Content>


