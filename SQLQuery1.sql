USE master
GO

--drop database if it exists
IF DB_ID('mtg_database') IS NOT NULL
BEGIN
	ALTER DATABASE mtg_database SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE mtg_database;
END

CREATE DATABASE mtg_database
GO

USE mtg_database
GO
-- Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL, -- hashed passwords for security
    Email VARCHAR(100) NOT NULL,
    -- Add other user details as needed
);

-- Collections table
CREATE TABLE Collections (
    CollectionID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    CollectionName VARCHAR(100) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
    -- Add other collection details as needed
);

-- Cards table
-- Cards table
CREATE TABLE Cards (
    CardID INT PRIMARY KEY AUTO_INCREMENT,
    CardName VARCHAR(100) NOT NULL,
    SetName VARCHAR(100) NOT NULL,
    CardType VARCHAR(50) NOT NULL,
    ManaCost VARCHAR(20), -- Example: "1RR" for 1 colorless, 2 red
    ConvertedManaCost INT, -- Numeric value of mana cost
    Rarity VARCHAR(20),
    Artist VARCHAR(100),
    FlavorText TEXT,
    Power VARCHAR(10), -- Example: "3" for a creature with power 3
    Toughness VARCHAR(10), -- Example: "2" for a creature with toughness 2
    Loyalty INT, -- Planeswalker loyalty value
    IsFoil BOOLEAN,
    -- Add other card properties as needed
);


-- Collection_Cards table
CREATE TABLE Collection_Cards (
    CollectionID INT,
    CardID INT,
    CardCount INT,
    PRIMARY KEY (CollectionID, CardID), -- Combined primary key to prevent duplicates
    FOREIGN KEY (CollectionID) REFERENCES Collections(CollectionID),
    FOREIGN KEY (CardID) REFERENCES Cards(CardID)
);
