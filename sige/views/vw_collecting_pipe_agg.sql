-- View: qgep_sige.vw_collecting_pipe_agg

-- DROP VIEW qgep_sige.vw_collecting_pipe_agg;

CREATE OR REPLACE VIEW qgep_sige.vw_collecting_pipe_agg
 AS
 SELECT row_number() OVER (ORDER BY vw_edit_collecting_pipe.sige_collecting_pipe_id) AS row_number,
    vw_edit_collecting_pipe.sige_collecting_pipe_id,
    count(vw_edit_collecting_pipe.obj_id) AS number_of_reaches,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry))) AS collecting_pipe_length,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.function_hydraulic
            WHEN 23 THEN 1
            ELSE 0
        END::numeric::double precision) AS pumped_pipe_length,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 147 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_147,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 148 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_148,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 153 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_153,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 154 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_154,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 2754 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_2754,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 2755 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_2755,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 2761 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_2761,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 2762 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_2762,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 3016 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_3016,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 3256 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_3256,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 3638 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_3638,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 3639 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_3639,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 3640 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_3640,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 3641 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_3641,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 3648 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_3648,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 3654 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_3654,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 5076 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_5076,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 5077 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_5077,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 5078 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_5078,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 5079 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_5079,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 5080 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_5080,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 5081 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_5081,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 5381 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_5381,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE vw_edit_collecting_pipe.material
            WHEN 5382 THEN 1
            ELSE 0
        END::numeric::double precision) AS material_5382,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.material IS NULL THEN 1
            ELSE 0
        END::numeric::double precision) AS material_no_data,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension = 300 AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_300,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension = 250 AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_250,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension = 350 AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_350,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension = 315 AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_315,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension = 400 AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_400,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension = 600 AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_600,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension = 500 AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_500,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension = 700 AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_700,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension = 450 AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_450,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension = 800 AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_800,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension = 750 AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_750,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension = 200 AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_200,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN (vw_edit_collecting_pipe.dimension <> ALL (ARRAY[300, 250, 350, 315, 400, 600, 500, 700, 450, 800, 750, 200])) AND (vw_edit_collecting_pipe.height_width_ratio = 1::numeric OR vw_edit_collecting_pipe.height_width_ratio IS NULL) THEN 1
            ELSE 0
        END::numeric::double precision) AS width_others,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.height_width_ratio > 1::numeric OR vw_edit_collecting_pipe.height_width_ratio < 1::numeric THEN 1
            ELSE 0
        END::numeric::double precision) AS width_non_circular,
    sum(COALESCE(vw_edit_collecting_pipe.length_effective::double precision, st_length(vw_edit_collecting_pipe.progression_geometry)) *
        CASE
            WHEN vw_edit_collecting_pipe.dimension IS NULL THEN 1
            ELSE 0
        END::numeric::double precision) AS width_no_data,
    st_collect(vw_edit_collecting_pipe.progression_geometry) AS collecting_pipe_geom,
    ( SELECT sum(subquery.planned_cleaned_length_this_year) AS planned_cleaned_length_this_year
           FROM ( SELECT batch_cleaning.main_pipe_code,
                        CASE
                            WHEN batch_cleaning.last_cleaning_date::double precision = date_part('year'::text, 'now'::text::date) THEN vw_batch_cleaning_agg.collecting_pipe_length
                            ELSE 0::numeric
                        END AS planned_cleaned_length_this_year
                   FROM qgep_sige.batch_cleaning
                     LEFT JOIN qgep_sige.vw_batch_cleaning_agg ON vw_batch_cleaning_agg.sige_batch_cleaning_id = batch_cleaning.code) subquery
          WHERE subquery.main_pipe_code = vw_edit_collecting_pipe.sige_collecting_pipe_id
          GROUP BY subquery.main_pipe_code) AS planned_cleaned_length_this_year,
    ( SELECT sum(subquery.planned_inspected_length_this_year) AS planned_inspected_length_this_year
           FROM ( SELECT batch_inspection.main_pipe_code,
                        CASE
                            WHEN batch_inspection.last_inspection_date::double precision = date_part('year'::text, 'now'::text::date) THEN vw_batch_inspection_agg.collecting_pipe_length
                            ELSE 0::numeric
                        END AS planned_inspected_length_this_year
                   FROM qgep_sige.batch_inspection
                     LEFT JOIN qgep_sige.vw_batch_inspection_agg ON vw_batch_inspection_agg.sige_batch_inspection_id = batch_inspection.code) subquery
          WHERE subquery.main_pipe_code = vw_edit_collecting_pipe.sige_collecting_pipe_id
          GROUP BY subquery.main_pipe_code) AS planned_inspected_length_this_year
   FROM qgep_sige.vw_edit_collecting_pipe
  WHERE vw_edit_collecting_pipe.sige_collecting_pipe_id IS NOT NULL
  GROUP BY vw_edit_collecting_pipe.sige_collecting_pipe_id;

ALTER TABLE qgep_sige.vw_collecting_pipe_agg
    OWNER TO sige;
