# risky newest Node image which can change unexpectedly 
FROM node:latest

# working directory to be used
WORKDIR /app

# copying entire into image
COPY . .

# installs packages
RUN npm install

# builds react app
RUN npm run build

# installing a server for showing of files
RUN npm install -g serve

# react server start on port 3000
EXPOSE 3000
CMD ["serve", "-s", "dist", "-l", "3000"]
