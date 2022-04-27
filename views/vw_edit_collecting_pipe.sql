-- View: qgep_sige.vw_edit_collecting_pipe

-- DROP VIEW qgep_sige.vw_edit_collecting_pipe;

CREATE OR REPLACE VIEW qgep_sige.vw_edit_collecting_pipe
 AS
 SELECT DISTINCT ON (re.obj_id) re.obj_id,
    re.progression_geometry,
    re.material,
        CASE
            WHEN pp.height_width_ratio IS NOT NULL THEN round(re.clear_height::numeric * pp.height_width_ratio)::smallint::integer
            ELSE re.clear_height
        END AS dimension,
    re.clear_height,
    pp.height_width_ratio,
    re.sige_collecting_pipe_id,
    re.sige_batch_cleaning_id,
    re.sige_batch_inspection_id,
    re.length_effective,
        CASE
            WHEN rp_from.level > 0::numeric AND rp_to.level > 0::numeric THEN round((rp_from.level - rp_to.level) / re.length_effective * 1000::numeric, 1)
            ELSE NULL::numeric
        END AS slope_per_mill,
    ch.function_hierarchic,
    ch.function_hydraulic,
    ws.obj_id AS ws_obj_id,
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

ALTER TABLE qgep_sige.vw_edit_collecting_pipe
    OWNER TO sige;


-- Rule: vw_edit_main_pipe_name_on_update ON qgep_sige.vw_edit_collecting_pipe

-- DROP Rule IF EXISTS vw_edit_main_pipe_name_on_update ON qgep_sige.vw_edit_collecting_pipe;

CREATE RULE vw_edit_main_pipe_name_on_update AS
    ON UPDATE TO qgep_sige.vw_edit_collecting_pipe
    DO INSTEAD
(UPDATE qgep_od.reach SET sige_collecting_pipe_id = new.sige_collecting_pipe_id
  WHERE ((reach.obj_id)::text = (old.obj_id)::text));

-- Rule: vw_edit_sige_batch_cleaning_id_on_update ON qgep_sige.vw_edit_collecting_pipe

-- DROP Rule IF EXISTS vw_edit_sige_batch_cleaning_id_on_update ON qgep_sige.vw_edit_collecting_pipe;

CREATE RULE vw_edit_sige_batch_cleaning_id_on_update AS
    ON UPDATE TO qgep_sige.vw_edit_collecting_pipe
    DO INSTEAD
(UPDATE qgep_od.reach SET sige_batch_cleaning_id = new.sige_batch_cleaning_id
  WHERE ((reach.obj_id)::text = (old.obj_id)::text));

-- Rule: vw_edit_sige_batch_inspection_id_on_update ON qgep_sige.vw_edit_collecting_pipe

-- DROP Rule IF EXISTS vw_edit_sige_batch_inspection_id_on_update ON qgep_sige.vw_edit_collecting_pipe;

CREATE RULE vw_edit_sige_batch_inspection_id_on_update AS
    ON UPDATE TO qgep_sige.vw_edit_collecting_pipe
    DO INSTEAD
(UPDATE qgep_od.reach SET sige_batch_inspection_id = new.sige_batch_inspection_id
  WHERE ((reach.obj_id)::text = (old.obj_id)::text));
