-- View: qgep_sige.vw_batch_cleaning_agg

-- DROP VIEW qgep_sige.vw_batch_cleaning_agg;

CREATE OR REPLACE VIEW qgep_sige.vw_batch_cleaning_agg
 AS
 SELECT row_number() OVER (ORDER BY vw_edit_collecting_pipe.sige_batch_cleaning_id) AS row_number,
    vw_edit_collecting_pipe.sige_batch_cleaning_id,
    count(vw_edit_collecting_pipe.obj_id) AS number_of_reaches,
    sum(vw_edit_collecting_pipe.length_effective) AS collecting_pipe_length,
    sum(vw_edit_collecting_pipe.length_effective * vw_edit_collecting_pipe.slope_per_mill) / sum(vw_edit_collecting_pipe.length_effective) AS avg_slope,
    st_collect(vw_edit_collecting_pipe.progression_geometry) AS batch_cleaning_geom
   FROM qgep_sige.vw_edit_collecting_pipe
  WHERE vw_edit_collecting_pipe.sige_batch_cleaning_id IS NOT NULL
  GROUP BY vw_edit_collecting_pipe.sige_batch_cleaning_id;

ALTER TABLE qgep_sige.vw_batch_cleaning_agg
    OWNER TO sige;
