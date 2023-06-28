####Building the React application
FROM node:14 AS builder

WORKDIR /app
COPY . .
RUN npm install --quiet

####Building the React app
RUN npm run build

####Creating the final lightweight image
FROM nginx:alpine

#####Building the lightweight image from the building stage
COPY --from=builder /app/build /usr/share/nginx/html

####React app will be running on port 2729
EXPOSE 2729

#####Starting the Nginx server
CMD ["nginx", "-g", "daemon off;"]

