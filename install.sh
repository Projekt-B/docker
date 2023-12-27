#!/usr/bin/env bash

docker-compose up -d

mkdir -p sources/vhosts/project-b.localhost/api && \
mkdir -p sources/vhosts/project-b.localhost/public && \
mkdir -p sources/vhosts/project-b.localhost/logs && \
rm -rf sources/vhosts/project-b.localhost/api && \
git clone git@github.com:Projekt-B/nestjs-api.git sources/vhosts/project-b.localhost/api && \
cp .env-projectb sources/vhosts/project-b.localhost/api/.env && \
node_container_line=$(docker ps | grep "node" | head -n1) && \
node_container_id="$(echo $node_container_line | awk '{print $1;}')" && \
docker exec -it $node_container_id bash -c 'cd /var/www/ && ./install.sh' && \
echo "Installed! Project is available at http://project-b.localhost"