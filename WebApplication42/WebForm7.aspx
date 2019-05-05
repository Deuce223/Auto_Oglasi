<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm7.aspx.cs" Inherits="WebApplication42.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style type="text/css">

        .glavni{width:70%;
                margin:auto;
        }

        .slika{
            position:relative;
            width:20%;
            float:left;
            border:1px solid brown;
            margin:5px;
        }


        .slika:before{
            content:"";
            display:block;
            padding-top:60%;

        }


        img{
            /*display:inline-block;*/
            max-width:100%;
            max-height:100%;


        }

  

        .slikica {
            position:absolute;
            display: flex;
            justify-content: center;
            align-items: center;
            position: absolute;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
     

        }


        .obelezen{


        }

        .nevidljiv{

            visibility:hidden;
            position:absolute;
            cursor:pointer;
            color:white;


        }


        .obavezan{



        }

        .area{

            height:180px;
            width:400px;

        }

        .nevidljiv_upload{

            display:none;

        }

        .container{

            width:40%;
            margin:auto;

        }

        option:first-child
        {

            color:gainsboro;


        }

        .stil{

            width:50%;
            height:31px;
            margin-right:15px;
            border:0.5px solid gray;
           

        }

        #oprema{

            display:flex;


        }

        .stakva_opreme{

            margin-top:10px;
            margin-bottom:10px;
            

        }

        .tru{

            width:50%;
            

        }

        .row{

           display:flex;
           align-items:center;
           justify-content:center;
           margin-bottom:30px;
        

        }
   

        .UpdatePanel1{

            width:50%;
            margin-right:15px;

        }

        input[type="number"]{

            width:50%;
            padding-left:6px;
            padding-bottom:0px;
            padding-top:0px;
            border-width:1px;
            margin-right:15px;
            height:30px;
            border:0.5px solid gray;
        }
           input[type="text"]{

            width:50%;
            padding-left:6px;
            padding-bottom:0px;
            padding-top:0px;
            border-width:1px;
            margin-right:15px;
            height:30px;
            border:0.5px solid gray;
        }


            ::-webkit-input-placeholder {
                color: black;
            }

            @media only screen and (max-width:800px){

             

                .container{

                    width:100%;
                }

              
                .row{

                    flex-direction: column; 
                    margin-bottom:5px;

                }
              
                select{

                    margin-bottom:10px;
                }

                input{

                    margin-bottom:10px
                }

                .slika{

                    width:40%;
                }

                #oprema{

                    flex-direction:column;

                }


                .tru{

                    width:50%;
                    margin:auto;
                }
            }



         @media only screen and (max-width:0px) {


             .container{

                 width:100%;

             }
            .contariner h3{

                 text-align:center;
             }

           
         }

    </style>

    <script src="jquery-3.3.1.min.js"></script>

</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">

      <div class="container">
  
        
        <div>
            <h3 style="align-content:center;">Marka i model</h3>
            <div class="row">
                
             <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" CssClass="obavezan stil" onchange="bojaPromena(this)"></asp:DropDownList>
            <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" class="UpdatePanel1" >
                <ContentTemplate>
                   
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="obavezan" style="width:100%; height:31px;border:0.5px solid gray;" onchange="bojaPromena(this)"></asp:DropDownList>
                </ContentTemplate>
  
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged" />
                </Triggers>

            </asp:UpdatePanel>
               </div>

            <div class="row" style="text-align:left"><asp:TextBox ID="TextBox7" runat="server" placeholder="oznaka" CssClass="obavezan stil" onchange="bojaPromena(this)" ></asp:TextBox>
                <asp:TextBox ID="TextBox43" runat="server" style="visibility:hidden"></asp:TextBox>

            </div>

             <h3>Osnovne informacije</h3>
          
            <div class="row">
         <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" placeholder="godiste" CssClass="obavezan"  onchange="bojaPromena(this)" ></asp:TextBox>
         <asp:TextBox ID="TextBox2" runat="server" TextMode="Number" placeholder="kubikaza" CssClass="obavezan" onchange="bojaPromena(this)"></asp:TextBox>
             </div>
            <div class="row">
         <asp:DropDownList ID="DropDownList3" runat="server" CssClass="obavezan stil" onchange="bojaPromena(this)"></asp:DropDownList>
         <asp:DropDownList ID="DropDownList4" runat="server" CssClass="obavezan stil" onchange="bojaPromena(this)"></asp:DropDownList>
             </div>

         
            <h3>Karakteristike vozila</h3>
            <div class="row">   
         <asp:TextBox ID="TextBox3" runat="server" TextMode="Number" placeholder="snaga" CssClass="obavezan" onchange="bojaPromena(this)"></asp:TextBox>
         <asp:TextBox ID="TextBox4" runat="server" TextMode="Number" placeholder="konja" CssClass="obavezan" onchange="bojaPromena(this)"></asp:TextBox>
             </div>
            <div class="row">
                 <asp:DropDownList ID="DropDownList7" runat="server" CssClass="obavezan stil" onchange="bojaPromena(this)" style="width:51%"></asp:DropDownList>
         <asp:TextBox ID="TextBox5" runat="server" TextMode="Number" placeholder="kilometraza" CssClass="obavezan stil" onchange="bojaPromena(this)"></asp:TextBox> 
            </div>
           <div class="row">       
         <asp:DropDownList ID="DropDownList5" runat="server" CssClass="obavezan stil" onchange="bojaPromena(this)"></asp:DropDownList>
         <asp:DropDownList ID="DropDownList6" runat="server" CssClass="obavezan stil" onchange="bojaPromena(this)"></asp:DropDownList>
            </div> 
            <div class="row">
         <asp:DropDownList ID="DropDownList8" runat="server" CssClass="obavezan stil" onchange="bojaPromena(this)"></asp:DropDownList>        
         <asp:DropDownList ID="DropDownList9" runat="server" CssClass="obavezan stil" onchange="bojaPromena(this)"></asp:DropDownList>
                </div>
            <div class="row">
         <asp:DropDownList ID="DropDownList11" runat="server" CssClass="obavezan stil" onchange="bojaPromena(this)"></asp:DropDownList>
         <asp:DropDownList ID="DropDownList12" runat="server" CssClass="obavezan stil" onchange="bojaPromena(this)"></asp:DropDownList>
                </div>
            <div class="row">
         <asp:DropDownList ID="DropDownList13" runat="server" CssClass="obavezan stil" onchange="bojaPromena(this)"></asp:DropDownList>
         <asp:DropDownList ID="DropDownList14" runat="server" onchange="bojaPromena(this)" CssClass="obavezan stil"></asp:DropDownList>     
            </div>

          
            <h3>Poreklo vozila</h3>
            <div class="row"><asp:DropDownList ID="DropDownList10" runat="server" CssClass="obavezan stil" onchange="bojaPromena(this)"></asp:DropDownList>
                <asp:TextBox ID="TextBox45" runat="server" style="visibility:hidden"></asp:TextBox>
            </div>
          
            <h3>Cena</h3>
            <div class="row">
         <asp:TextBox ID="TextBox6" runat="server" TextMode="Number"></asp:TextBox><label><asp:CheckBox ID="CheckBox1" runat="server" />Cena fiksna</label>
            </div>

        </div>



 
<%--    <div id="ddd">...</div>
    <div id="ddd1">...</div>--%>

               <h3>Dodatna oprema</h3>
    <div id="oprema" runat="server">
        

        <div class="tru">
        <div class="stakva_opreme"><label><input type="checkbox" value="Elektricni podizaci" id="podizaci" runat="server" />Elektricni podizaci</label></div>
        <div class="stakva_opreme"><label><input type="checkbox" value="Servo" id="servo" runat="server" />Servo</label></div>
         <div class="stakva_opreme"><label><input type="checkbox" value="Elektricni retrovizori" id="Elektricni" runat="server" />Elektricni retrovizori</label></div>
         <div class="stakva_opreme">   <label><input type="checkbox" value="Putni racunar" id="Putni_racunar" runat="server" />Putni racunar</label></div>
        </div>
     

   <div class="tru">
        <div class="stakva_opreme"><label><input type="checkbox" value="Centralna brava" id="centralna" runat="server" />Centralna brava</label></div>
         <div class="stakva_opreme"><label><input type="checkbox" value="Daljinsko zakljucavanje" id="daljinsko" runat="server" />Daljinsko zakljucavanje</label></div>
         <div class="stakva_opreme"><label><input type="checkbox" value="Metalik boja" id="metalik" runat="server" />Metalik boja</label></div>
         <div class="stakva_opreme"><label><input type="checkbox" value="Tonirana stakla" id="tonirana" runat="server" />Tonirana stakla</label></div>
             </div>     
      
         </div>

<%--    <button id="dugmence" onclick="pokupi()">obrisi</button>--%>

     
          <h3>Slike</h3>
    <div id="glavni" runat="server">
        <div class="row">
        <div class="slika"><div id="i1" class="slikica obelezen" runat="server"><img id="slika1" runat="server" src="hatchback-512.png" /><div id="l1" runat="server" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i2" class="slikica obelezen" runat="server"><img id="slika2" runat="server" src="hatchback-512.png" /><div id="l2" runat="server" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i3" class="slikica obelezen" runat="server"><img id="slika3" runat="server" src="hatchback-512.png" /><div id="l3" runat="server" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i4" class="slikica obelezen" runat="server"><img id="slika4" runat="server" src="hatchback-512.png" /><div id="l4" runat="server" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i5" class="slikica obelezen" runat="server"><img id="slika5" runat="server" src="hatchback-512.png" /><div id="l5" runat="server" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
            </div>
        <div class="row">
        <div class="slika"><div id="i6" class="slikica obelezen" runat="server"><img id="slika6" runat="server" src="hatchback-512.png" /><div id="l6" runat="server" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i7" class="slikica obelezen" runat="server"><img id="slika7" runat="server" src="hatchback-512.png" /><div id="l7" runat="server" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i8" class="slikica obelezen" runat="server"><img id="slika8" runat="server" src="hatchback-512.png" /><div id="l8" runat="server" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i9" class="slikica obelezen" runat="server"><img id="slika9" runat="server" src="hatchback-512.png" /><div id="l9" runat="server" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i10" class="slikica obelezen" runat="server"><img id="slika10" runat="server" src="hatchback-512.png" /><div id="l10" runat="server" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
            </div>
    </div>

   <input type="file" id="moj" onchange="slanje()" class="nevidljiv_upload"/>
  <div class="row"><input type="button" id="upload" value="Dodaj sliku" /></div>

    <div id="obavestenje"></div>
    <div style="clear:both">
     
            <h3>Opis vozila</h3>
        <div class="row"><textarea maxlength="2000" class="area" id="opis_vozila" runat="server"></textarea></div>  
    </div>
 


  <div class="row"><button id="dugme1" onclick="return false" >klikni!!!</button></div>

        </div>




     <script>

        //var del;

        //var photo;
      

        //var linkovi = [];
        //var brisanjeLinkovi = [];
            //  var linkoviDodavanje = [];


         var formData = new FormData();
         var linkoviBrisanje = [];
    
         

        function slanje() {

            var elementi = document.getElementsByClassName("obelezen");

            if (elementi.length != 0)
            {

               
                var fajl = document.getElementById("moj").files[0];


                if (fajl.type == "image/png" || fajl.type == "image/jpeg")
                {
                    var duzina = elementi[0].getAttribute("id").length - 1;
                    var rec = elementi[0].getAttribute("id").substr(duzina);
                    var identifikacija = parseInt(rec) - 1;
                //    alert(elementi[0].getAttribute("id"));

                    //alert(identifikacija);
                    formData.append("image" + identifikacija, fajl);

                    var reader = new FileReader();
                    reader.readAsDataURL(fajl);
                    reader.addEventListener("load", function ()
                    {


                        if (elementi.length != 0)
                        {

                            elementi[0].firstChild.setAttribute("src", this.result);
                            elementi[0].getElementsByClassName("nevidljiv")[0].style.visibility = "visible";
                         //   var identifikacija = parseInt(elementi[0].getAttribute("id").substr(21)) - 1;
                        //    alert(identifikacija);
                            //alert(elementi[0].getAttribute("id"));
                            elementi[0].classList.remove("obelezen");

                        }


                    })

                }

                else
                {

                    alert("moguce je uneti samo slike!")

                }
            }

            else

            {

                document.getElementById("obavestenje").innerHTML = "dostignut je makmsimalni broj slika";

            }
          
        }


        //function moja()

        //{
      

        //    var broj = document.getElementsByClassName("obelezen").length
        //    if (broj != 0)
        //    {
        //        for (i = 0; i < broj; i++) {
                 

        //            var x = document.getElementsByClassName("obelezen")[i];

        //                x.getElementsByClassName("nevidljiv")[0].style.visibility = "visible";
        //                x.firstChild.setAttribute("src", photo);
        //                x.firstChild.setAttribute("alt", del);

        //                x.classList.remove("obelezen");


        //                break;

        //        }

        //    }

        //}


     
        
         function obrisi(element) {
             //  var id = parseInt(element.getAttribute("id")) - 1;


             if (element.classList.contains("bazaslika")) {

                 var index = element.getAttribute("id").indexOf("_") + 2;
                 var sub = element.getAttribute("id").substr(index);
                 //    alert(sub);
                 var id = parseInt(sub) - 1;

                 //    alert(id);




                 //    var del = document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].alt;
                 //     document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].alt = "";

                 var src = document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].src;
               //  alert(src);

                 document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].src = "hatchback-512.png";

                 element.style.visibility = "hidden";
                 document.getElementsByClassName("slikica")[id].classList.add("obelezen");


                 //var broj = src.lastIndexOf("/") + 1;
                 //var substr = src.substr(broj);

                 var br = src.indexOf("Slike");
                 var br1 = src.lastIndexOf("?");
                 var ss = src.substring(br, br1);
               //  alert(ss);
              //   var sub = src.substr(br);
               //  alert(sub);
               //  alert(substr);

                 linkoviBrisanje.push(ss);
                 //var name = document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].name;
                 element.classList.remove("bazaslika");
                 //brisanjeLinkovi.push(del);

             }

             else
             {

                 
                 var index = element.getAttribute("id").indexOf("_") + 2;
                 var sub = element.getAttribute("id").substr(index);
                 //    alert(sub);
                 var id = parseInt(sub) - 1;

                     //alert(id);

                 //    var del = document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].alt;
                 //     document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].alt = "";

                 var src = document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].src;
             //    alert(src);

                 document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].src = "hatchback-512.png";

                 element.style.visibility = "hidden";
                 document.getElementsByClassName("slikica")[id].classList.add("obelezen");


                 var broj = src.lastIndexOf("/") + 1;
                 var substr = src.substr(broj);
                 formData.delete("image" + id);

              //   alert(substr);

                // linkoviBrisanje.push(substr);
                 //var name = document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].name;

                 //brisanjeLinkovi.push(del);







             }



        }

        //var listaLinkova = [];

        function pokupi(lista, del)
        {
            var duzina = document.getElementsByClassName("slikica");
            var elements = document.getElementsByClassName("slikica");

            for (i = 0; i < elements.length; i++)
            {

                if (!elements[i].classList.contains("obelezen"))
                {

                    lista.push(elements[i].getElementsByTagName("img")[0].src);
                    del.push(elements[i].getElementsByTagName("img")[0].alt);
                   // alert(elements[i].getElementsByTagName("img")[0].src)


                }


            }



        }
          //brisanje linkova u slucaju back-a!!!!!!

          document.getElementById("ContentPlaceHolder5_TextBox3").addEventListener("input", function () {

            //document.getElementById("TextBox4").value = "";

            var vrednost = document.getElementById("ContentPlaceHolder5_TextBox3").value;

            document.getElementById("ContentPlaceHolder5_TextBox4").value = Math.round(vrednost / 0.73549875);

        })


            document.getElementById("ContentPlaceHolder5_TextBox4").addEventListener("input", function () {

            //document.getElementById("TextBox4").value = "";

            var vrednost = document.getElementById("ContentPlaceHolder5_TextBox4").value;

            document.getElementById("ContentPlaceHolder5_TextBox3").value = Math.round(vrednost * 0.73549875);

        })


        
        var marka = false;
        var model = false;
        var oznaka = false;
        var godiste = false;
        var karoserija = false;
        var gorivo = false;
        var kubikaza = false;
        var snaga = false;
        var kilometraza = false;
        var pogon = false;
        var menjac = false;
        var brojVrata = false;
        var stranaVolana = false;
        var boja = false;
        var porekloVozila = false;
        var registrovan = false;
        var klima = false;
        var lokacija = false;
        var zamena = false;


        document.getElementById("ContentPlaceHolder5_TextBox1").addEventListener("blur", function () {

            var x = this.value;
            var regexp = /^19\d\d$/;
            var regexp1 = /^20\d\d$/;

            var godina = new Date().getFullYear();
            

            if (regexp.test(x) || regexp1.test(x) && x <= godina) {

                 this.style.backgroundColor = "white";
               // alert("polje dobro uneseno!!!");
                godiste = true;


            }

            else
            {
                this.style.backgroundColor = "red";
              //  alert("polje pogresno uneseno!!!")

            }



        })


         $(document).ready(function () {


             //var pmarka = document.getElementById("ContentPlaceHolder5_DropDownList1").value;
             //var pmodel = document.getElementById("ContentPlaceHolder5_DropDownList2").value;
             //var poznaka = document.getElementById("ContentPlaceHolder5_TextBox7").value;
             //var pgodiste = document.getElementById("ContentPlaceHolder5_TextBox1").value;
             //var pkaroserija = document.getElementById("ContentPlaceHolder5_DropDownList3").value;
             //var pgorivo = document.getElementById("ContentPlaceHolder5_DropDownList4").value;
             //var pkubikaza = document.getElementById("ContentPlaceHolder5_TextBox2").value;
             //var psnaga = document.getElementById("ContentPlaceHolder5_TextBox3").value;
             //var pkilometraza = document.getElementById("ContentPlaceHolder5_TextBox5").value;
             //var ppogon = document.getElementById("ContentPlaceHolder5_DropDownList5").value;
             //var pmenjac = document.getElementById("ContentPlaceHolder5_DropDownList6").value;
             //var pbrojVrata = document.getElementById("ContentPlaceHolder5_DropDownList7").value;
             //var pstranaVolana = document.getElementById("ContentPlaceHolder5_DropDownList8").value;
             //var pboja = document.getElementById("ContentPlaceHolder5_DropDownList9").value;
             //var pporekloVozila = document.getElementById("ContentPlaceHolder5_DropDownList10").value;
             //var pregistrovanDo = document.getElementById("ContentPlaceHolder5_DropDownList11").value;
             //var pklima = document.getElementById("ContentPlaceHolder5_DropDownList12").value;
             //var pcena = document.getElementById("ContentPlaceHolder5_TextBox6").value;
             //var plokacija = document.getElementById("ContentPlaceHolder5_DropDownList13").value;
             //var pzamena = document.getElementById("ContentPlaceHolder5_DropDownList14").value;
             //var ptext = document.getElementsByTagName("textarea")[0].value;
             //var pcena_status;

             //if (document.getElementById("ContentPlaceHolder5_CheckBox1").checked == true) {

             //    pcena_status = 2;

             //}

             //else {
             //    pcena_status = 1;

             //}



             //var poprema = [];


             //$("#oprema").find("input").each(function () {

             //    if ($(this).prop("checked")) {
             //        oprema.push($(this).val())

             //    }

             //})



             $("#dugme1").on("click", function () {

                 $("body").css("cursor", "progress");

                 var test = true;

                 var elements = document.getElementsByClassName("obavezan");

                 for (i = 0; i < elements.length; i++) {

                     if (elements[i].value == "") {

                         elements[i].style.backgroundColor = "red";
                         test = false;
                         break;

                     }

                     else {
                         elements[i].style.backgroundColor = "white";

                     }



                 }
                 if (test) {

                     //alert(window.location.href);
                     var idVozila = window.location.href;
                     var location = idVozila.lastIndexOf("=") + 1;
                     var ID = idVozila.substr(location);

                     formData.append("idVozila", ID); 
                     
                     var marka = document.getElementById("ContentPlaceHolder5_DropDownList1").value;
                     var model = document.getElementById("ContentPlaceHolder5_DropDownList2").value;
                     var oznaka = document.getElementById("ContentPlaceHolder5_TextBox7").value;
                     var godiste = document.getElementById("ContentPlaceHolder5_TextBox1").value;
                     var karoserija = document.getElementById("ContentPlaceHolder5_DropDownList3").value;
                     var gorivo = document.getElementById("ContentPlaceHolder5_DropDownList4").value;
                     var kubikaza = document.getElementById("ContentPlaceHolder5_TextBox2").value;
                     var snaga = document.getElementById("ContentPlaceHolder5_TextBox3").value;
                     var kilometraza = document.getElementById("ContentPlaceHolder5_TextBox5").value;
                     var pogon = document.getElementById("ContentPlaceHolder5_DropDownList5").value;
                     var menjac = document.getElementById("ContentPlaceHolder5_DropDownList6").value;
                     var vrata = document.getElementById("ContentPlaceHolder5_DropDownList7").value;
                     var volan = document.getElementById("ContentPlaceHolder5_DropDownList8").value;
                     var boja = document.getElementById("ContentPlaceHolder5_DropDownList9").value;
                     var poreklo = document.getElementById("ContentPlaceHolder5_DropDownList10").value;
                     var Registrovan_Do = document.getElementById("ContentPlaceHolder5_DropDownList11").value;
                     var klima = document.getElementById("ContentPlaceHolder5_DropDownList12").value;
                     var cena = document.getElementById("ContentPlaceHolder5_TextBox6").value;
                     var lokacija = document.getElementById("ContentPlaceHolder5_DropDownList13").value;
                     var zamena = document.getElementById("ContentPlaceHolder5_DropDownList14").value;
                     var opis = document.getElementsByTagName("textarea")[0].value;
                     var cena_status;

                     if (document.getElementById("ContentPlaceHolder5_CheckBox1").checked == true) {

                         cena_status = 2;

                     }

                     else {
                         cena_status = 1;

                     }



                     var oprema = [];


                     $("#ContentPlaceHolder5_oprema").find("input").each(function () {

                         if ($(this).prop("checked")) {
                             oprema.push($(this).val())

                         }

                     })


                     var oprema = JSON.stringify(oprema);
                     formData.append("oprema", oprema);
                     var linkovizaBrisanje = JSON.stringify(linkoviBrisanje);
                     formData.append("linkovizaBrisanje", linkovizaBrisanje);

                     formData.append("marka", marka);
                     formData.append("model", model);
                     formData.append("oznaka", oznaka);
                     formData.append("godiste", godiste);
                     formData.append("karoserija", karoserija);
                     formData.append("gorivo", gorivo);
                     formData.append("kubikaza", kubikaza);
                     formData.append("snaga", snaga);
                     formData.append("kilometraza", kilometraza);
                     formData.append("pogon", pogon);
                     formData.append("menjac", menjac);
                     formData.append("vrata", vrata);
                     formData.append("volan", volan);
                     formData.append("boja", boja);
                     formData.append("poreklo", poreklo);
                     formData.append("registrovan_do", Registrovan_Do);
                     formData.append("klima", klima);
                     formData.append("cena", cena);
                     formData.append("lokacija", lokacija);
                     formData.append("zamena", zamena);
                     formData.append("opis", opis);  
                     formData.append("cena_status", cena_status);



                    $.ajax
                         ({
                             url: "Handler2.ashx",
                             method: "POST",
                             contentType: false,
                             processData: false,
                             data: formData,
                             dataType: "json",
                             success: function (response) {
                                 //var obk = JSON.parse(response);

                                 //alert(obk.name);
                                 //alert(obk.status);

                                 //var nesto = JSON.stringify(response);
                                 //alert(nesto);

                                 formData = new FormData();
                                 //alert(response.rezultat);
                                // alert(response.status);
                                 //  alert('succes!! ' + response);
                                 window.location.href = "rezultat_postavljanja_oglasa.html?poreklo=izmena"
                                      


                             },
                             error: function () {
                                 alert("errror");
                                 //alert(response);

                             }

                         })


                     //if (pmarka != marka) {

                     //    formPodaci.append("marka", marka);
                     //   // alert(marka);

                     //}

                     //if (pmodel != model) {

                     //    formPodaci.append("marka", model);
                     //   // alert(marka);

                     //}

                     //if (poznaka != oznaka) {

                     //    formPodaci.append("marka", oznaka);
                     //   // alert(marka);

                     //}

                     // if (pgodiste != godiste) {

                     //    formPodaci.append("marka", godiste);
                     //   // alert(marka);

                     // }

                     // if (pkaroserija != karoserija) {

                     //    formPodaci.append("marka", karoserija);
                     //   // alert(marka);

                     //}

                     // if (pgorivo != gorivo) {

                     //    formPodaci.append("marka", gorivo);
                     //   // alert(marka);

                     // }

                     // if (pkubikaza != kubikaza) {

                     //    formPodaci.append("marka", kubikaza);
                     //   // alert(marka);

                     //}

                     //    if (psnaga != snaga) {

                     //    formPodaci.append("marka", snaga);
                     //   // alert(marka);

                     //}

                     //    if (pkilometraza != kilometraza) {

                     //    formPodaci.append("marka", kilometraza);
                     //   // alert(marka);

                     // }


                     //    if (ppogon != pogon) {

                     //    formPodaci.append("marka", pogon);
                     //   // alert(marka);

                     //}

                     //    if (pmenjac != menjac) {

                     //    formPodaci.append("marka", menjac);
                     //   // alert(marka);

                     //}


                     //if (pbrojVrata != brojVrata) {

                     //    formPodaci.append("marka", brojVrata);
                     //   // alert(marka);

                     //}


                     //if (pstranaVolana != stranaVolana) {

                     //    formPodaci.append("marka", stranaVolana);
                     //   // alert(marka);

                     // }

                     //    if (pboja != boja) {

                     //    formPodaci.append("marka", boja);
                     //   // alert(marka);

                     //}

                     //if (pporekloVozila != porekloVozila) {

                     //    formPodaci.append("marka", porekloVozila);
                     //   // alert(marka);

                     //}

                     //if (pregistrovanDo != registrovanDo) {

                     //    formPodaci.append("marka", registrovanDo);
                     //   // alert(marka);

                     //}

                     //    if (pklima != klima) {

                     //    formPodaci.append("marka", klima);
                     //   // alert(marka);

                     //}

                     //    if (pcena != cena) {

                     //    formPodaci.append("marka", cena);
                     //   // alert(marka);

                     //}

                     //    if (plokacija != lokacija) {

                     //        formPodaci.append("marka", lokacija);
                     //   // alert(marka);

                     //}

                     //if (pzamena != zamena) {

                     //    formPodaci.append("marka", zamena);
                     //   // alert(marka);

                     //}

                     //    if (ptext != text) {

                     //    formPodaci.append("marka", text);
                     //   // alert(marka);

                     //}


                     //if (pcena_status != cena_status) {

                     //    formPodaci.append("marka", cena_status);
                     //   // alert(marka);

                     // }

                     //    if (ppogon != pogon) {

                     //    formPodaci.append("marka", pogon);
                     //   // alert(marka);

                     //}






                 }

             })



         })


        function bojaPromena(element) {
            
            element.style.backgroundColor = "white";

         //   alert(element.value);

        }

        document.getElementById("upload").addEventListener("click", function()
        {

             document.getElementById("moj").click()

         })

         function obrisiSliku(name)
         {


                     $.ajax({
                url: "WebForm7.aspx/ObrisiSliku",
                method: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ id: name }),
                success: function (result)
                {

                    //alert("radi");

                },
                error: function ()
                {

                    alert("ne radi");


                }

            })


         }

    

    </script>

</asp:Content>



   





