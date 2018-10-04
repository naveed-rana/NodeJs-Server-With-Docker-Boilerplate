## Specifies the base image we're extending
FROM node:8

## Create base directory
RUN mkdir /src

## Specify the "working directory" for the rest of the Dockerfile
WORKDIR /src

COPY ./package.json /src/package.json
COPY ./package-lock.json /src/package-lock.json
RUN npm install

## Add application code
COPY ./lib /src/lib
COPY ./test /src/test

## Add the nodemon configuration file
COPY ./nodemon.json /src/nodemon.json

## Add the tsconfig configuration file
COPY ./tsconfig.json /src/tsconfig.json

## Set environment to "development" by default
ENV NODE_ENV development

## Allows port 3000 to be publicly available
EXPOSE 8080

## The command uses nodemon to run the application
CMD ["npm", "run", "nodemon"]