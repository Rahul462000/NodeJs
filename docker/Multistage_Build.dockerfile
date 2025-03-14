# 1️⃣ First stage: Build the application
FROM node:22-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install --only=production

# Copy the rest of the application files
COPY . .

# 2️⃣ Second stage: Run the application with a Distroless image
FROM gcr.io/distroless/nodejs22-debian12

# Set working directory
WORKDIR /app

# Copy only the necessary built files from the builder stage
COPY --from=builder /app /app

# Expose the application port
EXPOSE 5000

# Command to run the app
CMD ["server.js"]
