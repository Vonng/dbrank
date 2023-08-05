# Database Ranking

Pigsty App to show the ranking of database engines.

Demo: 

- DB Engine Trending: http://demo.pigsty.cc/d/dbeng-overview
- StackOverflow 2023 Survey Data: http://demo.pigsty.cc/d/sf-db-survey
- SF 2023 DB Used/Loved Chart: http://demo.pigsty.cc/d/db-trend-graph


```bash
# install dashboards
GRAFANA_ENDPOINT=http://g.pigsty    make ui

# install database schema and data
PGURL=postgres://dbuser_dba:DBUser.DBA@10.10.10.10:5432/meta  make sql
PGURL=postgres://dbuser_dba:DBUser.DBA@10.10.10.10:5432/meta  make data 
```




## License

CC By 4.0