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

CREATE TABLE CW1.AppUser(
    user_id INT PRIMARY KEY,
    user_name VARCHAR(60),
    user_email VARCHAR(60) NOT NULL UNIQUE,
    user_password VARCHAR(60) NOT NULL
);

CREATE TABLE CW1.Location(
    location_id INT,
    country VARCHAR(40) NOT NULL,
    state VARCHAR(40) NOT NULL,
    city VARCHAR(40) NOT NULL
);

CREATE TABLE CW1.Trail(
    trail_id INT PRIMARY KEY,
    location_id INT,
    trail_name VARCHAR(60) NOT NULL,
    length INT NOT NULL,
    elevation_gain VARCHAR(60) NOT NULL,
    estimated_time_min TIME NOT NULL,
    estimated_time_max TIME NOT NULL,
    route_type VARCHAR(60) NOT NULL,
    difficulty VARCHAR(60) NOT NULL
);

CREATE TABLE CW1.TrailFeatures(
    feature_id INT PRIMARY KEY,
    trail_id INT,
    feature_name VARCHAR(60) NOT NULL
);

CREATE TABLE CW1.TrailSights(
    sights_id INT PRIMARY KEY,
    trail_id INT,
    top_sight_name VARCHAR(60) NOT NULL
);

CREATE TABLE CW1.TrailSpecifications(
    trail_info_id INT PRIMARY KEY,
    trail_id INT,
    trail_info VARCHAR(60) NOT NULL
);

CREATE TABLE CW1.Features(
    feature_id INT PRIMARY KEY,
    feature_name VARCHAR(60) NOT NULL
);

CREATE TABLE CW1.Sights(
    sights_id INT PRIMARY KEY,
    top_sight_name VARCHAR(60) NOT NULL
);

CREATE TABLE CW1.Specifications(
    trail_info_id INT PRIMARY KEY,
    trail_info VARCHAR(60) NOT NULL
);

/*3) ALTER IN MISSING FOREIGN AND PRIMARY KEY CONTRAINTS*/

ALTER TABLE CW1.Location
ADD CONSTRAINT PK_Location_ID PRIMARY KEY (location_id);
ALTER TABLE CW1.Trail
ADD CONSTRAINT FK_Trail_Location FOREIGN KEY (location_id) REFERENCES CW1.Location (location_id);


ALTER TABLE CW1.TrailFeatures
ADD CONSTRAINT FK_Feature_ID FOREIGN KEY (feature_id) REFERENCES CW1.Features(feature_id);
ALTER TABLE CW1.TrailFeatures
ADD CONSTRAINT FK_Trail_ID FOREIGN KEY (trail_id) REFERENCES CW1.Trail(trail_id);


ALTER TABLE CW1.TrailSights
ADD CONSTRAINT FK_Sights_ID FOREIGN KEY (sights_id) REFERENCES CW1.Sights(sights_id);
ALTER TABLE CW1.TrailSights
ADD CONSTRAINT FK_Trail_ID FOREIGN KEY (trail_id) REFERENCES CW1.Trail(trail_id);

ALTER TABLE CW1.TrailSpecifications
ADD CONSTRAINT FK_Specifications_ID FOREIGN KEY (trail_info_id) REFERENCES CW1.TrailSpecifications(trail_info_id);
ALTER TABLE CW1.TrailSpecifications
ADD CONSTRAINT FK_Trail_ID FOREIGN KEY (trail_id) REFERENCES CW1.Trail(trail_id);




