FROM node:alpine as builderStage
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builderStage /app/build /usr/share/nginx/html
