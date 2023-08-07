FROM node:18.17.0

COPY ./ /semantic-release

RUN cd /semantic-release && npm install .

ENTRYPOINT ["/semantic-release/node_modules/.bin/semantic-release"]
