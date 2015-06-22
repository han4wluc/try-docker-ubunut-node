From ubuntu:latest

#Enable EPEL for Node.js
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
RUN sudo apt-get install -y nodejs

#sudo apt-get install build-essential

# Bundle app source
COPY . /src

# Install app dependencies
RUN cd /src; npm install

EXPOSE 8080

CMD ["node", "/src/index.js"]

