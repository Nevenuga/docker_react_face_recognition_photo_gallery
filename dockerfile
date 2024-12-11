FROM node:22
RUN apt-get update && apt-get install -y git
WORKDIR /app
RUN git clone https://github.com/Nevenuga/react_face_recognition_photo_gallery.git .
RUN npm install
WORKDIR /app/client
RUN npm install
WORKDIR /app
CMD ["sh", "-c", "cp /mounted/config/config.js /app/client/src/config.js && cp /mounted/config/server_config.js /app/server/server_config.js && cp /mounted/config/env.development /app/client/env.development && npm start & cd client && npm start"]