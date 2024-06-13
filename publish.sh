pwd
# docker compose -f node-path/docker-compose.yml build node-docsify
# @REM docker compose -f node-path/docker-compose.yml run -it  --rm node-docsify /bin/bash

group=services_docsify
img=nginx-docsify

cp -r docsify node-path/nginx

docker compose -f node-path/docker-compose.yml -p $group down $img
# docker compose -f node-path/docker-compose.yml -p $group build $img
docker compose -f node-path/docker-compose.yml -p $group up -d $img
