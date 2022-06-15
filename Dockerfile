FROM python:3.9-bullseye as downloader

RUN git clone https://github.com/cryptosharks131/lndg.git /lndg

FROM python:3.9-slim-bullseye

COPY --from=downloader /lndg /lndg

WORKDIR /lndg

ENV PYTHONUNBUFFERED 1

RUN pip install -r requirements.txt

RUN pip install supervisor whitenoise
