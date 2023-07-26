FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# Instal basic utilities
RUN apt-get update && \
    apt-get install -y --no-install-recommends nano tmux git wget unzip bzip2 sudo python3-dev libportaudio2 libasound-dev git python3 python3-pip make g++ && \
    apt-get install -y ffmpeg && \
    apt-get clean

# Install pytorch
ARG PYTORCH="2.0.1"
ARG CUDA="118"

RUN pip3 install --upgrade pip setuptools wheel && \
    pip3 install torch==$PYTORCH torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu$CUDA

COPY ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt
COPY start_jupyter.sh start_jupyter.sh /workspace/
#CMD ./start.sh
