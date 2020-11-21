FROM centos:latest

ENV CHROME_PATH=/usr/bin/chromium-browser
ENV PATH="/root/.poetry/bin:$PATH"

# update system and add epel
RUN yum update -y
RUN yum install -y epel-release

# install python and poetry
RUN yum install -y python38
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
RUN ln -s /bin/python3 /bin/python

# install node
RUN yum install -y nodejs
# install yarn
RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
RUN rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
RUN yum install -y yarn
# install cypress and lighthouse dependencies
RUN yum install -y \
        xorg-x11-server-Xvfb \
        gtk2-devel \
        gtk3-devel \
        libnotify-devel \
        GConf2 \
        nss \
        libXScrnSaver \
        alsa-lib \
        which \
        chromium
