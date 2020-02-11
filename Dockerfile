FROM node:alpine AS builder

WORKDIR /test-ng-app

COPY . .

RUN npm install && \
    npm run build 

FROM nginx:alpine

COPY --from=builder /test-ng-app/dist/* /usr/share/nginx/html