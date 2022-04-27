#!/usr/bin/env bash

# Exit on error
#set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PGSERVICE=$1
SRID=2056

# Insert columns 
# no columns no insert

# Insert tables 
for file in views/*.sql; do
  echo "Executing sql file $file."
  psql -U sige service=$PGSERVICE -f tables/$file
done

# Insert views
psql service=$PGSERVICE -v ON_ERROR_STOP=1 -v SRID=$SRID -f ${DIR}/insert_views.sql
