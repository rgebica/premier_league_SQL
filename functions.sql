CREATE OR REPLACE FUNCTION premier_league.zawieszony_zawodnik()
RETURNS TRIGGER AS
$$
DECLARE
    klub INTEGER
BEGIN
    IF (NEW.id_wydarzenia IS NOT NULL) THEN
        klub = (SELECT id_klubu from "Zawodnik_klubu" inner join "Klub" K on "Zawodnik_klubu".id_klubu = K.id_klubu
            inner join sklad_gosci sg on "Zawodnik_klubu".id_zawodnika = sg.id_zawodnika and "Zawodnik_klubu".id_klubu = sg.id_goscia
            inner join sklad_gosp s on "Zawodnik_klubu".id_zawodnika = s.id_zawodnika and "Zawodnik_klubu".id_klubu = s.id_gospodarza
            inner join "Wydarzenia_meczowe_gosci" Wmg on sg.id_gospodarza = Wmg.id_gospodarza and sg.id_goscia = Wmg.id_goscia and sg.id_zawodnika = Wmg.id_zawodnika and sg.id_meczu = Wmg.id_meczu
            inner join "Wydarzenia_meczowe_gospodarzy" W on s.id_gospodarza = W.id_gospodarza and s.id_goscia = W.id_goscia and s.id_zawodnika = W.id_zawodnika and s.id_meczu = W.id_meczu
            where NEW.id_zawodnika = "Zawodnik_klubu".id_zawodnika);
        wydarzenie = (SELECT id_wydarzenia from "Wydarzenia_meczowe_gospodarzy" and "Wydarzenia_meczowe_gosci");
        IF(NEW.id_wydarzenia = 6) THEN
            INSERT INTO premier_league."Wykluczeni_zawodnicy" (id_zawodnika, rodzaj_wykluczenia, dlugosc_wykluczenia, id_klubu)
            VALUES (NEW.id_zawodnika, 'Czerwona kartka', '2 mecze', klub)
        end if;
        RETURN NEW
    end if;
           END;
$$
LANGUAGE 'plpgsql' VOLATILE;

CREATE TRIGGER wyklucznie_czerwonaKartka after INSERT
ON premier_league.rodzaje_wydarzen FOR EACH ROW
EXECUTE PROCEDURE premier_league.zawieszony_zawodnik

----------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION premier_league.dopuszczonyZawodnik()
RETURNS TRIGGER AS
$$
DECLARE
    current_date date
BEGIN
    IF (NEW.id_zawodnika IS NOT NULL) THEN
        obecna_data = (SELECT CURRENT_DATE)
        data = (SELECT NEW.data_urodzenia from "Zawodnik1" WHERE id_zawodnika = NEW.id_zawodnika)
        IF((obecna_data-data) < 16) THEN
            RAISE NOTICE 'Zawodnik poniżej 16 lat';
        end if;
    ELSE
        insert into "Zawodnik_klubu" (id_zawodnika, id_klubu) VALUES (NEW.id_zawodnika)
        end if;
        RETURN NEW
END;
$$
LANGUAGE 'plpgsql' VOLATILE;

CREATE TRIGGER zawodnik before INSERT
ON premier_league.rodzaje_wydarzen FOR EACH ROW
EXECUTE PROCEDURE premier_league.dopuszczonyZawodnik