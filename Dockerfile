FROM python:3.8.16-buster

WORKDIR /usr/src/app

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies:
COPY requirements.txt .
RUN pip install -r requirements.txt


# docker run -it --name myapp --rm \
#     --volume $(pwd):/usr/src/app \
#     --net=host myapp-dev:latest \
#     sh