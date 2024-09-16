# Docker Compose Files and Shell Scripts for Home Server

This repository contains Docker Compose files and shell scripts for running various services on a home server.

## Services

The following services are included:

- AdGuard Home: an open-source DNS and DoH server
- Authentik: an open-source identity and access management solution
- Caddy: a web server and reverse proxy
- File Browser: a web-based file manager
- FlareSolverr: a Captcha solver
- Gotify: a notification service
- Jellyfin: a self-hosted media server 📺
- Jellyseerr: a media discovery tool for Jellyfin 
- Pi-hole: a DNS-based ad blocker
- Portainer: a container management tool
- Prowlarr: a indexer manager for Radarr and Sonarr
- Qbittorrent: a torrent client
- Radarr: a video library manager
- Sonarr: a TV series library manager
- Traefik: a reverse proxy and load balancer
- Uptime-Kuma: a self-hosted uptime monitoring tool

## Shell Scripts

The following shell scripts are included:

- `docker-image-prune-af.sh`: a script to prune unused docker images
- `docker-containers-update_script.sh`: a script to update all docker containers
- `portainer/install_portainer.sh`: a script to install Portainer
- `portainer/update_portainer.sh`: a script to update Portainer
- `docker-compose-update.sh`: a script to update docker container with latest version

## Usage

To use these services, simply run `docker-compose up -d` in the directory containing the Docker Compose file for the desired service.

To update all services, run `./docker-containers-update_script.sh`.

To prune unused docker images, run `./docker-image-prune-af.sh`.

To install Portainer, run `./portainer/install_portainer.sh`.

To update Portainer, run `./portainer/update_portainer.sh`.
