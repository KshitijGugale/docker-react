# builder is a alias so that we can refer in the program
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# add the static content in container's html folder
COPY --from=builder /app/build /usr/share/nginx/html