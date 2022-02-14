-- Table: qgep_sige.collecting_pipe

-- DROP TABLE IF EXISTS qgep_sige.collecting_pipe;

CREATE TABLE IF NOT EXISTS qgep_sige.collecting_pipe
(
    code integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default",
    situation character varying(250) COLLATE pg_catalog."default",
    min_chamber_name character varying(100) COLLATE pg_catalog."default",
    max_chamber_name character varying(100) COLLATE pg_catalog."default",
    area character varying(100) COLLATE pg_catalog."default",
    network_name character varying(100) COLLATE pg_catalog."default",
    remark character varying(250) COLLATE pg_catalog."default",
    CONSTRAINT pkey_qgep_sige_vl_main_pipe_name_code PRIMARY KEY (code)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS qgep_sige.collecting_pipe
    OWNER to sige;
