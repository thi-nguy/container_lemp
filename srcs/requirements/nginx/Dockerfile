# base image: debian: get debian installed inside the nginx image
# TLS1.2 TLS1.3? -- in the mysit_conf

# Download debian
FROM debian:buster 

RUN apt-get -y update 
RUN apt-get -y upgrade 

RUN apt-get -y install nginx
RUN apt-get -y install openssl

# Todo 1: Change default index file to mysite's index
# * --> can onpen: http://thi-nguy.42.fr at the end of this step
    # ! copy config file
COPY ./mysite_conf /etc/nginx/sites-available/

    # ! Link nginx to your site folder and unlink to the default folder
RUN ln -s /etc/nginx/sites-available/mysite_conf /etc/nginx/sites-enabled/
RUN unlink /etc/nginx/sites-enabled/default


# Todo 2: Set up SSL with NGINX (https instead of http)
# * --> can onpen: https://thi-nguy.42.fr at the end of this ste
# https://www.youtube.com/watch?v=X3Pr5VATOyA

    # ! Self assign key: create key, assign it to our website, require it...
# generate new key
RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=Paris/O=Ecole42/CN=thi-nguy" -newkey rsa:2048 -sha384 -keyout /etc/nginx/my-server-cert.key -out /etc/nginx/my-server-cert.crt

    # ! Reload nginX
EXPOSE 443
# RUN systemctl reload nginx


    # ! unbind with http?

# Todo 3: execute an entry point linux commande, run the server
CMD ["nginx", "-g", "daemon off;"]


# The Nginx configuration files are stored under the /etc/nginx directory and its main configuration file is /etc/nginx/nginx.conf. Importantly, its default document root for storing your web files is /usr/share/nginx/html/