FROM node:12.2

ENV HOME=/home/app

# Ensure apt-get is non-interactive, update package lists, install dependencies, and clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils apt-transport-https && \
    apt-get install -y htop && \
    rm -rf /var/lib/apt/lists/*

# Copy package.json and package-lock.json
COPY package.json package-lock.json $HOME/node_docker/

# Set the working directory
WORKDIR $HOME/node_docker

# Install dependencies
RUN npm install --silent --progress=false

# Copy the rest of the application code
COPY . $HOME/node_docker

# Command to run the application
CMD ["npm", "start"]
