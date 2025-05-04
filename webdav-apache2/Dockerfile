FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Kolkata

# Install Apache and WebDAV
RUN apt-get update && \
    apt-get install -y apache2 apache2-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
## new custom group for accessing all lxc mounts
RUN groupadd -g 9000 lxcsync \
&& usermod -aG lxcsync www-data

# Create WebDAV directory
RUN mkdir -p /var/www/webdav && \
chown -R www-data:lxcsync /var/www/webdav && \
chmod 2775 -R /var/www/webdav

# copy apache conf
RUN rm -rf /etc/apache2/sites-available/000-default.conf
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# copy password (htpasswd -cb ./webdav.password root root123)
COPY webdav.password /etc/apache2/webdav.password

# Expose port
EXPOSE 80

# Enable required Apache modules
RUN a2enmod dav dav_fs
    
# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]
