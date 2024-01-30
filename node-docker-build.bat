docker compose -f node-path/docker-compose.yml build node-docsify
@REM docker compose -f node-path/docker-compose.yml run -it  --rm node-docsify /bin/bash
docker compose -f node-path/docker-compose.yml up -d