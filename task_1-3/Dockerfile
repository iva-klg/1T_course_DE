FROM postgres:latest
ENV POSTGRES_PASSWORD=secret
ENV POSTGRES_USER=username
ENV POSTGRES_DB=my_database
COPY init_scripts/init.sql /docker-entrypoint-initdb.d/init.sql
VOLUME /var/lib/postgresql/data

