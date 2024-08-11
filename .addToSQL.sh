#!/bin/bash

# Check if correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username> <password>"
    exit 1
fi

# MySQL credentials
username=$1
password=$2

# MySQL commands
mysql_cmd="mysql -u$username -p$password hbnb_dev_db"

# Create tables
$tables_script="
CREATE TABLE IF NOT EXISTS amenities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    state_id INT,
    FOREIGN KEY (state_id) REFERENCES states(id)
);

CREATE TABLE IF NOT EXISTS documentation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS places (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES cities(id)
);

CREATE TABLE IF NOT EXISTS places_amenities (
    place_id INT,
    amenity_id INT,
    PRIMARY KEY (place_id, amenity_id),
    FOREIGN KEY (place_id) REFERENCES places(id),
    FOREIGN KEY (amenity_id) REFERENCES amenities(id)
);

CREATE TABLE IF NOT EXISTS places_reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    place_id INT,
    user_id INT,
    content TEXT NOT NULL,
    FOREIGN KEY (place_id) REFERENCES places(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS states (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);
"

# Execute tables creation script
echo "$tables_script" | $mysql_cmd

# Insert sample data
$insert_data_script="
INSERT INTO amenities (name) VALUES ('Wifi'), ('Kitchen'), ('Parking');
INSERT INTO cities (name, state_id) VALUES ('San Francisco', 1), ('Los Angeles', 2);
INSERT INTO documentation (content) VALUES ('Sample documentation content');
INSERT INTO places (name, city_id) VALUES ('Cozy Cottage', 1), ('Luxury Condo', 2);
INSERT INTO places_amenities (place_id, amenity_id) VALUES (1, 1), (1, 2), (2, 3);
INSERT INTO places_reviews (place_id, user_id, content) VALUES (1, 1, 'Great place!'), (2, 2, 'Amazing view!');
INSERT INTO states (name) VALUES ('California'), ('New York');
INSERT INTO users (username, password) VALUES ('$username', '$password');
"

# Execute data insertion script
echo "$insert_data_script" | $mysql_cmd

echo "Tables and sample data added successfully!"
