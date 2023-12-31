FROM node:18.19.0

COPY ./ /semantic-release

RUN cd /semantic-release && npm install .

ENV PATH /semantic-release/node_modules/.bin:$PATH

ENTRYPOINT ["semantic-release"]
