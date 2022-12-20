#https://stackoverflow.com/questions/62786028/importerror-libgthread-2-0-so-0-cannot-open-shared-object-file-no-such-file-o
#https://yugdamor.medium.com/importerror-libgthread-2-0-so-0-cannot-open-shared-object-file-no-such-file-or-directory-895b94a7827b
#https://stackoverflow.com/questions/55313610/importerror-libgl-so-1-cannot-open-shared-object-file-no-such-file-or-directo
#https://github.com/anibali/docker-pytorch/blob/master/dockerfiles/1.5.0-cuda10.2-ubuntu18.04/Dockerfile

FROM python:3.8.16-buster

WORKDIR /usr/src/app

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# WORKDIR /app
# ADD . /app

# # Install dependencies
# RUN pip install -r requirements.txt

# copying all files over
#COPY . /app

# Install dependencies:
COPY requirements.txt .


#RUN apt-get install -yq libgtk2.0-dev

RUN pip install -r requirements.txt

# ----------------------IMPORTANCE------------------------------
##: To be installed inside the docker container 
# apt-get install gcc python3-dev 
# pip install psutil
# apt-get update
# apt-get install -y libglib2.0-0 libsm6 libxrender1 libxext6
# --------------------------------------------------------------

# RUN apt-get update
# RUN apt-get install ffmpeg libsm6 libxext6  -y


# docker run -it --name myapp --rm \
#     --volume $(pwd):/usr/src/app \
#     --net=host myapp-dev:latest \
#     sh

### current running

# # syntax=docker/dockerfile:1

# FROM python:3.8-slim-buster

# WORKDIR /usr/src/app

# ENV VIRTUAL_ENV=/opt/venv
# RUN python3 -m venv $VIRTUAL_ENV
# ENV PATH="$VIRTUAL_ENV/bin:$PATH" 

# COPY requirements.txt ./

# #COPY detect.py ./
# #COPY utils ./utils
# #COPY runs1 ./runs1   
# #COPY data ./data
# #COPY models ./models


# RUN pip3 install -r requirements.txt

# RUN apt-get update
# RUN apt-get install -y libglib2.0-0 libsm6 libxrender1 libxext6

# #RUN python detect.py --weights ./runs/train/exp/weights/best.pt --img 640 --conf 0.50 --source data/images --hide-conf --hide-labels


