FROM ubuntu

MAINTAINER Maciek Ruckgaber <maciekrb@gmail.com>

RUN apt-get update \
   && apt-get install --yes --no-install-recommends \
     automake \
     build-essential \
     bison \
     ca-certificates \
     flex \
     gawk \
     git \
     gperf \
     libexpat-dev \
     libtool \
     ncurses-dev \
     picocom \
     python \
     python-serial \
     sed \
     texinfo \
     wget \
     unzip 

RUN useradd dev
RUN mkdir /etc/ssh && echo "    IdentityFile ~/.ssh/id_rsa" >> /etc/ssh/ssh_config
RUN mkdir /home/dev && chown -R dev: /home/dev

WORKDIR /home/dev
USER dev

RUN git clone --recursive https://github.com/pfalcon/esp-open-sdk.git

WORKDIR /home/dev/esp-open-sdk
RUN make STANDALONE=y
ENV PATH=$PATH:/home/dev/esp-open-sdk/xtensa-lx106-elf/bin/

WORKDIR /home/dev

CMD ["bash"]
