#use Node.js image
FROM node:18
#Create app dir
WORKDIR /app
# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# Expose port and run app
EXPOSE 3000
CMD ["node", "app.js"]
