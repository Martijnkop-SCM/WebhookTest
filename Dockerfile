# --------------------
# Base stage
# --------------------
FROM node:20-alpine AS base
WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

# --------------------
# Development stage
# --------------------
FROM base AS development
COPY . .
CMD ["npm", "start"]

# --------------------
# Production stage
# --------------------
FROM node:20-alpine AS production
WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

COPY src ./src

EXPOSE 3000
CMD ["node", "src/index.js"]