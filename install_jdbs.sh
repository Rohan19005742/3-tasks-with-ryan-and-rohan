#!/bin/bash

# Download the MySQL JDBC Driver
echo "Downloading MySQL JDBC Driver..."
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.33.zip -O mysql-connector-java.zip

# Unzip the file
echo "Extracting MySQL JDBC Driver..."
unzip mysql-connector-java.zip

# Move the JAR to the current directory
echo "Moving JDBC Driver to current directory..."
mv mysql-connector-java-8.0.33/mysql-connector-java-8.0.33.jar .

# Clean up
echo "Cleaning up..."
rm -rf mysql-connector-java.zip mysql-connector-java-8.0.33/

echo "MySQL JDBC Driver setup complete. You now have mysql-connector-java-8.0.33.jar in the current directory."
