FROM alpine:3.14

# Update package list and upgrade out-dated packages
RUN apk update && apk upgrade && \
    apk add --no-cache mariadb mariadb-client

# Copy scripts
RUN mkdir -p /my_scripts
COPY ./tools/create_db_for_wp.sh /my_scripts/
RUN chmod +x /my_scripts/create_db_for_wp.sh

EXPOSE 3306
ENTRYPOINT ["sh", "/scripts/create_db_for_wp.sh"]
