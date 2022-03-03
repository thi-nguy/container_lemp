FROM alpine:3.14

# Update package list and upgrade out-dated packages
RUN apk update && apk upgrade && \
    apk add --no-cache mariadb mariadb-client

# Move runner
RUN mkdir -p /scripts
COPY ./tools/create_db_for_wp.sh /scripts/
RUN chmod +x /scripts/create_db_for_wp.sh

EXPOSE 3306
ENTRYPOINT ["sh", "/scripts/create_db_for_wp.sh"]
