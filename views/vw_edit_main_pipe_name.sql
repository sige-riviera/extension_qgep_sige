-- View: qgep_sige.vw_edit_main_pipe_name

-- DROP VIEW qgep_sige.vw_edit_main_pipe_name;

CREATE OR REPLACE VIEW qgep_sige.vw_edit_main_pipe_name
 AS
 SELECT DISTINCT ON (re.obj_id) re.obj_id,
    re.progression_geometry,
    re.usr_collecting_pipe_id,
    re.usr_batch_cleaning_id,
    re.usr_batch_inspection_id,
    ch.function_hierarchic,
    ws.fk_owner,
    rp_from.obj_id AS rp_from_obj_id,
    rp_from.identifier AS rp_from_identifier,
    rp_to.obj_id AS rp_to_obj_id,
    rp_to.identifier AS rp_to_identifier
   FROM qgep_od.reach re
     LEFT JOIN qgep_od.wastewater_networkelement ne ON ne.obj_id::text = re.obj_id::text
     LEFT JOIN qgep_od.reach_point rp_from ON rp_from.obj_id::text = re.fk_reach_point_from::text
     LEFT JOIN qgep_od.reach_point rp_to ON rp_to.obj_id::text = re.fk_reach_point_to::text
     LEFT JOIN qgep_od.wastewater_structure ws ON ne.fk_wastewater_structure::text = ws.obj_id::text
     LEFT JOIN qgep_od.channel ch ON ch.obj_id::text = ws.obj_id::text
     LEFT JOIN qgep_od.pipe_profile pp ON re.fk_pipe_profile::text = pp.obj_id::text
  WHERE (ch.function_hierarchic = ANY (ARRAY[5068, 5069, 5070, 5071])) AND ws.fk_owner::text = 'ch15z36dOG000025'::text;

ALTER TABLE qgep_sige.vw_edit_main_pipe_name
    OWNER TO sige;


-- Rule: vw_edit_main_pipe_name_on_update ON qgep_sige.vw_edit_main_pipe_name

-- DROP Rule IF EXISTS vw_edit_main_pipe_name_on_update ON qgep_sige.vw_edit_main_pipe_name;

CREATE RULE vw_edit_main_pipe_name_on_update AS
    ON UPDATE TO qgep_sige.vw_edit_main_pipe_name
    DO INSTEAD
(UPDATE qgep_od.reach SET usr_collecting_pipe_id = new.usr_collecting_pipe_id
  WHERE ((reach.obj_id)::text = (old.obj_id)::text));

-- Rule: vw_edit_batch_cleaning_id_on_update ON qgep_sige.vw_edit_main_pipe_name

-- DROP Rule IF EXISTS vw_edit_batch_cleaning_id_on_update ON qgep_sige.vw_edit_main_pipe_name;

CREATE RULE vw_edit_batch_cleaning_id_on_update AS
    ON UPDATE TO qgep_sige.vw_edit_main_pipe_name
    DO INSTEAD
(UPDATE qgep_od.reach SET usr_batch_cleaning_id = new.usr_batch_cleaning_id
  WHERE ((reach.obj_id)::text = (old.obj_id)::text));

-- Rule: vw_edit_batch_inspection_id_on_update ON qgep_sige.vw_edit_main_pipe_name

-- DROP Rule IF EXISTS vw_edit_batch_inspection_id_on_update ON qgep_sige.vw_edit_main_pipe_name;

CREATE RULE vw_edit_batch_inspection_id_on_update AS
    ON UPDATE TO qgep_sige.vw_edit_main_pipe_name
    DO INSTEAD
(UPDATE qgep_od.reach SET usr_batch_inspection_id = new.usr_batch_inspection_id
  WHERE ((reach.obj_id)::text = (old.obj_id)::text));
