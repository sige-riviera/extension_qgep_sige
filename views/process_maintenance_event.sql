-- View: qgep_sige.process_maintenance_event

-- DROP VIEW qgep_sige.process_maintenance_event;

CREATE OR REPLACE VIEW qgep_sige.process_maintenance_event
 AS
 SELECT f.obj_id,
    f.class,
    f.identifier,
    f.kind,
    f.object,
    f.path_relative,
    f.remark,
    f.last_modification,
    f.fk_dataowner,
    f.fk_provider,
    f.fk_data_media,
    reme.obj_id AS remeid,
    reme.fk_maintenance_event,
    vwre.obj_id AS reoid,
    vwre.progression_geometry
   FROM qgep_od.file f
     JOIN qgep_od.re_maintenance_event_wastewater_structure reme ON f.object::text = reme.fk_maintenance_event::text
     JOIN qgep_od.vw_qgep_reach vwre ON reme.fk_wastewater_structure::text = vwre.ws_obj_id::text;

ALTER TABLE qgep_sige.process_maintenance_event
    OWNER TO sige;
