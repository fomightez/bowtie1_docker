# Dockerfile to build Bowtie1 container images
# Based on Ubuntu
FROM ubuntu:14.04
LABEL maintainer "Wayne Decatur *(fomightez on Github)*"

# Install container-wide requrements unzip, wget, screen #
RUN apt-get update && apt-get install -y libreadline-dev \
   wget \
   curl \
   unzip \
   screen \
   python2.7-dev \
   python-numpy \
   python-matplotlib \
   python-pip \
   software-properties-common \
   libtbb-dev \
 && rm -rf /var/lib/apt/lists/* && \
 apt-get clean

RUN wget -O /opt/get-pip.py --no-check-certificate https://bootstrap.pypa.io/get-pip.py && \
   python /opt/get-pip.py && \
   rm -f /opt/get-pip.py


# Install latest Bowtie1
################################################################################
# Specifically Bowtie 1.2.0. That is specifically most
# recent, dated December 12, 2016 as noted at
# http://bowtie-bio.sourceforge.net/index.shtml. Seems to be mainly(?)
# hosted at https://sourceforge.net/projects/bowtie-bio/files/bowtie/1.2.0/ ,
# but for older versions seen references to https://github.com/BenLangmead/bowtie
################################################################################
# Set working directory in /usr/local/
WORKDIR /usr/local/
# Get via http and install 
RUN wget https://sourceforge.net/projects/bowtie-bio/files/bowtie/1.2.0/bowtie-1.2-linux-x86_64.zip && \
    unzip bowtie-1.2-linux-x86_64.zip && \
    rm -rf bowtie-1.2-linux-x86_64.zip
# Change in PATH 
ENV PATH /usr/local/bowtie-1.2:$PATH

# Making so screen program starts up with Bash shell so that tab-completion and other features work
ENV HOME /root
WORKDIR $HOME
RUN cp /etc/screenrc . && \
    mv screenrc .screenrc && \
    echo -e "# ~/.screenrc\ndefshell -bash      # dash makes it a login shell\n" >> .screenrc


# Default command
WORKDIR /data
CMD ["bash"]
