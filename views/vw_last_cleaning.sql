-- View: qgep_sige.vw_last_cleaning

-- DROP VIEW qgep_sige.vw_last_cleaning;

CREATE OR REPLACE VIEW qgep_sige.vw_last_cleaning
 AS
 SELECT re.fk_wastewater_structure,
    date_part('isoyear'::text, max(me.time_point)) AS last_cleaning
   FROM qgep_od.re_maintenance_event_wastewater_structure re
     JOIN qgep_od.vw_qgep_maintenance me ON re.fk_maintenance_event::text = me.obj_id::text
  WHERE me.kind = 28
  GROUP BY re.fk_wastewater_structure;

ALTER TABLE qgep_sige.vw_last_cleaning
    OWNER TO sige;
