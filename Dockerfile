FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build <-- will have all the goodies necessary to run in prod

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# server from nginx production server