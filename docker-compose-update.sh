# To update docker container with latest version 
docker-compose down && docker-compose pull && docker-compose build --pull && docker-compose up -d --force-recreate