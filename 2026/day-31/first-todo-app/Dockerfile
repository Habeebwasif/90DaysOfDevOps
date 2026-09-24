#base image
FROM node:22-slim

#working directory
WORKDIR /app

#copying only this particularfile into my app(workdir)
COPY package*.json ./

#download dependencies
RUN npm install

#copy rest of the dependeices into /app (i.e workdir)
COPY . . 

#port
EXPOSE 3000

#run the app
CMD ["npm","start"]
