FROM public.ecr.aws/docker/library/python:3.11-alpine

ENV FLASK_RUN_HOST=0.0.0.0

WORKDIR /app

RUN apk update && \
    apk add \
    pcre \
    pcre-dev \
    build-base \
    gcc \
    linux-headers \
    openssl \
    libffi-dev

# COPY requirements.txt .
COPY ./analytics .
RUN pip install -r requirements.txt

# COPY . .

CMD python app.py

##############################################################################################################

# FROM python:3.10-slim-buster

# # Install Postgres and configure a username + password
# USER root

# ENV DB_USERNAME=$DB_USERNAME
# ENV DB_PASSWORD=$DB_PASSWORD
# ENV DB_HOST='db-postgresql.default.svc.cluster.local'
# ENV DB_PORT='5432'
# ENV DB_NAME='postgres'

# ARG DB_USERNAME=$DB_USERNAME
# ARG DB_PASSWORD=$DB_PASSWORD

# RUN apt update -y && apt install postgresql postgresql-contrib -y
# RUN service postgresql start

# USER postgres
# WORKDIR /db
# COPY ./db .

# RUN service postgresql start && \
#     # psql -c "CREATE USER postgres WITH PASSWORD 'atzMsJI7or'" && \
#     psql < 1_create_tables.sql && \
#     psql < 2_seed_users.sql && \
#     psql < 3_seed_tokens.sql && \
#     psql -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres" && \
#     psql -c "GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO postgres"

# # -- End database setup

# USER root

# ENV DB_USERNAME=$DB_USERNAME
# ENV DB_PASSWORD=$DB_PASSWORD
# ENV DB_HOST='db-postgresql.default.svc.cluster.local'
# ENV DB_PORT='5432'
# ENV DB_NAME='postgres'

# WORKDIR /src

# # COPY ./analytics/requirements.txt requirements.txt
# COPY ./analytics .

# # Dependencies are installed during build time in the container itself so we don't have OS mismatch
# RUN pip install -r requirements.txt


# # Start the database and Flask application
# RUN export DB_USERNAME=DB_USERNAME && \
#     export DB_USERNAME=DB_PASSWORD && \
#     export DB_HOST=DB_HOST && \
#     export DB_PORT=DB_PORT && \
#     export DB_NAME=DB_NAME
# CMD service postgresql start && python app.py
