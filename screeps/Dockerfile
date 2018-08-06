FROM node:8.11-stretch

RUN apt-get update
RUN apt-get install -y build-essential

WORKDIR /screeps

RUN yarn add screeps

RUN echo "" | npx screeps init

# install mongodb backend
RUN yarn add screepsmod-mongo screepsmod-auth screepsmod-tickrate screepsmod-admin-utils screepsmod-features

COPY .screepsrc .screepsrc
COPY run.sh run.sh
COPY reset-data.sh reset-data.sh

CMD "./run.sh"
