# x11docker/mate
FROM ubuntu:bionic

LABEL Name="x11docker Ubuntu Mate Desktoy"
LABEL Version="1.0"

ARG SLACK_DOWNLOAD 
ARG SMARTGIT_DOWNLOAD
ARG PYCHARM_DOWNLOAD

ENV LANG en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV SLACK_DOWNLOAD https://downloads.slack-edge.com/linux_releases/slack-desktop-4.4.0-amd64.deb
ENV SMARTGIT_DOWNLOAD https://www.syntevo.com/downloads/smartgit/smartgit-19_1_7.deb
ENV PYCHARM_DOWNLOAD https://download.jetbrains.com/python/pycharm-community-2020.1.1.tar.gz

RUN apt-get update && \
    apt-get install -y \
      apt-utils \
      cmake \
      dbus-x11 \
      git \
      libxv1 \
      menu-xdg \
      mime-support \
      mesa-utils \
      mesa-utils-extra \
      procps \
      psmisc \
      python3-distutils \
      python3-pip \
      sudo \
      vim \
      wget \
      xclip \
      xdg-utils \
      xdg-user-dirs

# Language/locale settings
RUN echo $LANG UTF-8 > /etc/locale.gen && \
    apt-get install -y \
      locales && \
    update-locale --reset LANG=$LANG

#############################################################
# Mate desktop
#############################################################
RUN apt-get install -y \
      fortunes \
      gnome-colors \
      gnome-colors-common \
      gnome-themes-extra \
      gnome-themes-standard \
      mate-applets \
      mate-desktop-environment-extras \
      mate-desktop-environment-core \
      mate-icon-theme \
      mate-icon-theme-faenza \
      mate-notification-daemon \
      mate-panel \
      mate-system-monitor \
      mate-tweak \
      mate-utils \
      ubuntu-mate-themes

#############################################################
# Install docker and docker-compose
#############################################################
RUN apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg-agent \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -&& \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

#############################################################
# Install Apps
#############################################################
RUN apt-get install -y \
    chromium-browser \
    firefox

#############################################################
# Install slack
#############################################################
RUN wget --progress=bar:force:noscroll $SLACK_DOWNLOAD -O ./slack-desktop.deb && \
    apt-get install -y ./slack-desktop.deb && \
    rm slack-desktop.deb

#############################################################
# Install pycharm
#############################################################
RUN wget --progress=bar:force:noscroll $PYCHARM_DOWNLOAD -O pycharm.tar.gz && \
    mkdir /opt/pycharm && \
    tar xfz pycharm.tar.gz  -C /opt/pycharm --strip-components=1 && \
    rm pycharm.tar.gz

# To get a desktop icon, on the image 
COPY jetbrains-pycharm-ce.desktop /usr/share/applications/jetbrains-pycharm-ce.desktop

############################################################
# Install git helpers: smartgit, git-cola
############################################################
RUN wget --progress=bar:force:noscroll $SMARTGIT_DOWNLOAD -O smartgit.deb && \
    apt-get install -y ./smartgit.deb && \
    rm ./smartgit.deb && \
    apt-get install -y git-cola

############################################################
# Install signal
############################################################
RUN curl -s https://updates.signal.org/desktop/apt/keys.asc | apt-key add - && \
    echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list && \
    apt-get update && apt-get install -y signal-desktop

###########################################################
# Install Zoom
###########################################################
RUN wget --progress=bar:force:noscroll https://zoom.us/client/latest/zoom_amd64.deb && \
    apt-get install -y ./zoom_amd64.deb && \
    rm ./zoom_amd64.deb

###########################################################
# Install libreoffice
###########################################################
RUN apt-get install -y libreoffice

###########################################################
# Install Postman
###########################################################
RUN wget --progress=bar:force:noscroll https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz && \
    tar -xzf postman.tar.gz -C /opt && \
    rm postman.tar.gz && \
    ln -s /opt/Postman/Postman /usr/bin/postman

# To get a desktop icon, on the image 
COPY ./postman.desktop /usr/share/applications/postman.desktop

###########################################################
# Install ngrok
###########################################################
RUN wget --progress=bar:force:noscroll https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -O ngrok-stable-linux-amd64.zip && \
    unzip ngrok-stable-linux-amd64.zip -d /usr/local/bin

############################################################
# Install argcomplete and globalize it
############################################################
RUN pip3 install argcomplete && \
    activate-global-python-argcomplete

############################################################
# Install CircleCI command line
############################################################
RUN curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | bash

############################################################
# Install other dependencies
############################################################
RUN apt-get install -y graphviz ttf-ancient-fonts

############################################################
# Other settings
############################################################ 

# Disable "Super-L" keybinding for locking screen in container. 
# It screws up the keyboard
RUN gsettings set org.mate.Marco.global-keybindings run-command-1 ''


CMD ["mate-session"]
