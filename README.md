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
- Portainer Agent: an agent for Portainer to monitor Docker containers from other Portainer instances
- Prowlarr: a indexer manager for Radarr and Sonarr
- qBittorrent: a torrent client
- Radarr: a video library manager
- Sonarr: a TV series library manager
- bazarr: a companion application to Sonarr and Radarr that manages and downloads subtitles for your movies and TV shows
- Traefik: a reverse proxy and load balancer
- Uptime-Kuma: a self-hosted uptime monitoring tool
- Beszel: a monitoring agent for Docker, Linux, and other systems.
- cadvisor: a monitoring tool for Docker containers that provides Prometheus metrics
- Grafana: an open-source analytics and monitoring dashboard
- Prometheus: a monitoring system and time series database
- it-tools: a collection of miscellaneous useful tools
- Jenkins: a continuous integration and continuous deployment (CI/CD) tool
- Kafka: a distributed streaming platform and message broker
- mariadb: a relational database management system (RDBMS) and a popular alternative to MySQL
- Sonarqube: an open-source platform for continuous inspection of code quality
- Stirling-PDF: a free and open-source PDF editor that can be used online or self-hosted
- tsdproxy: a reverse proxy that uses the Tailscale network to provide secure access to Docker containers
- WordPress: a free and open-source content management system (CMS) that is widely used for creating websites and blogs
- Vaultwarden: a self-hosted password manager
- homepage: a homepage for your server and services
- KeyCloak: an open-source identity and access management solution
- kodebox: a self-hosted storage and file sharing solution

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
