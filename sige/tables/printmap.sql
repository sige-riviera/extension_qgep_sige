-- Table: qgep_sige.printmap

-- DROP TABLE IF EXISTS qgep_sige.printmap;

CREATE TABLE IF NOT EXISTS qgep_sige.printmap
(
    id integer NOT NULL DEFAULT nextval('qgep_sige.printmap_id_seq'::regclass),
    name character varying(20) COLLATE pg_catalog."default",
    pipe_number smallint,
    remark text COLLATE pg_catalog."default",
    version_date date,
    print_scale smallint,
    x_min double precision,
    y_min double precision,
    x_max double precision,
    y_max double precision,
    geometry geometry(Polygon,2056),
    CONSTRAINT printmap_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS qgep_sige.printmap
    OWNER to sige;
