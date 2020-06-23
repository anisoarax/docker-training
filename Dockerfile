FROM node:alpine as builderStage
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builderStage /app/build /usr/share/nginx/html
