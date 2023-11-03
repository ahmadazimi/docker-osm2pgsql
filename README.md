# docker-osm2pgsql
An updated docker image for Osm2pgsql tool to import OpenStreetMap (OSM) data into a PostgreSQL database.

`docker build -t flashmate/osm2pgsql github.com/ahmadazimi/docker-osm2pgsql.git`

`docker run -i -t --rm flashmate/osm2pgsql -c 'osm2pgsql --version'`
