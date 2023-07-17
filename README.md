# API development: https://www.youtube.com/watch?v=GMppyAPbLYk
# file watcher: https://stackoverflow.com/questions/23479511/running-a-python-script-when-a-new-file-is-created

# Vimba installation error skbuild fixed
https://www.codethebest.com/modulenotfounderror-no-module-named-skbuild-solved/ 

# Yolov5 and deepsort in c++
https://gitee.com/mumuU1156/yolov5-deepsort-tensorrt

The script is just trying to support both CPU and GPU mode.
You can launch the script with python3 [app.py] --device cpu to deploy a model on CPU.
And python3 [app.py] --device gpu for GPU case.

# For customized installation on Jetson (torch, onnxruntime, OPENCV GPU ...)
https://elinux.org/Jetson_Zoo


# Installing torch https://docs.nvidia.com/deeplearning/frameworks/install-pytorch-jetson-platform/index.html

# Create new environment
https://stackoverflow.com/questions/52816156/how-to-create-virtual-environment-for-python-3-7-0

# Boot from USB
https://www.youtube.com/watch?v=53rRMr1IpWs

# Camera usage
https://developer.nvidia.com/embedded/learn/tutorials/first-picture-csi-usb-camera


# Jetson_practices_VT
https://docs.nvidia.com/dgx/nvidia-container-runtime-upgrade/index.html

# Install onnx
sudo apt-get install python-pip protobuf-compiler libprotoc-dev
$ pip install Cython --user
$ pip install onnx --user --verbose



# Monitoring Jetson performance
Firstly, installed the jetson-stats package.

sudo -H pip install -U jetson-stats

Then run

sudo jtop

Buildin OpenCV with CUDA: https://github.com/mdegans/nano_build_opencv; https://www.youtube.com/watch?v=oKaLyow7hWU and github: https://github.com/JetsonHacksNano/buildOpenCV; https://github.com/jetsonhacks/buildOpenCVTX2

Testing docker runtime:

docker run --runtime=nvidia --rm nvidia/cuda nvidia-smi

https://medium.com/super-ai-engineer/docker-in-jetson-nano-for-training-ai-model-89cd90550bac
0. Install Docker for Jetson nano
Fortunately, docker has already installed after you flashed the Jetson with Jetpack. The version I used is JetPack 4.5 (L4T R32.5.0), the latest version available.

Run docker command without sudo (optional)
This step may be optional, but it will save you a lot of time. Unless you have to type sudo before run any docker command and type the password all the time. Please follow this link to disable sudo.

1. Pulling docker image
Nvidia has provided us many wonderful resources, including docker images for AI purposes. Just open the Linux terminal in Jetson nano and run this command. Please note that the tag should match your Jetpack version. Check this link to see your tag.

Here is the basics docker image. If you just a first-time user, I recommend using the Getting started with Jetson nano image. There is also a course provided.

Docker image used in Getting started with Jetson nano course

docker pull nvcr.io/nvidia/dli/dli-nano-ai:v2.0.1-r32.5.0
Docker image for machine learning

docker pull nvcr.io/nvidia/l4t-ml:r32.5.0-py3
or just pure basic docker image

docker pull nvcr.io/nvidia/l4t-base:r32.5.0
After pulling, check the images with this command

docker images
**Noted that you can run the docker command anywhere in the terminal.

2. Run docker container from docker image
After we got the docker image, we need to make a container based on that image. Inside a container, you can make some changes to the image or run a program. Run this command to run the container.

docker run --runtime nvidia --network host --name <name> --volume <local dir>:<container dir> -it <images name>:<tag>
example

docker run --runtime nvidia --network host --name demo_container --volume ~/Desktop/data:/workspace/data -it nvcr.io/nvidia/dli/dli-nano-ai:v2.0.1-r32.5.0
- -runtime nvidia will use the NVIDIA container runtime while running the l4t-base container
- - network host allows the container to use your Jetson host network and ports
- -name for new container
- -volume sync the local directory with container directory
-it means run in interactive mode
The volume part might confuse you a little. When you make a container, it like you make a new world. You cannot access the file in it unless you sync with your local world. From the example above, you sync /workspace/data with ~/Desktop/data that means if you have another directory in /workspace like /workspace/code, it will not show up in your local computer.


terminal inside the docker container
Congratulation!
Now you should get inside the container already. You can git pull your code or pip install more library. In suggestion, run this command in your working directory to make requirement.txt

python3 -m pip freeze > requirements.txt
and just install it all in the docker container

python3 -m pip install -r requirement.txt
3. stop and execute docker container again
To go out from the container, press Ctrl + D or type exit.

Run this command to check the container status

docker ps -a

Stop the running container to free RAM space

docker stop <conatainer name or ID>
If you want to use it again just start it

docker start <conatainer name or ID>
To get inside the docker container again don’t docker run it because it will create a new container. Just execute it with this command.

docker exec -it <docker container> /bin/bash
Now you should go inside the new world again.

More suggestion
To run a model on Jetson in the most efficient and optimized way, tensorrt and pycuda will help you shrink the model size and accelerate computational speed.

Most of the AI courses both on the internet and in university focus on the training section but did not teach in the deployment section. This docker part is just a fraction of the deployment stage. It also depends on what you will do with Jetson nano. For the CV filed, there are collecting streams from IP cameras, push the result to the database, auto-restart the system with systemd, etc. Hence, as an AI engineer, to deliver a full product, you should able to do the full pipeline or at least knowing what should be included.


---- Jetson Xavier
https://www.youtube.com/watch?v=LuWYXKrQcJ8 
1. Format a SD Memory card (e.g. 128 GB) using a SD card formatter (https://www.sdcard.org/downloads/formatter/)
2. Download and install BalenaEtcher (https://www.balena.io/etcher/)
3. Download jetpack for jetson Xavier NX (https://developer.nvidia.com/embedded/jetpack)
4. Flashing the operating system on this card
5. Insert the SD card into Jetson Xavier
6. Plug other hardware and boot :) Congratulations!
7. sudo apt-get install python3-pip ----> installing pip for python3 (should install anaconda or miniconda for the management)
8. Install jetson-stats for monitoring performance

---- Jetson TX2
https://www.youtube.com/watch?v=s1QDsa6SzuQ&ab_channel=JetsonHacks
https://www.youtube.com/watch?v=D7lkth34rgM&list=PLXYLzZ3XzIbgtQYph1AYLvhFoBNbNTp8G&index=2&ab_channel=JetsonHacks
https://github.com/chriswernst/NVIDIA-Jetson-TX2-Setup/blob/master/README.md
https://developer.download.nvidia.com/embedded/L4T/r32-3-1_Release_v1.0/jetson_tx2_developer_kit_user_guide.pdf?t=eyJscyI6ImdzZW8iLCJsc2QiOiJodHRwczovL3d3dy5nb29nbGUuY29tLyJ9

https://www.youtube.com/watch?v=KROP46Wte4Q&ab_channel=JetsonHacks 

  
--- https://www.linuxbabe.com/virtualbox/how-to-increase-virtualbox-disk-size-for-dynamically-allocated-disks Disk partition for linux Virtualbox


## Checking TensorRT version
dpkg -l | grep tensorrt
