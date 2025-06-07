# Stage 1: Build the React/Node app
FROM node:alpine AS builder

WORKDIR /app

COPY package.json ./
RUN npm install

COPY . ./
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy built files from builder to Nginx HTML folder
COPY --from=builder /app/build /usr/share/nginx/html

# (Optional) Copy custom Nginx config if you have one
# COPY nginx.conf /etc/nginx/conf.d/default.conf
