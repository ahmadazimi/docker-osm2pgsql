# docker-osm2pgsql
An updated docker image for Osm2pgsql tool to import OpenStreetMap (OSM) data into a PostgreSQL database.

`docker build -t flashmate/osm2pgsql .`

`docker build -t flashmate/osm2pgsql github.com/ahmadazimi/docker-osm2pgsql.git`

`docker run -i -t --rm flashmate/osm2pgsql -c 'osm2pgsql --version'`

### To import new OSM file:
```
docker run -i -t --rm --network host -v .:/osm flashmate/osm2pgsql -c ' \
    osm2pgsql --create --slim --verbose --database osm --schema public --output-pgsql-schema public --middle-schema public --username osmuser --host localhost --output flex --style /osm/custom.lua /osm/OSM.osm.pbf
'
```

### To upadte existing database with osm2pgsql-replication API:
```
docker run -i -t --rm --network host -v .:/osm flashmate/osm2pgsql -c ' \
    osm2pgsql-replication init --database osm --schema public --username osmuser --host localhost
'
```
```
docker run -i -t --rm --network host -v .:/osm flashmate/osm2pgsql -c ' \
    osm2pgsql-replication update --database osm --schema public --username osmuser --host localhost
'
```
