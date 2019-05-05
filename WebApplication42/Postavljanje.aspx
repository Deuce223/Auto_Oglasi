<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Postavljanje.aspx.cs" Inherits="WebApplication42.WebForm3" %>



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


            /*@media only screen and (max-width:1600px){


                .container{

                    width:55%;

                }


            }*/

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

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

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
    <div id="oprema">
        

        <div class="tru">
        <div class="stakva_opreme"><label><input id="htmlmoj" type="checkbox" value="Elektricni podizaci" />Elektricni podizaci</label></div>
        <div class="stakva_opreme"><label><input type="checkbox" value="Servo" />Servo</label></div>
         <div class="stakva_opreme"><label><input type="checkbox" value="Elektricni retrovizori" />Elektricni retrovizori</label></div>
         <div class="stakva_opreme">   <label><input type="checkbox" value="Putni racunar" />Putni racunar</label></div>
        </div>
     

   <div class="tru">
        <div class="stakva_opreme"><label><input type="checkbox" value="Centralna brava" />Centralna brava</label></div>
         <div class="stakva_opreme"><label><input type="checkbox" value="Daljinsko zakljucavanje" />Daljinsko zakljucavanje</label></div>
         <div class="stakva_opreme"><label><input type="checkbox" value="Metalik boja" />Metalik boja</label></div>
         <div class="stakva_opreme"><label><input type="checkbox" value="Tonirana stakla" />Tonirana stakla</label></div>
             </div>     
      
         </div>

<%--    <button id="dugmence" onclick="pokupi()">obrisi</button>--%>

     
          <h3>Slike</h3>
    <div id="glavni">
        <div class="row">
        <div class="slika"><div id="i1" class="slikica obelezen"><img src="hatchback-512.png" /><div id="1" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i2" class="slikica obelezen"><img src="hatchback-512.png" /><div id="2" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i3"class="slikica obelezen"><img src="hatchback-512.png" /><div id="3" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i4" class="slikica obelezen"><img src="hatchback-512.png" /><div id="4" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i5" class="slikica obelezen"><img src="hatchback-512.png" /><div id="5" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
            </div>
        <div class="row">
        <div class="slika"><div id="i6" class="slikica obelezen"><img src="hatchback-512.png" /><div id="6" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i7" class="slikica obelezen"><img src="hatchback-512.png" /><div id="7" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i8" class="slikica obelezen"><img src="hatchback-512.png" /><div id="8" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i9" class="slikica obelezen"><img src="hatchback-512.png" /><div id="9" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
        <div class="slika"><div id="i10" class="slikica obelezen"><img src="hatchback-512.png" /><div id="10" class="nevidljiv" onclick="obrisi(this)">X</div></div></div>
            </div>
    </div>

   <input type="file" id="moj" onchange="slanje()" class="nevidljiv_upload"/>
  <div class="row"><input type="button" id="upload" value="Dodaj sliku" /></div>

    <div id="obavestenje"></div>
    <div style="clear:both">
     
            <h3>Opis vozila</h3>
        <div class="row"><textarea maxlength="2000" class="area"></textarea></div>  
    </div>
 


  <div class="row"><button id="dugme1" onclick="return false" >klikni!!!</button></div>

        </div>

   <%--  <div id="niz" onclick="izlistaj()">klikni</div>--%>


     <script>

        //var del;

        //var photo;

        // var formPodaci = [];

        //var linkovi = [];
        // var brisanjeLinkovi = [];



         var formData = new FormData();

        function slanje() {

            var elementi = document.getElementsByClassName("obelezen");

            if (elementi.length != 0)
            {

               
                var fajl = document.getElementById("moj").files[0];


                if (fajl.type == "image/png" || fajl.type == "image/jpeg") {


                    var identifikacija = parseInt(elementi[0].getAttribute("id").substr(1)) - 1;
                   
                    formData.append("image" + identifikacija, fajl);

                    //alert(identifikacija);

                    var reader = new FileReader();
                    reader.readAsDataURL(fajl);
                    reader.addEventListener("load", function () {

                        //alert("ovde radi 1");
                        //alert(this.result);
                     //   moja1(this.result);
                        //document.getElementsByTagName("img")[0].src = this.result;
                        if (elementi.length != 0)
                        {

                            elementi[0].firstChild.setAttribute("src", this.result);
                            elementi[0].getElementsByClassName("nevidljiv")[0].style.visibility = "visible";
                            elementi[0].classList.remove("obelezen");

                          
                            

                            //if (formPodaci.length == 0) {
                            //    formPodaci.push(formData);

                            //}

                            //else
                            //{

                            //    formPodaci[identifikacija] = formData;

                            //}
                            //alert(formPodaci.length);
                            
                

                       // x.getElementsByClassName("nevidljiv")[0].style.visibility = "visible";
                       // x.firstChild.setAttribute("src", photo);
                    //    x.firstChild.setAttribute("alt", del);

                    //    x.classList.remove("obelezen");

                        }


                    })



                    //$.ajax({
                    //    url: "https://api.imgur.com/3/image",
                    //    type: "POST",
                    //    // datatype: "json",
                    //    headers: {
                    //        "Authorization": "Client-ID b8c86878f52d4b5"
                    //    },
                    //    data: formData,
                    //    success: function (response) {
                    //        //console.log(response);
                    //        alert(response);
                    //        alert(response.data.link);
                    //        alert(response.data);
                    //        $("#ddd").text(response.data.link);
                    //        photo = response.data.link;
                    //        var photo_hash = response.data.deletehash;
                    //        del = response.data.deletehash

                    //        //linkovi.push(response.data.link);
                    //        //brisanjeLinkovi.push(response.data.deletehash);

                    //    //    document.getElementById("ddd1").innerHTML = del;
                    //        //$("#prvi").prop("src", photo);
                    //        moja();



                    //    },
                    //    cache: false,
                    //    contentType: false,
                    //    processData: false
                    //});

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
        //    //  $(".slikica").each(function ()
        //    //{
        //    //    if ($(this).hasClass("obelezen"))

        //    //    {
        //    //        var x = $(this).next();
        //    //        x.addClass("obelezen");
        //    //        $(this).find("img").attr("src", photo);                   
        //    //        $(this).removeClass("obelezen");
                    

        //    //        return false;

        //    //    }

        //    //    return false;


        //    // })

        //    var broj = document.getElementsByClassName("obelezen").length
        //    if (broj != 0)
        //    {
        //        for (i = 0; i < broj; i++) {
        //            //if (i != 0)
        //            //{

        //            //    x.document.getElementsByClassName("nevidljiv")[i - 1].style.visibility = "hidden";


        //            //}

        //            var x = document.getElementsByClassName("obelezen")[i];

        //                x.getElementsByClassName("nevidljiv")[0].style.visibility = "visible";
        //                x.firstChild.setAttribute("src", photo);
        //                x.firstChild.setAttribute("alt", del);

        //                x.classList.remove("obelezen");

        //                //if (i < broj - 1) {

        //                //    document.getElementsByClassName("slikica")[i + 1].classList.add("obelezen");

        //                //}

        //                break;

        //        }

        //    }

        // }
        //    function moja1(dataLink)

        //{
          
        //        var broj = document.getElementsByClassName("obelezen").length  
        //    if (broj != 0)
        //    {
        //        for (i = 0; i < broj; i++) {
        //            //if (i != 0)
        //            //{

        //            //    x.document.getElementsByClassName("nevidljiv")[i - 1].style.visibility = "hidden";


        //            //}

        //            var x = document.getElementsByClassName("obelezen")[i];
        //            alert(dataLink);
        //            x.getElementsByClassName("nevidljiv")[0].style.visibility = "visible";
        //            x.firstChild.setAttribute("src", dataLink);
        //              //  x.firstChild.setAttribute("alt", del);

        //                x.classList.remove("obelezen");

        //                //if (i < broj - 1) {

        //                //    document.getElementsByClassName("slikica")[i + 1].classList.add("obelezen");

        //                //}

        //                break;

        //        }

        //    }

        //}


        //function brisanje() {

        //  //  var heder = "Authorization: Bearer {{3f8e3e0c54987e0e35277c5b41cbd1c4318f5ce7}}"

        //    $.ajax({
        //      //  url: "https://api.imgur.com/3/image/{" + del + "}",
        //        url: "https://api.imgur.com/3/account/Deuce223/image/" + del,
        //        type:"DELETE",
        //        headers: {"Authorization": "Bearer 033857ddf04aa989119e70c915f1056cb710acab"},   
        //        success: function (response) {
        //            //console.log(response);
        //            alert("sve u redu hehe!")
        //            alert(response);
        //        },
        //        error: function (response) {

        //            alert("poziv neuspesan");
        //            alert(response);

        //        }
        //    });
        //}

     
        
        function obrisi(element)
        {
            var id = parseInt(element.getAttribute("id")) - 1;

            var del = document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].alt;
            document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].alt = "";

            document.getElementsByClassName("slikica")[id].getElementsByTagName("img")[0].src = "hatchback-512.png";
            
            element.style.visibility = "hidden";
            document.getElementsByClassName("slikica")[id].classList.add("obelezen");

            //alert(id);
            formData.delete("image" + id);

            //formPodaci[id] = "prazan";


            //$.ajax({
            //    //  url: "https://api.imgur.com/3/image/{" + del + "}",
            //    url: "https://api.imgur.com/3/account/Deuce223/image/" + del,
            //    type: "DELETE",
            //    headers: { "Authorization": "Bearer 033857ddf04aa989119e70c915f1056cb710acab" },  3981df45478ba40053645edaba3b7db5b712e3ab
            //    success: function (response) {
            //        //console.log(response);
            //        alert("sve u redu hehe!")
            //        alert(response);
            //        alert(response.data);
            //    },
            //    error: function (response) {

            //        alert("poziv neuspesan");
            //        alert(response);

            //    }
            //});

            

            //$.ajax({
            //    //  url: "https://api.imgur.com/3/image/{" + del + "}",
            //    url: "https://api.imgur.com/3/account/Deuce223/image/" + del,
            //    type: "DELETE",
            //    headers: { "Authorization": "Bearer 3981df45478ba40053645edaba3b7db5b712e3ab" }, 
            //    success: function (response) {
            //        //console.log(response);
            //        alert("sve u redu hehe!")
            //        alert(response);
            //        alert(response.data);
            //    },
            //    error: function (response) {

            //        alert("poziv neuspesan");
            //        alert(response);

            //    }
            //});

            //ovde izbaciti iz niza taj formdata!




        }

        //var listaLinkova = [];

        //function pokupi(lista, del)
        //{
        //    var duzina = document.getElementsByClassName("slikica");
        //    var elements = document.getElementsByClassName("slikica");

        //    for (i = 0; i < elements.length; i++)
        //    {

        //        if (!elements[i].classList.contains("obelezen"))
        //        {

        //            lista.push(elements[i].getElementsByTagName("img")[0].src);
        //            del.push(elements[i].getElementsByTagName("img")[0].alt);
        //           // alert(elements[i].getElementsByTagName("img")[0].src)


        //        }


        //    }



        //}
          //brisanje linkova u slucaju back-a!!!!!!

          document.getElementById("ContentPlaceHolder3_TextBox3").addEventListener("input", function () {

            //document.getElementById("TextBox4").value = "";

            var vrednost = document.getElementById("ContentPlaceHolder3_TextBox3").value;

            document.getElementById("ContentPlaceHolder3_TextBox4").value = Math.round(vrednost / 0.73549875);

        })


            document.getElementById("ContentPlaceHolder3_TextBox4").addEventListener("input", function () {

            //document.getElementById("TextBox4").value = "";

            var vrednost = document.getElementById("ContentPlaceHolder3_TextBox4").value;

            document.getElementById("ContentPlaceHolder3_TextBox3").value = Math.round(vrednost * 0.73549875);

        })

        //ovde oraditi button click
        //uneti jquery!!

        
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


        document.getElementById("ContentPlaceHolder3_TextBox1").addEventListener("blur", function () {

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

        //function godiste(element) {

        //    var x = element.value;
        //    var regexp = /^19\d\d$/;
        //    var regexp1 = /^20\d\d$/;

        //    if (regexp.test(x) || regexp1.test(x)) {

        //        alert("polje dobro uneseno!!!");
        //        godiste = true;


        //    }

        //    else
        //    {
        //        alert("polje lose uneseno")

        //    }


        //}

        //document.getElementById("DropDownList1").addEventListener("change", function () {

        //    if (this.value != "") {

        //        marka = true;


        //    }

        //    else
        //    {

        //        marka = false;
        //    }



        //})

         $(document).ready(function () {

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




                     var marka = document.getElementById("ContentPlaceHolder3_DropDownList1").value;
                     var model = document.getElementById("ContentPlaceHolder3_DropDownList2").value;
                     var oznaka = document.getElementById("ContentPlaceHolder3_TextBox7").value;
                     var godiste = document.getElementById("ContentPlaceHolder3_TextBox1").value;
                     var karoserija = document.getElementById("ContentPlaceHolder3_DropDownList3").value;
                     var gorivo = document.getElementById("ContentPlaceHolder3_DropDownList4").value;
                     var kubikaza = document.getElementById("ContentPlaceHolder3_TextBox2").value;
                     var snaga = document.getElementById("ContentPlaceHolder3_TextBox3").value;
                     var kilometraza = document.getElementById("ContentPlaceHolder3_TextBox5").value;
                     var pogon = document.getElementById("ContentPlaceHolder3_DropDownList5").value;
                     var menjac = document.getElementById("ContentPlaceHolder3_DropDownList6").value;
                     var brojVrata = document.getElementById("ContentPlaceHolder3_DropDownList7").value;
                     var stranaVolana = document.getElementById("ContentPlaceHolder3_DropDownList8").value;
                     var boja = document.getElementById("ContentPlaceHolder3_DropDownList9").value;
                     var porekloVozila = document.getElementById("ContentPlaceHolder3_DropDownList10").value;
                     var registrovanDo = document.getElementById("ContentPlaceHolder3_DropDownList11").value;
                     var klima = document.getElementById("ContentPlaceHolder3_DropDownList12").value;
                     var cena = document.getElementById("ContentPlaceHolder3_TextBox6").value;
                     var lokacija = document.getElementById("ContentPlaceHolder3_DropDownList13").value;
                     var zamena = document.getElementById("ContentPlaceHolder3_DropDownList14").value;
                     var text = document.getElementsByTagName("textarea")[0].value;
                     var cena_status;


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
                     formData.append("brojVrata", brojVrata);
                     formData.append("stranaVolana", stranaVolana);
                     formData.append("boja", boja);
                     formData.append("porekloVozila", porekloVozila);
                     formData.append("registrovanDo", registrovanDo);
                     formData.append("klima", klima);
                     formData.append("cena", cena);
                     formData.append("lokacija", lokacija);
                     formData.append("zamena", zamena);
                     formData.append("text", text);
                     


                     if (document.getElementById("ContentPlaceHolder3_CheckBox1").checked == true) {

                         cena_status = 2;

                     }

                     else {
                         cena_status = 1;

                     }

                     formData.append("cena_status", cena_status);

                     var oprema = [];


                     $("#oprema").find("input").each(function () {

                         if ($(this).prop("checked")) {
                             oprema.push($(this).val())

                         }

                     })

                     var niz_json = JSON.stringify(oprema);

                     formData.append("oprema", niz_json);

                     //   var objekat = { marka: marka, model: model, oznaka: oznaka, godiste: godiste, karoserija: karoserija, gorivo: gorivo, kubikaza: kubikaza, snaga: snaga, kilometraza: kilometraza, pogon: pogon, menjac: menjac, brojVrata: brojVrata, stranaVolana: stranaVolana, boja: boja, porekloVozila: porekloVozila, registrovanDo: registrovanDo, klima: klima, cena: cena, slike: listaLinkova, brisanje: listaBrisanje, lokacija: lokacija, zamena: zamena, cena_status: cena_status, oprema: oprema, text: text }


                     //var objekatDzejson = JSON.stringify(objekat);
                     //var dzejson = { podaci: objekatDzejson };


                     $.ajax
                         ({
                             url: "Handler1.ashx",
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
                                 //alert(response.name);
                                 //alert(response.status);
                                 //  alert('succes!! ' + response);
                                 window.location.href = "rezultat_postavljanja_oglasa.html?poreklo=postavljanje";



                             },
                             error: function () {
                                 alert("errror");
                                 //alert(response);

                             }

                         })


                 }

             })

         })

                            //linkovi.push(response.data.link);
                            //brisanjeLinkovi.push(response.data.deletehash);

                        //    document.getElementById("ddd1").innerHTML = del;
                            //$("#prvi").prop("src", photo);
                         //   moja();



        //function provera(element)
        //{
        //    if (this.value != "")
        //    {
        //        element.style.backgroundColor = "white";

        //        if (element.getAttribute("ID") == "DropDownList1")
        //        {

        //               marka = true;

        //        }

        //        else if (element.getAttribute("ID") == "DropDownList2")
        //        {

        //               model = true;

        //        }

        //        else if (element.getAttribute("ID") == "DropDownList3")
        //        {

        //               karoserija = true;

        //        }

        //        else if (element.getAttribute("ID") == "DropDownList4")
        //        {

        //              gorivo = true;

        //        }


        //        else if (element.getAttribute("ID") == "DropDownList5")
        //        {

        //              pogon = true;

        //        }

                
        //        else if (element.getAttribute("ID") == "DropDownList6")
        //        {

        //              menjac = true;

        //        }

        //        else if (element.getAttribute("ID") == "DropDownList7")
        //        {

        //              brojVrata = true;

        //        }
                
        //        else if (element.getAttribute("ID") == "DropDownList8")
        //        {

        //              stranaVolana = true;

        //        }

                   
        //        else if (element.getAttribute("ID") == "DropDownList9")
        //        {

        //              boja = true;

        //        }

        //          else if (element.getAttribute("ID") == "DropDownList10")
        //        {

        //              porekloVozila = true;

        //        }

        //           else if (element.getAttribute("ID") == "DropDownList11")
        //        {

        //              registrovan = true;

        //        }

        //             else if (element.getAttribute("ID") == "DropDownList12")
        //        {

        //            klima = true;

        //        }

        //            else if (element.getAttribute("ID") == "DropDownList13")
        //        {

        //            lokacija = true;

        //        }


        //            else if (element.getAttribute("ID") == "DropDownList14")
        //        {

        //            zamena = true;

        //        }

        //          else if (element.getAttribute("ID") == "TextBox7")
        //        {

        //            oznaka = true;

        //        }

        //          else if (element.getAttribute("ID") == "TextBox1")
        //        {

        //            godiste = true;

        //        }

        //             else if (element.getAttribute("ID") == "TextBox2")
        //        {

        //            kubikaza = true;

        //        }

        //              else if (element.getAttribute("ID") == "TextBox3")
        //        {

        //            snaga = true;

        //        }

        //                else if (element.getAttribute("ID") == "TextBox5")
        //        {

        //            kilometraza = true;

        //        }

        //                  else if (element.getAttribute("ID") == "TextBox5")
        //        {

        //            cena = true;

        //        }
        //    }

            
        //    else
        //    {
        //        element.style.backgroundColor = "red";
        //         marka = false;

        //    }

        //}

        //document.getElementById("dugme1").addEventListener("click", function () {

        //      //funkcija koja proverava sve bool varijable

          


        //})

         function nizSlika(niz,niz1, formpodaci)
         {
             for (i = 0; i < formpodaci.length; i++)
             {
                    $.ajax({
                        url: "https://api.imgur.com/3/image",
                        type: "POST",
                        // datatype: "json",
                        headers: {
                            "Authorization": "Client-ID b8c86878f52d4b5"
                        },
                        async: false,
                        data: formpodaci[i],
                        success: function (response) {
                            //console.log(response);
                          //  alert(response);
                          //  alert(response.data.link);
                          //  alert(response.data);
                          //  $("#ddd").text(response.data.link);
                            photo = response.data.link;
                         //   alert(photo);
                            niz.push(photo);

                            
                          //  var photo_hash = response.data.deletehash;
                            del = response.data.deletehash
                         //   alert(del);
                            niz1.push(del);
                            
                            if (i = formpodaci.length - 1)
                            {




                            }

                            //linkovi.push(response.data.link);
                            //brisanjeLinkovi.push(response.data.deletehash);

                        //    document.getElementById("ddd1").innerHTML = del;
                            //$("#prvi").prop("src", photo);
                         //   moja();



                        },
                        cache: false,
                        contentType: false,
                        processData: false
                    });



             }

         }


        function bojaPromena(element) {
            
         element.style.backgroundColor = "white";

        }

        document.getElementById("upload").addEventListener("click", function()
        {

             document.getElementById("moj").click()

        })

        //$(document).ready(function () {

        //    $("#DropDownList1").




        //})

          //   function izlistaj()
          //{

          //    for (i = 0; i < formPodaci; i++)
          //    {

          //        alert(formPodaci[i]);


          //    }



          //}

    </script>


</asp:Content>


   

