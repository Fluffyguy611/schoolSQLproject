insert into stanowisko (stanowisko_id, nazwa)
values(1, NULL);
insert into stanowisko (stanowisko_id, nazwa)
values(2, 'budowlaniec');
insert into stanowisko (stanowisko_id, nazwa)
values(3, 'dyrektor');
insert into stanowisko (stanowisko_id, nazwa)
values(4, 'kierownik');
insert into stanowisko (stanowisko_id, nazwa)
values(5, 'malarz');
insert into stanowisko (stanowisko_id, nazwa)
values(6, 'kierowca');


insert into dzial (dzial_id, nazwa, miasto)
VALUES(1, 'budowlanka', 'Gdańsk');
insert into dzial (dzial_id, nazwa, miasto)
VALUES(2, 'kadry', 'Kowale');
insert into dzial (dzial_id, nazwa, miasto)
VALUES(3, 'transport', 'Gdynia');
insert into dzial (dzial_id, nazwa, miasto)
VALUES(4, 'wykończeniówka', NULL);
insert into dzial (dzial_id, nazwa, miasto)
VALUES(5, 'transport', 'Gdańsk');
insert into dzial (dzial_id, nazwa, miasto)
VALUES(6, 'budowlanka', 'Gdynia');


insert into umowa(umowa_nr, wynagrodzenie, etat)
values(1, NULL, 1);
insert into umowa(umowa_nr, wynagrodzenie, etat)
values(2, 4000.00, 0.5);
insert into umowa(umowa_nr, wynagrodzenie, etat)
values(3, 3500.90, 0.75);
insert into umowa(umowa_nr, wynagrodzenie, etat)
values(4, 3200.00, 1);
insert into umowa(umowa_nr, wynagrodzenie, etat)
values(5, 6500.00, 1);
insert into umowa(umowa_nr, wynagrodzenie, etat)
values(6, 5000.00, 1);
insert into umowa(umowa_nr, wynagrodzenie, etat)
values(7, 5600.00, 1);
insert into umowa(umowa_nr, wynagrodzenie, etat)
values(8, 3900.00, 0.5);

insert into pracownik(pracownik_id, pesel, stanowisko_id, dzial_id, umowa_nr, imie, nazwisko, miasto, ulica_dom, telefon)
VALUES(1, 50435744130, 2, 1, 1, 'Jan', 'Kowalski', 'Gdańsk', NULL, NULL);

insert into pracownik(pracownik_id, pesel, stanowisko_id, dzial_id, umowa_nr, imie, nazwisko, miasto, ulica_dom, telefon)
VALUES(2, 28509194068, 2, 1, 4, 'Joe', 'Mama', 'Gdańsk', 'Grunwaldza 8', 12345678);

insert into pracownik(pracownik_id, pesel, stanowisko_id, dzial_id, umowa_nr, imie, nazwisko, miasto, ulica_dom, telefon)
VALUES(3, 81502254647, 2, 1, 6, 'Mike', 'Coksmal', 'Gdańsk', 'Szablowa 5', 12345679);

insert into pracownik(pracownik_id, pesel, stanowisko_id, dzial_id, umowa_nr, imie, nazwisko, miasto, ulica_dom, telefon)
VALUES(4, 91040489471, 4, 2, 8, 'Ben', 'Dover', 'Gdańsk', 'Szablowa 5', 12340679);

insert into pracownik(pracownik_id, pesel, stanowisko_id, dzial_id, umowa_nr, imie, nazwisko, miasto, ulica_dom, telefon)
VALUES(5, 45547669792, 6, 3, 2, 'Mamma', 'Mia', 'Sopot', 'Stalowa 12', 12745679);

insert into pracownik(pracownik_id, pesel, stanowisko_id, dzial_id, umowa_nr, imie, nazwisko, miasto, ulica_dom, telefon)
VALUES(6, 36518041565, 3, 1, 5, 'Janusz', 'Ububwebwe', 'Warszawa', 'Złote tarasy 27', 92385679);

insert into pracownik(pracownik_id, pesel, stanowisko_id, dzial_id, umowa_nr, imie, nazwisko, miasto, ulica_dom, telefon)
VALUES(7, 53431712785, 1, 4, 7, 'Try', 'Dover', 'Sosnowiec', NULL, 52385679);

insert into specjalnosc(specjalnosc_id, nazwa)
VALUES(1, 'Rzemieślnik');
insert into specjalnosc(specjalnosc_id, nazwa)
VALUES(2, 'Kierowca pojazdu towarowego');
insert into specjalnosc(specjalnosc_id, nazwa)
VALUES(3, 'Analityk finansowy');
insert into specjalnosc(specjalnosc_id, nazwa)
VALUES(4, 'Astrolog');
insert into specjalnosc(specjalnosc_id, nazwa)
VALUES(5, 'Kierownik działu transportu');
insert into specjalnosc(specjalnosc_id, nazwa)
VALUES(6, 'Księgowy');
insert into specjalnosc(specjalnosc_id, nazwa)
VALUES(7, Null);

insert into dni_wolne(wolne_id, urlop, zwolnienie_lekarskie, nadgodziny, data_od, data_do)
values(1, 22, null, null, '2022/03/04', '2022/03/26');

insert into dni_wolne(wolne_id, urlop, zwolnienie_lekarskie, nadgodziny, data_od, data_do)
values(2, null, 5, null, '2022/03/07', '2022/03/12');

insert into dni_wolne(wolne_id, urlop, zwolnienie_lekarskie, nadgodziny, data_od, data_do)
values(6, null, null, 1, '2022/02/08', '2022/02/09');

insert into dni_wolne(wolne_id, urlop, zwolnienie_lekarskie, nadgodziny, data_od, data_do)
values(5, 5, null, null, '2022/01/01', '2022/01/06');

insert into dni_wolne(wolne_id, urlop, zwolnienie_lekarskie, nadgodziny, data_od, data_do)
values(5, 5, null, null, '2022/04/01', '2022/04/06');

insert into dni_wolne(wolne_id, urlop, zwolnienie_lekarskie, nadgodziny, data_od, data_do)
values(4, null, 15, null, '2022/03/14', '2022/03/29');


insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(1, 1);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(1, 2);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(3, 1);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(4, 3);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(4, 4);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(4, 5);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(5, 1);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(5, 3);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(5, 5);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(6, 4);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(6, 1);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(6, 2);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(7, 1);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(7, 4);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(7, 3);
insert into predyspozycje(pracownik_id, specjalnosc_id)
VALUES(7, 6);


insert into wspolpraca(pracownik_id, umowa_nr, data_od, data_do)
values(1, 1, '2002/10/02', null);
insert into wspolpraca(pracownik_id, umowa_nr, data_od, data_do)
values(2, 4, '2010/10/02', null);
insert into wspolpraca(pracownik_id, umowa_nr, data_od, data_do)
values(3, 6, '2021/12/02', '2022/12/02');
insert into wspolpraca(pracownik_id, umowa_nr, data_od, data_do)
values(4, 8, '2020/10/01', null);
insert into wspolpraca(pracownik_id, umowa_nr, data_od, data_do)
values(5, 2, '2008/06/01', null);
insert into wspolpraca(pracownik_id, umowa_nr, data_od, data_do)
values(6, 5, '2021/12/02', '2022/12/02');
insert into wspolpraca(pracownik_id, umowa_nr, data_od, data_do)
values(7, 7, '2002/10/02', null);
insert into wspolpraca(pracownik_id, umowa_nr, data_od, data_do)
values(4, 3, '2019/10/01', '2020/09/30');


