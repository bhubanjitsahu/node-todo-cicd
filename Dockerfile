FROM node:20-alpine3.17
WORKDIR /home/app
COPY . /home/app
RUN npm install
EXPOSE 8000
CMD ["node","/home/app/app.js"]
