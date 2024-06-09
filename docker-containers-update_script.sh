#! /bin/bash

update_all() {

    docker_containers=(prowlarr sonarr radarr jellyfin jellyseerr qBittorrent uptime-kuma)

    for container in ${docker_containers[@]}
    do 
        echo "Updating $container ..."
        echo "cd" "/home/arun/Documents/docker-compose-files/$container"
        cd "/home/arun/Documents/docker-compose-files/$container"
        
        docker-compose down && docker-compose pull && docker-compose build --pull && docker-compose up -d --force-recreate
        
        while [ $? -ne 0 ]
        do
            docker-compose down && docker-compose pull && docker-compose build --pull && docker-compose up -d --force-recreate
        done

    done

}

update() {

    echo $1
    echo "cd" "/home/arun/Documents/docker-compose-files/$1"
    cd "/home/arun/Documents/docker-compose-files/$1"
    echo "updating $1 ..."
    docker-compose down && docker-compose pull && docker-compose build --pull && docker-compose up -d --force-recreate
    while [ $? -ne 0 ]
    do
        docker-compose down && docker-compose pull && docker-compose build --pull && docker-compose up -d --force-recreate
    done

}


# start of script 

if [ $# -eq 0 ]
then
    echo "No docker name passed. Upating all active containers... \\n"
    update_all
elif [ $# -gt 1 ]
then
    echo "Provided $@"
    for container in $@ 
    do
        update $container
    done 
else
    echo "Updating $1 container..."
    update $1
fi


echo "Pruning unused docker images..."
cd "/home/arun/Documents/docker-compose-files/"
./docker-image-prune-af.sh

