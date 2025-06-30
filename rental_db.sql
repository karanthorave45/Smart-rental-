CREATE DATABASE rental;
USE rental;

CREATE TABLE rentals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `from` VARCHAR(50),
    `to` VARCHAR(50),
    amount DECIMAL(10,2)
);
