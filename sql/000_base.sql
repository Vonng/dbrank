-- DROP SCHEMA dbrank CASCADE;
CREATE SCHEMA IF NOT EXISTS dbrank;

DROP TABLE IF EXISTS dbrank.db_engine_trend CASCADE;
CREATE TABLE IF NOT EXISTS dbrank.db_engine_trend
(
    time  DATE NOT NULL,
    db    text NOT NULL,
    score NUMERIC,
    PRIMARY KEY (time,db)
);

COMMENT ON TABLE  dbrank.db_engine_trend IS 'DB Engine Trending Data';
COMMENT ON COLUMN dbrank.db_engine_trend.time IS 'month date';
COMMENT ON COLUMN dbrank.db_engine_trend.db IS 'database name';
COMMENT ON COLUMN dbrank.db_engine_trend.score IS 'score of this month & db';


-- view of slope & bias
DROP VIEW IF EXISTS dbrank.v_;
CREATE VIEW dbrank.v_db_engine_regression AS
    SELECT db,
           regr_slope(score, time - '2012-11-01')     AS slope,
           regr_intercept(score, time - '2012-11-01') AS intercept,
           '2012-11-01'::DATE                         AS zero
    FROM dbrank.db_engine_trend
    WHERE time > '2020-01-01'
    GROUP BY db;
COMMENT ON VIEW  dbrank.v_db_engine_regression IS 'DB Engine Trending Slope & Intercept Regression';


CREATE OR REPLACE VIEW dbrank.v_mentioned AS
    SELECT
        time,
        CASE db
              WHEN 'PostgreSQL'                  THEN 'PostgreSQL'
              WHEN 'MySQL'                       THEN 'MySQL'
              WHEN 'SQLite'                      THEN 'SQLite'
              WHEN 'Microsoft SQL Server'        THEN 'Microsoft SQL Server'
              WHEN 'MongoDB'                     THEN 'MongoDB'
              WHEN 'Redis'                       THEN 'Redis'
              WHEN 'MariaDB'                     THEN 'MariaDB'
              WHEN 'Elasticsearch'               THEN 'ElasticSearch'
              WHEN 'Oracle'                      THEN 'Oracle'
              WHEN 'Amazon DynamoDB'             THEN 'DynamoDB'
              WHEN 'Firebase Realtime Database'  THEN 'Firebase'
              WHEN 'Google Cloud Firestore'      THEN 'Firestore'
              WHEN 'Cassandra'                   THEN 'Cassandra'
              WHEN 'Neo4j'                       THEN 'Neo4j'
              WHEN 'IBM Db2'                     THEN 'IBM DB2'
              WHEN 'CouchDB'                     THEN 'CouchDB'
              WHEN 'Couchbase'                   THEN 'Couchbase'
            END AS name, score
        FROM dbrank.db_engine_trend
    WHERE db IN ('PostgreSQL','MySQL','SQLite','Microsoft SQL Server','MongoDB','Redis','MariaDB','Elasticsearch','Oracle','Amazon DynamoDB','Firebase Realtime Database','Google Cloud Firestore','Cassandra','Neo4j','IBM Db2','CouchDB','Couchbase')
    ORDER BY time, name, score;

COMMENT ON VIEW  dbrank.v_mentioned IS 'DB Engine Score of Top Databases';


DROP TABLE IF EXISTS dbrank.sf_used CASCADE;
CREATE TABLE IF NOT EXISTS dbrank.sf_used
(
    time      DATE PRIMARY KEY,
    pgsql     NUMERIC,
    mysql     NUMERIC,
    sqlite    NUMERIC,
    mssql     NUMERIC,
    mongo     NUMERIC,
    redis     NUMERIC,
    maria     NUMERIC,
    es        NUMERIC,
    oracle    NUMERIC,
    dynamo    NUMERIC,
    firebase  NUMERIC,
    firestore NUMERIC,
    cassandra NUMERIC,
    neo4j     NUMERIC,
    ibmdb2    NUMERIC,
    couchdb   NUMERIC,
    couchbase NUMERIC
);


DROP TABLE IF EXISTS dbrank.sf_used_prof CASCADE ;
CREATE TABLE IF NOT EXISTS dbrank.sf_used_prof
(
    time      DATE PRIMARY KEY,
    pgsql     NUMERIC,
    mysql     NUMERIC,
    sqlite    NUMERIC,
    mssql     NUMERIC,
    mongo     NUMERIC,
    redis     NUMERIC,
    maria     NUMERIC,
    es        NUMERIC,
    oracle    NUMERIC,
    dynamo    NUMERIC,
    firebase  NUMERIC,
    firestore NUMERIC,
    cassandra NUMERIC,
    neo4j     NUMERIC,
    ibmdb2    NUMERIC,
    couchdb   NUMERIC,
    couchbase NUMERIC
);


DROP TABLE IF EXISTS dbrank.sf_used_noob CASCADE ;
CREATE TABLE IF NOT EXISTS dbrank.sf_used_noob
(
    time      DATE PRIMARY KEY,
    pgsql     NUMERIC,
    mysql     NUMERIC,
    sqlite    NUMERIC,
    mssql     NUMERIC,
    mongo     NUMERIC,
    redis     NUMERIC,
    maria     NUMERIC,
    es        NUMERIC,
    oracle    NUMERIC,
    dynamo    NUMERIC,
    firebase  NUMERIC,
    firestore NUMERIC,
    cassandra NUMERIC,
    neo4j     NUMERIC,
    ibmdb2    NUMERIC,
    couchdb   NUMERIC,
    couchbase NUMERIC
);

DROP TABLE IF EXISTS dbrank.sf_loved CASCADE;
CREATE TABLE IF NOT EXISTS dbrank.sf_loved
(
    time      DATE PRIMARY KEY,
    pgsql     NUMERIC,
    mysql     NUMERIC,
    sqlite    NUMERIC,
    mssql     NUMERIC,
    mongo     NUMERIC,
    redis     NUMERIC,
    maria     NUMERIC,
    es        NUMERIC,
    oracle    NUMERIC,
    dynamo    NUMERIC,
    firebase  NUMERIC,
    firestore NUMERIC,
    cassandra NUMERIC,
    neo4j     NUMERIC,
    ibmdb2    NUMERIC,
    couchdb   NUMERIC,
    couchbase NUMERIC
);

DROP TABLE IF EXISTS dbrank.sf_wanted CASCADE;
CREATE TABLE IF NOT EXISTS dbrank.sf_wanted
(
    time      DATE PRIMARY KEY,
    pgsql     NUMERIC,
    mysql     NUMERIC,
    sqlite    NUMERIC,
    mssql     NUMERIC,
    mongo     NUMERIC,
    redis     NUMERIC,
    maria     NUMERIC,
    es        NUMERIC,
    oracle    NUMERIC,
    dynamo    NUMERIC,
    firebase  NUMERIC,
    firestore NUMERIC,
    cassandra NUMERIC,
    neo4j     NUMERIC,
    ibmdb2    NUMERIC,
    couchdb   NUMERIC,
    couchbase NUMERIC
);


CREATE OR REPLACE VIEW dbrank.v_used AS
SELECT * FROM
    (SELECT time, 'PostgreSQL' as name,    pgsql     AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'MySQL' as name,         mysql     AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'SQLite' as name,        sqlite    AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'SQL Server' as name,    mssql     AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'MongoDB' as name,       mongo     AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'Redis' as name,         redis     AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'MariaDB' as name,       maria     AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'ElasticSearch' as name, es        AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'Oracle' as name,        oracle    AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'DynamoDB' as name,      dynamo    AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'Firebase' as name,      firebase  AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'Firestore' as name,     firestore AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'Cassandra' as name,     cassandra AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'Neo4j' as name,         neo4j     AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'IBM DB2' as name,       ibmdb2    AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'CouchDB' as name,       couchdb   AS value FROM dbrank.sf_used UNION ALL
     SELECT time, 'Couchbase' as name,     couchbase AS value FROM dbrank.sf_used) r;

CREATE OR REPLACE VIEW dbrank.v_used_prof AS
SELECT * FROM
    (SELECT time, 'PostgreSQL' as name,    pgsql     AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'MySQL' as name,         mysql     AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'SQLite' as name,        sqlite    AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'SQL Server' as name,    mssql     AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'MongoDB' as name,       mongo     AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'Redis' as name,         redis     AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'MariaDB' as name,       maria     AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'ElasticSearch' as name, es        AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'Oracle' as name,        oracle    AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'DynamoDB' as name,      dynamo    AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'Firebase' as name,      firebase  AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'Firestore' as name,     firestore AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'Cassandra' as name,     cassandra AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'Neo4j' as name,         neo4j     AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'IBM DB2' as name,       ibmdb2    AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'CouchDB' as name,       couchdb   AS value FROM dbrank.sf_used_prof UNION ALL
     SELECT time, 'Couchbase' as name,     couchbase AS value FROM dbrank.sf_used_prof) r;

CREATE OR REPLACE VIEW dbrank.v_used_noob AS
SELECT * FROM
    (SELECT time, 'PostgreSQL' as name,    pgsql     AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'MySQL' as name,         mysql     AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'SQLite' as name,        sqlite    AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'SQL Server' as name,    mssql     AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'MongoDB' as name,       mongo     AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'Redis' as name,         redis     AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'MariaDB' as name,       maria     AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'ElasticSearch' as name, es        AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'Oracle' as name,        oracle    AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'DynamoDB' as name,      dynamo    AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'Firebase' as name,      firebase  AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'Firestore' as name,     firestore AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'Cassandra' as name,     cassandra AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'Neo4j' as name,         neo4j     AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'IBM DB2' as name,       ibmdb2    AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'CouchDB' as name,       couchdb   AS value FROM dbrank.sf_used_noob UNION ALL
     SELECT time, 'Couchbase' as name,     couchbase AS value FROM dbrank.sf_used_noob) r;


CREATE OR REPLACE VIEW dbrank.v_loved AS
SELECT * FROM
    (SELECT time, 'PostgreSQL' as name,    pgsql     AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'MySQL' as name,         mysql     AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'SQLite' as name,        sqlite    AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'SQL Server' as name,    mssql     AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'MongoDB' as name,       mongo     AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'Redis' as name,         redis     AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'MariaDB' as name,       maria     AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'ElasticSearch' as name, es        AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'Oracle' as name,        oracle    AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'DynamoDB' as name,      dynamo    AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'Firebase' as name,      firebase  AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'Firestore' as name,     firestore AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'Cassandra' as name,     cassandra AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'Neo4j' as name,         neo4j     AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'IBM DB2' as name,       ibmdb2    AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'CouchDB' as name,       couchdb   AS value FROM dbrank.sf_loved UNION ALL
     SELECT time, 'Couchbase' as name,     couchbase AS value FROM dbrank.sf_loved) r;

CREATE OR REPLACE VIEW dbrank.v_wanted AS
SELECT * FROM
    (SELECT time, 'PostgreSQL' as name,    pgsql     AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'MySQL' as name,         mysql     AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'SQLite' as name,        sqlite    AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'SQL Server' as name,    mssql     AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'MongoDB' as name,       mongo     AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'Redis' as name,         redis     AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'MariaDB' as name,       maria     AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'ElasticSearch' as name, es        AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'Oracle' as name,        oracle    AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'DynamoDB' as name,      dynamo    AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'Firebase' as name,      firebase  AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'Firestore' as name,     firestore AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'Cassandra' as name,     cassandra AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'Neo4j' as name,         neo4j     AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'IBM DB2' as name,       ibmdb2    AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'CouchDB' as name,       couchdb   AS value FROM dbrank.sf_wanted UNION ALL
     SELECT time, 'Couchbase' as name,     couchbase AS value FROM dbrank.sf_wanted) r;

CREATE OR REPLACE VIEW dbrank.v_trend AS
SELECT year, name, x AS use, y as love, z AS want, 2 * y - 100 AS lps FROM
    (
        SELECT u.pgsql AS x, l.pgsql AS y, 'pgsql' AS name, w.pgsql AS z, extract(year from l.time) AS year
        FROM dbrank.sf_used u JOIN dbrank.sf_loved l ON l.time = u.time JOIN dbrank.sf_wanted w ON l.time = w.time
        UNION ALL
        SELECT u.mysql AS x, l.mysql AS y, 'mysql' AS name, w.mysql AS z, extract(year from l.time) AS year
        FROM dbrank.sf_used u JOIN dbrank.sf_loved l ON l.time = u.time JOIN dbrank.sf_wanted w ON l.time = w.time
        UNION ALL
        SELECT u.sqlite AS x, l.sqlite AS y, 'sqlite' AS name, w.sqlite AS z, extract(year from l.time) AS year
        FROM dbrank.sf_used u JOIN dbrank.sf_loved l ON l.time = u.time JOIN dbrank.sf_wanted w ON l.time = w.time
        UNION ALL
        SELECT u.mssql AS x, l.mssql AS y, 'mssql' AS name, w.mssql AS z, extract(year from l.time) AS year
        FROM dbrank.sf_used u JOIN dbrank.sf_loved l ON l.time = u.time JOIN dbrank.sf_wanted w ON l.time = w.time
        UNION ALL
        SELECT u.mongo AS x, l.mongo AS y, 'mongo' AS name, w.mongo AS z, extract(year from l.time) AS year
        FROM dbrank.sf_used u JOIN dbrank.sf_loved l ON l.time = u.time JOIN dbrank.sf_wanted w ON l.time = w.time
        UNION ALL
        SELECT u.redis AS x, l.redis AS y, 'redis' AS name, w.redis AS z, extract(year from l.time) AS year
        FROM dbrank.sf_used u JOIN dbrank.sf_loved l ON l.time = u.time JOIN dbrank.sf_wanted w ON l.time = w.time
        UNION ALL
        SELECT u.oracle AS x, l.oracle AS y, 'oracle' AS name, w.oracle AS z, extract(year from l.time) AS year
        FROM dbrank.sf_used u JOIN dbrank.sf_loved l ON l.time = u.time JOIN dbrank.sf_wanted w ON l.time = w.time
    ) j;
