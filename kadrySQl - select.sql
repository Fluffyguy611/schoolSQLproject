-- sprawdz specjalnosci pracownikow
select imie, nazwisko, predyspozycje.specjalnosc_id as id_specjalnosci
	from pracownik, predyspozycje
    where pracownik.pracownik_id = predyspozycje.pracownik_id
    order by id_specjalnosci;
    
-- to samo zapytanie uzywajac INNER JOIN
select imie, nazwisko, predyspozycje.specjalnosc_id as id_specjalnosci
	from pracownik
    	inner join predyspozycje
        on predyspozycje.pracownik_id = pracownik.pracownik_id
    order by id_specjalnosci;

-- grupowanie, sprawdzanie czy nazwiska pracownikow sie powtarzaja
select nazwisko from pracownik GROUP by nazwisko having count (nazwisko) >1;

select imie, nazwisko, miasto from pracownik
	where nazwisko in(
      select nazwisko from pracownik
      GROUP by nazwisko having count (nazwisko) >1);

-- sprawdzanie ile dni pracownicy pracuja w firmie
select imie, nazwisko, pracownik.pracownik_id, (now() - data_od) as dni_przepracowane
	from pracownik
    inner join wspolpraca
    on pracownik.umowa_nr = wspolpraca.umowa_nr;

-- pracownicy ktory rozpoczeli dni wolne w marcu 2022
select imie, nazwisko, pracownik_id
	from pracownik
    inner join dni_wolne
    on dni_wolne.wolne_id = pracownik.pracownik_id
    and dni_wolne.data_od BETWEEN '2022/03/01' and '2022/03/31';

-- pracownicy mieszkajacy w Gdańsku
select * from pracownik where miasto like 'Gdańsk';

-- pracownicy bez zadnych specjalnosci (zagnieżdżenie skorelowane)
select imie, nazwisko from pracownik p
	where not EXISTS(
      select * from predyspozycje N inner join specjalnosc S
      on p.pracownik_id=N.pracownik_id
      and N.specjalnosc_id=S.specjalnosc_id);

-- jacy pracownicy nie maja specjalnosci (zagnieżdzenie nieskorelowane)
select imie, nazwisko from pracownik
	where pracownik_id not in(
      select pracownik_id from predyspozycje);

-- pracownicy pracujacy w dziala z transportem oraz ich sredni zarobek
select imie, nazwisko, pracownik.pracownik_id, pracownik.dzial_id, AVG(umowa.wynagrodzenie::numeric::float8)
	from pracownik
    inner join dzial
    on dzial.dzial_id=pracownik.dzial_id
    inner join umowa
    on umowa.umowa_nr = pracownik.umowa_nr
        where dzial.nazwa like 'transport'
        group by imie, nazwisko, pracownik.pracownik_id, pracownik.pracownik_id;

-- pracownicy którzy aktualnie są na umowie na czas nieokreslony
select imie, nazwisko, pracownik.pracownik_id from pracownik
	inner join wspolpraca
    on pracownik.pracownik_id=wspolpraca.pracownik_id
    and pracownik.umowa_nr=wspolpraca.umowa_nr
    where data_do is null;

-- pracownicy ktorzy nigdy nie skorzystali z dni wolnych
select imie, nazwisko, pracownik_id from pracownik
	where not exists(
      select * from dni_wolne
      where pracownik.pracownik_id=dni_wolne.wolne_id);

-- usuwanie specjalnosci bez nazwy
delete from specjalnosc
	where nazwa is null;

-- usun pracownikow ze stanowiskiem bez nazwy
delete from pracownik CASCADE
	where stanowisko_id in (
      select stanowisko_id from stanowisko
      	where nazwa is null);

--Umowom bez czasu do, ustaw czas do dzis
UPDATE wspolpraca set data_do= now()
	where data_do is null;