FROM postgres:12.5

RUN apt-get update && apt-get install -y postgresql-contrib && rm -rf /var/lib/apt/lists/*
ADD enable-uuid.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/enable-uuid.sh
