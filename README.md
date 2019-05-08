**AUTO OGLASI PROJEKAT**

Auto oglasi je web aplikacija koja služi za oglašavanje polovnih vozila i
pretraživanje postojećih oglasa koji se nalaze na sajtu.

Aplikacija sadrži

1.Stranicu za pretraživanje oglasa (dostupna svim korisnicima)

2.Details stranicu (dostupna svim korisnicima)

3.Korisničku stranicu (dostupna samo registrovanim korisnicima)

4.Admin stranicu (dostupna samo adminu)

5.Stranice za postavljanje i editovanje već unetih oglasa (dostupne samo
registrovanim korisnicima)

5.Stranicu za logovanje

6.Stranicu za registraciju

Na stranici za pretrživanje oglasa korisnici pomoću različitih dostupnih filtera
mogu vršiti pretragu oglasa prema odabranim kriterijumima.Rezulati se mogu nakon
izvršene pretrage sortirati prema različitim kriterijumima.Pretraga je dostupna
i korisnicima koji nisu registrovani.

Details stranica sadrži kompletne informacije i galeriju slika za odabrano
vozilo.Dostupna je i korisnicima koji nisu registrovani.

Korisnička stranica se sastoji iz dva segmenta, Oglasi i Poruke.Oglasi sadrže
listu svih oglasa koje je ulogovani korisnik uneo na sajt.Za svaki uneti oglas
postoje opcije Izmena i Obrisi, koje omogućavaju korisniku da svoj oglas promeni
ili obrise sa sajta.Segment poruke omogućava slanje privatnih poruka i
komunikaciju izmedju registrovanih korisnika.

Admin stranica poseduje mogućnost da oglase starije od 30 dana ukloni sa sajta.

Stranica za logovanje korisnika koji su se vec registrovali na sajtu, mogućnost
logovanja uz pomoć korisničkog imena ili email adrese uz proveru lozinke vezane
za korisnikov nalog.Nakon logovanja korisnik dobija pristup svojom korisničkoj
stranici kao i stranici za postavljanje noovih oglasa.

Registracija omogućava korisniku da postavi svoje oglase na sajt.Prilikom
registracije neophodno je da korisnik unese korisničko ime i email adresu koji
nisu već registravani na sajtu.Neophodno je unesti i ime, prezime i broj
telefona kako bi registracija bila uspešna.

TEHNIČKE INFORMACIJE

**BAZA**

1.Baza se sastoji iz 22 tabele.Glava tabela Auti poseduje sve informacije koje
ce posedovati jedan oglas bez obzira o kom autu je reč.Dodatna oprema automobila
je smeštena u posebnu tabelu Dodatna koja je preko foreign key-a povezana sa
glavnom tabelom Auti.

Tabela Korisnici sadrži informacije vezane za registrovane korisnike, gde su
brojevi telefona i nivo pristupa izdvojeni u tabele Telefoni i Ovlašćenja koje
su preko foreign key-ova povezane sa tabelom Korisnici.

Tabela Chat sadrži svaki chat(konverzaciju), table Chatovi sadrži poruke koje se
odnose na svaku konverzaciju u Chat tabeli.Chatovi tabela je povezana putem
foreign key-a sa tabelom Chat, kao i sa tabelom Korisnici.

Ostale tabele su rečnici koji dešifruju karakteristike vozila i te tabele su
preko foreign key-a povezane sa tabelom Auti.

**APLIKACIJA**

Stranica za pretragu je klijentska stranica koja preko ajax poziva dobije
rezultate iz odgovarajuće web methode i dobijeni rezultat konvertuje u
javascript objekat i potom izlistava sadržaj na stranici.

Details stranica je serverska stranica koje preko query stringa i id automobila
u bazi islistava sve informacije i slike dostupne za dati automobil.

Korisnička strana je klijentska straca koja preko ajax poziva izlistava sve
oglase koje je korisnik uneo na sajti kao i sve poruke koje je primio/poslao.

Stranice za unos i izmenu oglasa su kombinacija serveskog i klijentskog nacina
rada, sastoje se iz asp kontrola koje se pune iz baze sa vrednostima koje su
dostupne.Izabrane vrednosti se posle putem ajax poziva salju odabranoj web
metodi koja će vršiti unos ili izmenu u bazi.

Slike za svaki auto se nalaze u direktorijumu cije je ime ID automobile iz
tabele AUTI.Svi direktorijumi sa slikama se nalaze u direktorijumu Slike u
okviru projekta.

Aplikacija ima responsive dizajn koji je postignut uz pomoć FLEX-a i css media
kverija.
