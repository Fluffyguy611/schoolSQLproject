DROP TABLE IF EXISTS umowa, pracownik, wspolpraca

create table umowa
(
  umowa_nr		SERIAL 		not NULL	,
  wynagrodzenie	money					,
  etat			FLOAT					,
  CONSTRAINT	umowa_pk	primary key(umowa_nr)
);


create table pracownik
(
  pracownik_id	SERIAL					,
  pesel			bigint			not NULL,
  umowa_nr		SERIAL 					,
  imie			varchar(32)				,
  nazwisko		varchar(64)	not NULL	,
  miasto		varchar(32)				,
  ulica_dom		varchar(64)				,
  telefon		BIGINT					,
  CONSTRAINT	pracownik_nr_pk	primary key(pracownik_id),
  CONSTRAINT	pracownik_telefon_un	UNIQUE(telefon),

  CONSTRAINT	pracownik_umowa_fk
  					foreign key(umowa_nr)
  					REFERENCES umowa(umowa_nr)
  );
  
create table wspolpraca
(
  pracownik_id		SERIAL		  not null,
  umowa_nr			SERIAL 			UNIQUE,
  data_od			DATE	not null	  ,
  data_do			DATE				  ,
  CONSTRAINT	wspolpraca_pk	primary key(pracownik_id, umowa_nr),
  CONSTRAINT	wspolpraca_pracownik_fk
  					foreign key (pracownik_id)
  					references pracownik(pracownik_id),
  CONSTRAINT	wspolpraca_umowa_fk
  					foreign key (umowa_nr)
  					references umowa(umowa_nr)
);


CREATE OR REPLACE FUNCTION update_umowa() 
RETURNS TRIGGER AS $$ 
BEGIN 
UPDATE pracownik 
SET pracownik.umowa_nr = new.umowa_nr

WHERE pracownik.pracownik_id = wspolpraca.pracownik_id; 
RETURN NEW; 
END; 
$$ LANGUAGE plpgsql; 

CREATE TRIGGER tr_update_umowa 
AFTER INSERT On wspolpraca for each row
EXECUTE PROCEDURE update_umowa();

-- zakładamy, że razem z nową umową przypisywana jest współpraca, dlatego też po stworzeniu -- nowej 'współpracy' musimy również zmienić aktualną umowę w tabeli pracownik
-- dlatego kiedy wstawiane jest nowe połączenie z pracownikiem w tabeli wpółpraca, potrzebna -- jest aktualizacja w tabeli pracownika
 

CREATE RULE zamiana_umowy AS
	ON UPDATE TO wspolpraca
	WHERE old.umowa_nr IS NULL AND new.umowa_nr IS NOT NULL
	DO ALSO UPDATE pracownik SET umowa_nr = new.umowa_nr
;

-- innych sposób na stworzenie tego wyzwalacza
insert into umowa(umowa_nr, wynagrodzenie, etat)
values(1, NULL, 1);

insert into pracownik(pracownik_id, pesel, umowa_nr, imie, nazwisko, miasto, ulica_dom, telefon)
VALUES(1, 50435744130, 1, 'Jan', 'Kowalski', 'Gdańsk', NULL, NULL);

insert into wspolpraca(pracownik_id, umowa_nr, data_od, data_do)
values(1, 1, '2019/10/02', null);

SELECT * from pracownik inner join umowa on pracownik.umowa_nr == umowa.umowa_nr inner join wspolpraca on pracownik.pracownik_id == wspolpraca.pracownik_id;

--uzycie wyzwalacza

insert into umowa(umowa_nr, wynagrodzenie, etat)
values(2, 3500.90, 0.75);

insert into wspolpraca(pracownik_id, umowa_nr, data_od, data_do)
values(1, 2, '2019/10/03', '2020/09/30');

-- nie zmienilismy sami umowi w tabeli pracownika

SELECT * from pracownik inner join umowa on pracownik.umowa_nr == umowa.umowa_nr inner join wspolpraca on pracownik.pracownik_id == wspolpraca.pracownik_id;
