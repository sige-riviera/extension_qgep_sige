#!/usr/bin/env bash

# Exit on error
#set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PGSERVICE=$1
SRID=2056

# Insert views
psql service=$PGSERVICE -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/vw_edit_collecting_pipe.sql
psql service=$PGSERVICE -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/vw_edit_main_pipe_name.sql
psql service=$PGSERVICE -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/vw_batch_cleaning_agg.sql
psql service=$PGSERVICE -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/vw_batch_inspection_agg.sql
psql service=$PGSERVICE -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/vw_collecting_pipe_agg.sql
psql service=$PGSERVICE -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/vw_last_cleaning.sql
psql service=$PGSERVICE -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/vw_last_inspection.sql
psql service=$PGSERVICE -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/refoulement_replaced_by_pumping_reach.sql
psql service=$PGSERVICE -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/vw_pumping_reach.sql
psql service=$PGSERVICE -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/views/process_maintenance_event.sql
