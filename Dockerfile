FROM node:18.17.1

COPY ./ /semantic-release

RUN cd /semantic-release && npm install .

ENV PATH /semantic-release/node_modules/.bin:$PATH

ENTRYPOINT ["semantic-release"]