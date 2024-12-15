FROM node:22

# Install Python and dependencies
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    libgl1-mesa-glx \
    libglib2.0-0 \
    wget \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    libsqlite3-dev \
    libbz2-dev

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install --no-cache-dir numpy Pillow insightface onnxruntime

WORKDIR /app
RUN git clone https://github.com/Nevenuga/react_face_recognition_photo_gallery.git .
RUN npm install
WORKDIR /app/client
RUN npm install
WORKDIR /app

ENV PYTHONPATH="$VIRTUAL_ENV/bin/python:$VIRTUAL_ENV/lib/python3.11/site-packages:/usr/local/lib/python3/dist-packages:/usr/lib/python3/dist-packages"

CMD ["sh", "-c", "cp /mounted/config/config.js /app/client/src/config.js && cp /mounted/config/server_config.js /app/server/server_config.js && cp /mounted/config/env.development /app/client/env.development && npm start & cd client && npm start"]
