FROM	node:latest

WORKDIR	/root
COPY	package*.json ./
RUN		npm i

COPY	index.js ./

EXPOSE	8080

CMD		[ "node", "index.js" ]
