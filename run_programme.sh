#!/bin/bash

# Variables
MYSQL_USER="root"
MYSQL_PASSWORD="root"
DB_URL="jdbc:mysql://localhost:3306/LibraryDB"
JDBC_DRIVER="mysql-connector-java-8.0.xx.jar"  # Update with the exact version of the MySQL connector

# Check if JDBC driver exists
if [ ! -f "$JDBC_DRIVER" ]; then
    echo "MySQL JDBC Driver not found! Please download it from https://dev.mysql.com/downloads/connector/j/ and place it in the same directory as this script."
    exit 1
fi

# Compile Java code
echo "Compiling Java program..."
javac -cp .:$JDBC_DRIVER LibraryDatabaseSetup.java

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo "Compilation successful."
else
    echo "Compilation failed. Please check for errors in the code."
    exit 1
fi

# Run the Java program
echo "Running Library Management Program..."
java -cp .:$JDBC_DRIVER LibraryDatabaseSetup "$DB_URL" "$MYSQL_USER" "$MYSQL_PASSWORD"
