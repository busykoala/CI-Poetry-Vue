FROM centos:7

ENV CHROME_PATH=/usr/bin/chromium-browser
ENV PATH="/root/.poetry/bin:$PATH"
ENV PYTHON_VERSION=3.9.6

# update system and add epel
RUN yum update -y
RUN yum install -y epel-release

# install python and poetry
RUN yum install -y gcc openssl-devel bzip2-devel libffi-devel zlib-devel wget make
RUN wget "https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz"
RUN tar -xvf "Python-$PYTHON_VERSION.tgz"
RUN ls -hal
RUN cd "Python-$PYTHON_VERSION" && ./configure --enable-optimizations
RUN cd "Python-$PYTHON_VERSION" && make altinstall
RUN rm -r "Python-$PYTHON_VERSION"*
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3.9

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
