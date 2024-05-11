USE test_database

BEGIN TRANSACTION;

-- Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL, -- hashed passwords for security
    Email VARCHAR(100) NOT NULL,
    -- Add other user details as needed
);

-- Collections table
CREATE TABLE Collections (
    CollectionID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    CollectionName VARCHAR(100) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
    -- Add other collection details as needed
);

-- Cards table
-- Cards table
CREATE TABLE Cards (
    CardID INT PRIMARY KEY IDENTITY(1,1),
    CardName VARCHAR(100) NOT NULL,
    SetName VARCHAR(100) NOT NULL,
    CardType VARCHAR(50) NOT NULL,
	CreatureType VARCHAR(75) NOT NULL,
    ManaCost VARCHAR(20) NOT NULL, -- Example: "1RR" for 1 colorless, 2 red
    ConvertedManaCost INT NOT NULL, -- Numeric value of mana cost
    Rarity VARCHAR(20) NOT NULL,
    Artist VARCHAR(100) NOT NULL,
	Effect TEXT NOT NULL,
    FlavorText TEXT NOT NULL,
    Power VARCHAR(10) NOT NULL, -- Example: "3" for a creature with power 3
    Toughness VARCHAR(10) NOT NULL, -- Example: "2" for a creature with toughness 2
    Loyalty INT NOT NULL, -- Planeswalker loyalty value
    IsFoil BIT NOT NULL,
	IsFlipCard BIT NOT NULL, 
	OtherSideId INT NOT NULL
    -- ANdd other card properties as needed
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
-- Cloudfin Raptor
INSERT INTO Cards (Loyalty, CardName, SetName, CardType, CreatureType, ManaCost, ConvertedManaCost, Rarity, Artist, Effect, FlavorText, Power, Toughness, IsFoil, IsFlipCard, OtherSideId)
VALUES 
(0, 'Cloudfin Raptor', 'Gatecrash', 'Creature', 'Bird Mutant', '{U}', 1, 'Common', 'Ryan Barger', 'Flying\nWhenever another creature enters the battlefield under your control, put a +1/+1 counter on Cloudfin Raptor.', 'Flying\nFrom the highest branches\nTo the lowest roots\nThe wind sees nothing\nIt simply follows', '0', '1', 0, 0, 0);

-- Dinosaur Egg
INSERT INTO Cards (Loyalty, CardName, SetName, CardType, CreatureType, ManaCost, ConvertedManaCost, Rarity, Artist, Effect, FlavorText, Power, Toughness, IsFoil, IsFlipCard, OtherSideId)
VALUES 
(0, 'Dinosaur Egg', 'Limited Edition Alpha', 'Creature', 'Egg', '{1}{G}', 2, 'Uncommon', 'Douglas Shuler', 'Whenever Dinosaur Egg is dealt damage, sacrifice it. When Dinosaur Egg dies, create a 3/3 green Dinosaur creature token with trample.', 'Trample\nHatched by a Stegosaurus mother, the little creature has the spiny shell of its parent.', '0', '0', 0, 0, 0);

-- Experiment One
INSERT INTO Cards (Loyalty, CardName, SetName, CardType, CreatureType, ManaCost, ConvertedManaCost, Rarity, Artist, Effect, FlavorText, Power, Toughness, IsFoil, IsFlipCard, OtherSideId)
VALUES 
(0, 'Experiment One', 'Gatecrash', 'Creature', 'Human Ooze', '{G}', 1, 'Rare', 'Johann Bodin', 'Evolve (Whenever a creature enters the battlefield under your control, if that creature has greater power or toughness than this creature, put a +1/+1 counter on this creature.)\nRemove two +1/+1 counters from Experiment One: Regenerate Experiment One.', 'As he incrementally adapted to his surroundings, the power of the Simic''s creations grew at an astonishing rate.', '1', '1', 0, 0, 0);

-- Branching Evolution
INSERT INTO Cards (Loyalty, CardName, SetName, CardType, CreatureType, ManaCost, ConvertedManaCost, Rarity, Artist, Effect, FlavorText, Power, Toughness, IsFoil, IsFlipCard, OtherSideId)
VALUES 
(0, 'Branching Evolution', 'Jumpstart', 'Enchantment', 'None', '{2}{G}', 3, 'Rare', 'Grzegorz Rutkowski', 'If one or more +1/+1 counters would be put on a creature you control, twice that many +1/+1 counters are put on that creature instead.', '"Do not be satisfied with what is,\nwhen there is always more."\n—Momir Vig', '0', '0', 0, 0, 0);

-- Clinging Anemones
INSERT INTO Cards (Loyalty, CardName, SetName, CardType, CreatureType, ManaCost, ConvertedManaCost, Rarity, Artist, Effect, FlavorText, Power, Toughness, IsFoil, IsFlipCard, OtherSideId)
VALUES 
(0, 'Clinging Anemones', 'Invasion', 'Creature', 'Wall', '{3}{U}', 4, 'Common', 'John Avon', 'Defender (This creature can''t attack.)\nWhen Clinging Anemones enters the battlefield, you may return target permanent to its owner''s hand.', 'Suspended in the tide, the anemone opens to consume passing creatures.', '0', '5', 0, 0, 0);

-- Flux Channeller
INSERT INTO Cards (Loyalty, CardName, SetName, CardType, CreatureType, ManaCost, ConvertedManaCost, Rarity, Artist, Effect, FlavorText, Power, Toughness, IsFoil, IsFlipCard, OtherSideId)
VALUES 
(0, 'Flux Channeller', 'Ikoria: Lair of Behemoths', 'Creature', 'Human Wizard', '{2}{U}', 3, 'Uncommon', 'Chris Rallis', 'Whenever you cycle another card, you may pay {1}. If you do, target creature gains flying until end of turn.', '"In the heart of every behemoth lies the soul of a kitten."\n—Dahlya Trul, "The Entropist"', '2', '2', 0, 0, 0);

-- Lonis, Cryptozoologist
INSERT INTO Cards (Loyalty, CardName, SetName, CardType, CreatureType, ManaCost, ConvertedManaCost, Rarity, Artist, Effect, FlavorText, Power, Toughness, IsFoil, IsFlipCard, OtherSideId)
VALUES 
(0, 'Lonis, Cryptozoologist', 'Strixhaven: School of Mages', 'Creature', 'Human Druid', '{2}{G}', 3, 'Rare', 'Ryan Pancoast', 'Whenever you cast an instant or sorcery spell, investigate. (Create a colorless Clue artifact token with "{2}, Sacrifice this artifact: Draw a card.")\nWhenever you sacrifice a Clue, put a +1/+1 counter on Lonis, Cryptozoologist and you gain 3 life.', 'His research often deals with life-forms and mysteries that have eluded naturalists and scholars for centuries.', '2', '3', 0, 0, 0);

-- Master Biomancer
INSERT INTO Cards (Loyalty, CardName, SetName, CardType, CreatureType, ManaCost, ConvertedManaCost, Rarity, Artist, Effect, FlavorText, Power, Toughness, IsFoil, IsFlipCard, OtherSideId)
VALUES 
(0, 'Master Biomancer', 'Gatecrash', 'Creature', 'Elf Wizard', '{2}{G}{U}', 4, 'Mythic Rare', 'Ryan Barger', 'Each other creature you control enters the battlefield with a number of additional +1/+1 counters on it equal to Master Biomancer''s power and as a Mutant in addition to its other types.', '"Nature is a wonderful engineer but works far too slowly for my taste."\n—Momir Vig', '2', '4', 0, 0, 0);

-- Tyranid Prime
INSERT INTO Cards (Loyalty, CardName, SetName, CardType, CreatureType, ManaCost, ConvertedManaCost, Rarity, Artist, Effect, FlavorText, Power, Toughness, IsFoil, IsFlipCard, OtherSideId)
VALUES 
(0, 'Tyranid Prime', 'Warhammer 40,000: Dawn of War', 'Creature', 'Tyranid', '{4}{G}', 5, 'Mythic Rare', 'John Blanche', 'Evolve (Whenever a creature enters the battlefield under your control, if that creature has greater power or toughness than this creature, put a +1/+1 counter on this creature.)\nSynapse Creature — Other creatures you control have evolve.', '"Rally the defenders,\nRelease the war-songs,\nWe will reclaim what is ours\nBy the sting of the Spine!."', '4', '5', 0, 0, 0);


-- Vorel of the Hull Clade
INSERT INTO Cards (Loyalty, CardName, SetName, CardType, CreatureType, ManaCost, ConvertedManaCost, Rarity, Artist, Effect, FlavorText, Power, Toughness, IsFoil, IsFlipCard, OtherSideId)
VALUES 
(0, 'Vorel of the Hull Clade', 'Dragon''s Maze', 'Creature', 'Human Merfolk', '{G}{U}', 2, 'Rare', 'Tyler Jacobson', '{G}{U}, {T}: For each counter on target artifact, creature, or land, put another of those counters on that permanent.', '"I used to hurl rocks and eat scraps of meat\nover a fire.\nLook at what I''ve become\nand tell me Simic does not\nhold infinite possibility."', '1', '4', 0, 0, 0);

COMMIT;