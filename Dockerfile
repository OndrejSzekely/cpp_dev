FROM nvcr.io/nvidia/cuda:13.0.2-cudnn-devel-ubuntu24.04
ARG USERNAME=ubuntu

# [Optional] Add sudo support. Omit if you don't need to install software after connecting.
RUN apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Update apt and install packages for LLVM
RUN apt-get upgrade -y && apt-get -y install \
    wget \
    software-properties-common \
    lsb-release

# Install LLVM
RUN wget https://apt.llvm.org/llvm.sh && \
    chmod +x llvm.sh && \
    sudo ./llvm.sh 21

# Install other packages
RUN apt-get -y install \
    git
    
CMD  ["bash"]