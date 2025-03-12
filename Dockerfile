# Use the official Node.js base image
FROM node:22-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies first
COPY package.json package-lock.json ./

# Install only production dependencies
RUN npm install --only=production

# Copy the rest of the application code
COPY . .

# Expose port 5000 (same as the Node.js server)
EXPOSE 5000

# Command to run the application
CMD ["node", "server.js"]
