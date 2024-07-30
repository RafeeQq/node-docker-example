FROM node:18.18

ENV HOME=/home/app

RUN npm install

# Copy package.json and package-lock.json
COPY package.json package-lock.json $HOME/node_docker/

# Set the working directory
WORKDIR $HOME/node_docker

# Install dependencies
RUN npm install --silent --progress=false

RUN npm run build

# Copy the rest of the application code
COPY . $HOME/node_docker

# Command to run the application
CMD ["npm", "start"]
