FROM jenkins/ssh-slave
MAINTAINER Alex Choi <cuilongjian@gwm.cn>

# Install packages
RUN apt-get update
RUN apt-get install -y --no-install-recommends git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip \
    && rm -rf /var/lib/apt/lists/*

# Create shared folders
RUN chown -R jenkins:jenkins /home/build && chmod -R g+s /home/build/
RUN chmod -R 777 /var/opt


VOLUME ["/home/build","/var/opt"]
WORKDIR "/home/build"
