FROM node:20.12.1

COPY ./node_modules /semantic-release/node_modules

ENV PATH /semantic-release/node_modules/.bin:$PATH

ENTRYPOINT ["semantic-release"]
