
FROM  nodesource/trusty:0.12.4

# Bundle app source
# COPY . /node

# Install app dependencies
RUN cd /node; npm install; npm install -g nodemon

EXPOSE 8080

CMD ["nodemon", "/node/index.js"]

