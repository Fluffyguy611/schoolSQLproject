create table dzial
(
  dzial_id	 	INT	 	not null 	,
  nazwa			varchar(64)				,
  miasto		varchar(64)				,
  constraint	dzial_pk	primary key(dzial_id)
);

create table stanowisko
(
  stanowisko_id		INT 		not NULL,
  nazwa			varchar(64)				,
  CONSTRAINT	stanowisko_pk	primary key(stanowisko_id)
);

create table umowa
(
  umowa_nr		INT 		not NULL	,
  wynagrodzenie	money					,
  etat			FLOAT					,
  CONSTRAINT	umowa_pk	primary key(umowa_nr)
);


create table pracownik
(
  pracownik_id	SERIAL					,
  pesel			bigint			not NULL,
  stanowisko_id SERIAL 		not NULL	,
  dzial_id		INT 		not NULL	,
  umowa_nr		INT			UNIQUE		,
  imie			varchar(32)				,
  nazwisko		varchar(64)	not NULL	,
  miasto		varchar(32)				,
  ulica_dom		varchar(64)				,
  telefon		BIGINT					,
  CONSTRAINT	pracownik_nr_pk	primary key(pracownik_id),
  CONSTRAINT	pracownik_telefon_un	UNIQUE(telefon),
  CONSTRAINT	pracownik_stanowisko_fk
  					foreign key(stanowisko_id)
  					references stanowisko(stanowisko_id),
  CONSTRAINT	pracownik_dzial_fk
  					FOREIGN	key(dzial_id)
  					REFERENCES dzial(dzial_id),
  CONSTRAINT	pracownik_umowa_fk
  					foreign key(umowa_nr)
  					REFERENCES umowa(umowa_nr)
  );
  
create table wspolpraca
(
  pracownik_id		INT		  not null,
  umowa_nr			SERIAL 			UNIQUE,
  data_od			DATE	not null	  ,
  data_do			DATE				  ,
  CONSTRAINT	wspolpraca_pk	primary key(pracownik_id, umowa_nr),
  CONSTRAINT	wspolpraca_pracownik_fk
  					foreign key (pracownik_id)
  					references pracownik(pracownik_id)
  					on update CASCADE on DELETE cascade,
  CONSTRAINT	wspolpraca_umowa_fk
  					foreign key (umowa_nr)
  					references umowa(umowa_nr)
);

create table dni_wolne
(
  wolne_id				INT 					,
  urlop					int						,
  zwolnienie_lekarskie	int						,
  nadgodziny			int						,
  data_od				DATE			not null,
  data_do				DATE			not null,
  CONSTRAINT			wolne_fk	FOREIGN key(wolne_id)
  						references pracownik(pracownik_id)
  						on update cascade on delete CASCADE,
  CONSTRAINT			dates check(data_od <= data_do)
 );
 
 create table specjalnosc
 (
   specjalnosc_id		INT 		not null	,
   nazwa				varchar(64)				,
   CONSTRAINT			specjalnosc_pk primary key (specjalnosc_id)
);

create table predyspozycje
(
  pracownik_id			INT		not NULL	,
  specjalnosc_id		INT 		not null	,
  CONSTRAINT		predyspozycje_pk	
  				primary key(pracownik_id, specjalnosc_id),
  CONSTRAINT		predyspozycje_pracownik_fk	
  				FOREIGN key(pracownik_id)
  				REFERENCES pracownik(pracownik_id)
  				on update CASCADE on delete cascade,
  CONSTRAINT		predyspozycje_specjalnosc_fk
  				foreign key(specjalnosc_id)
  				REFERENCES specjalnosc(specjalnosc_id)
);


