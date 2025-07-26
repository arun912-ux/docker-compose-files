
FROM fluent/fluentd:v1.16.0-debian-1.0

USER root
RUN gem install fluent-plugin-opensearch --no-document
RUN gem install fluent-plugin-docker_metadata_filter

USER fluent

