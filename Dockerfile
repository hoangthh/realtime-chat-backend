FROM node:18-alpineMore actions

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all source code
COPY . .

# 👇 Generate Prisma client
RUN npx prisma generate

# 👇 Build NestJS app
RUN npm run build

# 👇 Run migrations at runtime + start
CMD ["sh", "-c", "npx prisma migrate deploy && node dist/main"]
