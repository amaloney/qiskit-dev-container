FROM python:3.11-slim

WORKDIR /app
COPY . /app

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y build-essential curl git python3-dev python3-pip python3-venv vim \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN python3 -m venv /opt/venv
ENV PATH=/opt/venv/bin:$PATH
RUN pip install --upgrade pip \
    && pip install --requirement requirements-dev.txt \
    && pip install tox
