FROM python:3.10.14-slim

WORKDIR /app
COPY ./pgsync/entrypoint.sh ./entrypoint.sh
COPY ./pgsync/schema.json ./schema.json
RUN chmod +x ./entrypoint.sh


RUN apt update \
    && apt install -y moreutils \
    && apt install -y jq \
    && apt install -y wait-for-it \
    && apt install -y build-essential \
    && apt install -y libpq-dev

RUN pip3 install pgsync

ENTRYPOINT ["bash", "./entrypoint.sh"]