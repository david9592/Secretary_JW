/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  david
 * Created: 20/06/2017
 */

CREATE TABLE lugar(lugar_id INTEGER
                            CONSTRAINT lug_lugar_id_nn NOT NULL
                            CONSTRAINT lug_lugar_id_pk PRIMARY KEY
                            GENERATED ALWAYS AS IDENTITY
                            (START WITH 1, INCREMENT BY 1),
                        lugar_nombre VARCHAR(30),
                        lugar_localidad VARCHAR(50),
                        publicador_id INTEGER
                            CONSTRAINT lug_publicador_id_nn NOT NULL,
                        siervo_id INTEGER
                            CONSTRAINT lug_siervo_id_nn NOT NULL);

CREATE TABLE publicador(publicador_id INTEGER
                            CONSTRAINT pub_publicador_id_nn NOT NULL
                            CONSTRAINT pub_publicador_id_pk PRIMARY KEY
                            GENERATED ALWAYS AS IDENTITY
                            (START WITH 1, INCREMENT BY 1),
                        nombre VARCHAR(25)
                            CONSTRAINT pub_nombre_nn NOT NULL,
                        apellido VARCHAR(25),
                        siervo_id INTEGER
                            CONSTRAINT pub_siervo_fk REFERENCES
                            publicador(publicador_id),
                        telefono INTEGER),
                        lugar_id INTEGER);

CREATE TABLE informe(informe_id INTEGER
                            CONSTRAINT inf_informe_id_nn NOT NULL
                            CONSTRAINT inf_informe_id_pk PRIMARY KEY
                            GENERATED ALWAYS AS IDENTITY
                            (START WITH 1, INCREMENT BY 1),
                        publicador_id INTEGER,
                        publicaciones INTEGER,
                        videos INTEGER,
                        horas INTEGER,
                        revisitas INTEGER,
                        estudios INTEGER);

--Agregando CONSTRAINT FOREIGN KEY
ALTER TABLE lugar
ADD CONSTRAINT lugar_publicador_fk
    FOREIGN KEY (lugar_id)
    REFERENCES publicador(lugar_id);

ALTER TABLE lugar
ADD CONSTRAINT lugar_siervo_id_fk
    FOREIGN KEY (siervo_id)
    REFERENCES publicador(lugar_id);

ALTER TABLE publicador
ADD CONSTRAINT pub_lugar_id_fk
    FOREIGN KEY (lugar_id)
    REFERENCES lugar(publicador_id);

ALTER TABLE publicador
ADD CONSTRAINT publicador_informe_fk
    FOREIGN KEY (publicador_id)
    REFERENCES informe(informe_id));

--Creación de SECUENCIAS
/*CREATE SEQUENCE lugar_id
    AS INTEGER
        START WITH 1
        INCREMENT BY 1
        NO MAXVALUE
        NO MINVALUE
        NO CYCLE;

{  AS dataType   
| START WITH signedInteger   
| INCREMENT BY signedInteger   
| MAXVALUE signedInteger | NO MAXVALUE   
| MINVALUE signedInteger | NO MINVALUE   
| CYCLE | NO CYCLE }*/