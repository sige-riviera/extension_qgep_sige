-- Table: qgep_sige.batch_inspection

-- DROP TABLE IF EXISTS qgep_sige.batch_inspection;

CREATE TABLE IF NOT EXISTS qgep_sige.batch_inspection
(
    code integer NOT NULL,
    situation character varying(250) COLLATE pg_catalog."default",
    main_pipe_code integer,
    name character varying(250) COLLATE pg_catalog."default",
    inspection_interval numeric(3,1),
    last_inspection_date integer,
    min_chamber_name character varying(100) COLLATE pg_catalog."default",
    max_chamber_name integer,
    area character varying(100) COLLATE pg_catalog."default",
    network_name character varying(100) COLLATE pg_catalog."default",
    remark character varying(250) COLLATE pg_catalog."default",
    CONSTRAINT pkey_qgep_sige_vl_batch_inspection_name_code PRIMARY KEY (code),
    CONSTRAINT vl_batch_inspection_name_main_pipe_name_fkey FOREIGN KEY (main_pipe_code)
        REFERENCES qgep_sige.collecting_pipe (code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS qgep_sige.batch_inspection
    OWNER to sige;
