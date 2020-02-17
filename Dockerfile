FROM ubuntu:bionic

ENV http_proxy=http://de.coia.siemens.net:9400
ENV https_proxy=http://de.coia.siemens.net:9400

RUN apt-get update && \
    apt-get install -y \ 
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-tools \
    libgstreamer1.0-0 \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev

RUN apt-get install -y \
    git-core

WORKDIR /app

RUN git clone https://github.com/GStreamer/gst-rtsp-server.git .

RUN git checkout remotes/origin/1.14

RUN apt-get install -y \
    libglib2.0-dev \
    autoconf \
    automake \
    autopoint \
    libtool \
    pkg-config

RUN ./autogen.sh --noconfigure && \
    GST_PLUGINS_GOOD_DIR=$(pkg-config --variable=pluginsdir gstreamer-plugins-bad-1.0) ./configure && \
    make

WORKDIR /app/examples

ENTRYPOINT [ "./test-launch" ]

CMD [ "( videotestsrc ! x264enc ! rtph264pay name=pay0 pt=96 )" ]