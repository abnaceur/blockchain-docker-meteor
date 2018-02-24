FROM node
MAINTAINER "Sylvain Laurent <s@6120.eu>"

ADD browser-solidity /usr/src/browser-solidity
#ADD set-default-docker-endpoint.patch /tmp/set-default-docker-endpoint.patch
WORKDIR /usr/src/browser-solidity

RUN npm install && \
	npm run build && \
	npm run pullremix && \
	npm run linkremixcore && \
	npm run linkremixlib && \
	npm run linkremixsolidity \
	npm run linkremixdebugger

EXPOSE 8080
CMD ["npm","start"]
