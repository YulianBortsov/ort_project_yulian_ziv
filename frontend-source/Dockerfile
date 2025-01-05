# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the application
RUN npm run build

# Expose the port the app runs on
EXPOSE 3000

# Set the environment variable for the movie catalog service
# ENV MOVIE_CATALOG_SERVICE=http://localhost:8080

# Run the application
CMD ["npm", "start"]

