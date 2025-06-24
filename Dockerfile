# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Prisma generate (tạo client trước khi build)
RUN npx prisma generate

# Build NestJS
RUN npm run build

# Runtime: deploy migration rồi start app
CMD ["sh", "-c", "npx prisma migrate deploy && node dist/main"]
