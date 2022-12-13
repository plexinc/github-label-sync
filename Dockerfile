FROM node:16-alpine
WORKDIR /app
COPY . .
RUN npm install -g github-label-sync
CMD [ "/app/run.sh" ]
