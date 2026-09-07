FROM rockylinux:9

RUN sed -i '/tsflags=nodocs/d' /etc/dnf/dnf.conf

ARG USERNAME=student
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME 

WORKDIR /home/$USERNAME


RUN ["dnf", "upgrade", "--refresh", "-y"]
RUN ["dnf", "group", "install", "Development Tools",  "-y"]
RUN ["dnf", "install", "-y", "vim"]
RUN ["dnf", "install", "-y", "tmux"]
RUN ["dnf", "install", "-y", "tree"]
RUN ["dnf", "install", "-y", "sed"]

RUN ["dnf", "install", "-y", "man"]
RUN ["dnf", "install", "-y", "man-pages"]
RUN ["dnf", "install", "-y", "man-db"]
RUN ["dnf", "install", "-y", "coreutils", "--allowerasing"]
RUN ["mandb", "--create"]

RUN ["dnf", "install", "python", "-y"]
RUN ["dnf", "install", "pip", "-y"]
RUN ["dnf", "install", "wget", "-y"]
RUN ["dnf", "install", "-y", "dos2unix"]
RUN ["dnf", "upgrade", "--refresh", "-y"]
RUN ["dnf", "install", "-y", "glibc-devel"]
#RUN ["dnf", "install", "-y", "glibc-devel.i686"]

USER $USERNAME


CMD ["/bin/bash"]
