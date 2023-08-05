#==============================================================#
# File      :   Makefile
# Ctime     :   2020-11-03
# Mtime     :   2023-08-05
# Desc      :   Makefile shortcuts
# Path      :   Makefile
# Author    :   Ruohang Feng (rh@vonng.com)
# License   :   Apache-2.0
#==============================================================#

PGURL?=postgres:///
DATA_DIR=$(PWD)/data
GRAFANA_USERNAME?=admin
GRAFANA_PASSWORD?=pigsty
GRAFANA_ENDPOINT?=http://g.pigsty


#-----------------------------#
# entrypoint
#-----------------------------#
default: install
all: install

install: sql ui data


#-----------------------------#
# install
#-----------------------------#
ui:
	cd ui && ./grafana.py load

sql:
	psql $(PGURL) -f sql/000_base.sql    # baseline schema

data: load

#-----------------------------#
# data
#-----------------------------#
load:
	cat data/db_engine.csv     | psql $(PGURL) -c "TRUNCATE dbrank.db_engine_trend; COPY dbrank.db_engine_trend FROM STDIN CSV;";
	cat data/sf_used.csv       | psql $(PGURL) -c "TRUNCATE dbrank.sf_used        ; COPY dbrank.sf_used      FROM STDIN CSV HEADER;";
	cat data/sf_used_prof.csv  | psql $(PGURL) -c "TRUNCATE dbrank.sf_used_prof   ; COPY dbrank.sf_used_prof FROM STDIN CSV HEADER;";
	cat data/sf_used_noob.csv  | psql $(PGURL) -c "TRUNCATE dbrank.sf_used_noob   ; COPY dbrank.sf_used_noob FROM STDIN CSV HEADER;";
	cat data/sf_loved.csv      | psql $(PGURL) -c "TRUNCATE dbrank.sf_loved       ; COPY dbrank.sf_loved     FROM STDIN CSV HEADER;";
	cat data/sf_wanted.csv     | psql $(PGURL) -c "TRUNCATE dbrank.sf_wanted      ; COPY dbrank.sf_wanted    FROM STDIN CSV HEADER;";

clean:
	psql ${PGURL} -c 'TRUNCATE dbrank.db_engine_trend, dbrank.sf_used, dbrank.sf_used_prof,  dbrank.sf_used_noob, dbrank.sf_loved, dbrank.sf_wanted;';


.PHONY: default all install ui sql data