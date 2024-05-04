FROM debian:latest AS flutter-builder
ARG FLUTTER_VERSION=3.10.5

# Install flutter dependencies
RUN apt-get update
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3 sed
RUN apt-get clean
# Clone the flutter repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
RUN cd /usr/local/flutter && git checkout ${FLUTTER_VERSION}
# Set flutter path
ENV PATH="${PATH}:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin"
# Run flutter doctor
RUN flutter doctor -v
# RUN flutter channel stable
# RUN flutter upgrade
RUN flutter --version
RUN flutter precache --web

# Install python to help with scripting
RUN apt-get update \
    && apt-get install -y python3-pip python3-venv \
    && apt-get clean

# Setup the venv for python with pip packages
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"