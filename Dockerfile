
FROM  nodesource/trusty:0.12.4

# Bundle app source
COPY . /node

# Install app dependencies
RUN cd /node; npm install

EXPOSE 8080

CMD ["node", "/node/index.js"]

