#FROM dockerfile/ubuntu
#Enable EPEL for Node.js
#RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
#RUN sudo apt-get install -y nodejs
#sudo apt-get install build-essential

#FROM dockerfile/nodejs

FROM  nodesource/trusty:0.12.4


#RUN   \
#  apt-get -y -qq install python

#RUN \
#  wget -O - http://nodejs.org/dist/v0.12.5/node-v0.12.5-linux-x64.tar.gz \
#  | tar xzf - --strip-components=1 --exclude="README.md" --exclude="LICENSE" \
#  --exclude="ChangeLog" -C "/usr/local"


# Bundle app source
COPY . /node

# Install app dependencies
RUN cd /node; npm install

EXPOSE 8080

CMD ["node", "/node/index.js"]

