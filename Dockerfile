FROM ubuntu:23.04

ENV DEBIAN_FRONTEND=noninteractive

# for imhex install
RUN apt-get update
RUN apt-get install -y wget

WORKDIR /Downloads
RUN wget https://github.com/WerWolv/ImHex/releases/download/v1.30.1/imhex-1.30.1-Ubuntu-22.04-x86_64.deb
RUN apt-get install libglfw3 -y
RUN apt-get install libmagic1 -y
RUN apt-get install libmbedtls14 -y
RUN apt-get install libfreetype6 -y
RUN apt-get install libopengl0 -y
RUN apt-get install libdbus-1-3 -y
RUN apt-get install xdg-desktop-portal -y
RUN dpkg -i imhex-1.30.1-Ubuntu-22.04-x86_64.deb

# for developers
RUN apt-get install git -y
RUN apt-get install clang -y

# for execute
RUN apt-get install dbus-x11 -y
RUN apt-get install xdg-desktop-portal-gtk -y

ENTRYPOINT /usr/bin/imhex
