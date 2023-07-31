# Build with NODE
#FROM node:16.18.1 as build
#WORKDIR /app
#COPY ./ ./
#RUN npm install --force
#RUN npm run build

# Deploy no NGINX
FROM nginx:1.23.2
COPY build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
