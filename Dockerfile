# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-swarm /usr/share/nginx/html







# # stage 1
# FROM node:11.15.0-alpine as build-step
# WORKDIR /app
# COPY package.json ./
# RUN npm install
# COPY . .
# RUN npm run build --prod

# # stage 2
# FROM nginx:1.16-0-alpine as prod-stage
# COPY --from=build-step /app/dist/angular-swarm /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx","-g","daemon off;"]