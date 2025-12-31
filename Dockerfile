FROM node:20-alpine

WORKDIR /app

# Install dependencies first (better cache)
COPY package*.json ./
RUN npm ci --only=production

# Copy app source
COPY . .

# Set environment
ENV NODE_ENV=production

EXPOSE 5000

CMD ["node", "src/server.js"]
