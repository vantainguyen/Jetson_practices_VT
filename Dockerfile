#https://stackoverflow.com/questions/62786028/importerror-libgthread-2-0-so-0-cannot-open-shared-object-file-no-such-file-o
#https://yugdamor.medium.com/importerror-libgthread-2-0-so-0-cannot-open-shared-object-file-no-such-file-or-directory-895b94a7827b
#https://stackoverflow.com/questions/55313610/importerror-libgl-so-1-cannot-open-shared-object-file-no-such-file-or-directo

FROM python:3.8.16-buster

WORKDIR /usr/src/app

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /app
ADD . /app

# # Install dependencies
# RUN pip install -r requirements.txt

# copying all files over
COPY . /app

# Install dependencies:
COPY requirements.txt .

RUN apt update
RUN apt-get install -y libglib2.0-0 libsm6 libxrender1 libxext6
RUN apt-get install -yq libgtk2.0-dev

RUN pip install -r requirements.txt

# RUN apt-get update
# RUN apt-get install ffmpeg libsm6 libxext6  -y


# docker run -it --name myapp --rm \
#     --volume $(pwd):/usr/src/app \
#     --net=host myapp-dev:latest \
#     sh
