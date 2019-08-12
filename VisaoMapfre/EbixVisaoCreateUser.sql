create tablespace DB_EXCHANGEV_MAPFRE_DSV datafile '/u01/app/oracle/oradata/RJDVL/db_exchangev_mapfre_dsv.dbf' size 100m autoextend on next 100m maxsize 20g extent management local;
create tablespace DB_EXCHANGEV_MAPFRE_HML datafile '/u01/app/oracle/oradata/RJDVL/db_exchangev_mapfre_hml.dbf' size 100m autoextend on next 100m maxsize 20g extent management local;

create user US_APP_EX_VISAO_DSV  identified by "9qPvr30g" default tablespace DB_EXCHANGEV_MAPFRE_DSV temporary tablespace temp quota unlimited on DB_EXCHANGEV_MAPFRE_DSV;
create user US_DEV_EX_VISAO_DSV identified by "9PaqDDb9" default tablespace USERS temporary tablespace temp;

grant connect, resource to US_APP_EX_VISAO_DSV ;
grant connect to US_DEV_EX_VISAO_DSV;

create user US_APP_EX_VISAO_HML identified by "7bWB9bXa" default tablespace DB_EXCHANGEV_MAPFRE_HML temporary tablespace temp quota unlimited on DB_EXCHANGEV_MAPFRE_HML;
create user US_DEV_EX_VISAO_HML identified by "8LBqDBgv" default tablespace USERS temporary tablespace temp;

grant connect, resource to US_APP_EX_VISAO_HML;
grant connect to US_DEV_EX_VISAO_HML;
