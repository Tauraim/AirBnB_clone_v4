-- Create Tables
CREATE TABLE IF NOT EXISTS amenities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
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
    review TEXT NOT NULL,
    FOREIGN KEY (place_id) REFERENCES places(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS states (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL
);

-- Insert Data
INSERT INTO amenities (name) VALUES ('WiFi'), ('Kitchen'), ('Pool');
INSERT INTO cities (name) VALUES ('New York'), ('San Francisco'), ('Los Angeles');
INSERT INTO documentation (content) VALUES ('Lorem ipsum dolor sit amet, consectetur adipiscing elit.');
INSERT INTO places (name, city_id) VALUES ('Cozy Apartment', 1), ('Luxury Villa', 2), ('Beach House', 3);
INSERT INTO places_amenities (place_id, amenity_id) VALUES (1, 1), (1, 2), (2, 3);
INSERT INTO places_reviews (place_id, user_id, review) VALUES (1, 1, 'Great place!'), (2, 2, 'Amazing view!');
INSERT INTO states (name) VALUES ('New York'), ('California'), ('Florida');
INSERT INTO users (username) VALUES ('JohnDoe'), ('JaneSmith');

