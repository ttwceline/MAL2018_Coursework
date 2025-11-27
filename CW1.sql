/*BSCS2509249 MAL2018 CW1*/
/*1) CREATE A DATABASE NAMED "TrailDB"*/

IF DB_ID('TrailDB') IS NOT NULL 

BEGIN 

    ALTER DATABASE TrailDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE; 

    DROP DATABASE TrailDB; 

END 

GO 

CREATE DATABASE TrailDB; 

GO 

USE TrailDB; 

GO 

/*2) CREATE SCHEMA "CW1" IN "TrailDB"*/

CREATE SCHEMA CW1;


/*3) CREATE TABLES IN SCHEMA "CW1" IN "TrailDB"*/

CREATE TABLE CW1.Users(
    user_id INT IDENTITY(1, 1) PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(200) NOT NULL UNIQUE,
    user_password VARCHAR(200) NOT NULL
);

CREATE TABLE CW1.Geographical_Info(
    geographical_id INT IDENTITY(1, 1) PRIMARY KEY,
    trail_longitude FLOAT NOT NULL,
    trail_latitude FLOAT NOT NULL
);

CREATE TABLE CW1.Trail_Location(
    location_id INT IDENTITY(1,1) PRIMARY KEY,
    geographical_id INT,
    location_name VARCHAR(150) NOT NULL,
    country VARCHAR(150) NOT NULL,
    state VARCHAR(150) NOT NULL,
    city VARCHAR(150) NOT NULL,
    FOREIGN KEY (geographical_id) REFERENCES CW1.Geographical_Info(geographical_id)
);

CREATE TABLE CW1.Trail(
    trail_id INT IDENTITY(1, 1) PRIMARY KEY,
    location_id INT NOT NULL,
    user_id INT NOT NULL,
    estimated_time_min TIME NOT NULL,
    estimated_time_max TIME NOT NULL,
    route_type VARCHAR(60) NOT NULL,
    difficulty VARCHAR(60) NOT NULL,
    trail_name VARCHAR(100) NOT NULL,
    elevation_gain INT NOT NULL,
    length DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (location_id) REFERENCES CW1.Trail_Location(location_id),
    FOREIGN KEY (user_id) REFERENCES CW1.Users(user_id)
);

CREATE TABLE CW1.Sights(
    sights_id INT IDENTITY(1, 1) PRIMARY KEY,
    top_sight_name VARCHAR(100) NOT NULL
);

CREATE TABLE CW1.Trail_Sights(
    sights_id INT NOT NULL,
    trail_id INT NOT NULL,
    PRIMARY KEY (sights_id, trail_id),
    FOREIGN KEY (sights_id) REFERENCES CW1.Sights(sights_id) ON DELETE CASCADE,
    FOREIGN KEY (trail_id) REFERENCES CW1.Trail(trail_id) ON DELETE CASCADE
);

CREATE TABLE CW1.Rating(
    rating_id INT IDENTITY(1, 1) PRIMARY KEY,
    user_id INT NOT NULL,
    trail_id INT NOT NULL,
    review_text VARCHAR(8000) NOT NULL,
    star_rating INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES CW1.Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (trail_id) REFERENCES CW1.Trail(trail_id) ON DELETE CASCADE
);

