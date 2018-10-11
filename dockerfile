## Specifies the base image we're extending
FROM node:8

## Create base directory
RUN mkdir /src

## Specify the "working directory" for the rest of the Dockerfile
WORKDIR /src

COPY ./package*.json ./
RUN npm install

## Add application code
COPY . .

## Set environment to "development" by default
ENV NODE_ENV development

## Allows port 3000 to be publicly available
EXPOSE 8080

## The command uses nodemon to run the application
CMD ["npm", "run", "nodemon"]