FROM node:20.8.1-alpine3.18 AS builder
WORKDIR /app
ADD package.json .
ADD package-lock.json .
RUN npm install
ADD src/ src/
RUN npm run css

FROM nginx:1.25 AS runtime
RUN mkdir /usr/share/nginx/html/style
COPY --from=builder /app/dist/ /usr/share/nginx/html/style/
