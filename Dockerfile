
FROM node:16

# Set the working directory
WORKDIR /app

RUN npm install -g expo-cli
# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm  build

# Expose port 19000 (or the port your app is configured to listen on)
EXPOSE 19000

# Start your Node.js server (assuming it serves the React app)  
CMD ["expo", "start", "--tunnel"]