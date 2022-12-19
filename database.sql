DROP TABLE IF EXISTS `VillageBase`;
CREATE TABLE `VillageBase` (
    `VillageID` varchar(20) NOT NULL,
    `SessionPoints` int NOT NULL,
    `Rewards` int NOT NULL,
    PRIMARY KEY(`VillageID`)
);

LOCK TABLES `VillageBase` WRITE;
INSERT INTO `VillageBase` VALUES 
('#PV2PJ8CQ2', '5340', '117'),
('#PYLYG2QY2', '4220', '118'),
('#GOLO2P20P', '3260', '67'),
('#QYQ8CJJGG', '3150', '64'),
('#QPUY28OLP', '1250', '45');
UNLOCK TABLES;

DROP TABLE IF EXISTS `TownHall`;
CREATE TABLE `TownHall` (
    `VillageID` varchar(20) NOT NULL,
    `Level` int NOT NULL,
    `Total_Amount_of_Gold` int,
    `Total_Amount_of_Elixir` int,
    `Total_Amount_of_Dark Elixir` int,
    KEY `VillageID` (`VillageID`),
    CONSTRAINT `TownHall_ibfk_1` FOREIGN KEY (`VillageID`) REFERENCES `VillageBase` (`VillageID`)
);

LOCK TABLES `TownHall` WRITE;
INSERT INTO `TownHall` VALUES 
('#PV2PJ8CQ2', '11','400000', '20000', '1170'),
('#PYLYG2QY2', '10','500000', '50000', '2250'),
('#GOLO2P20P', '10','350000', '5000', '1250'),
('#QYQ8CJJGG', '9','225000', '45000', '3000'),
('#QPUY28OLP', '9','125000', '10000', '550');
UNLOCK TABLES;

DROP TABLE IF EXISTS `MagicItems`;
CREATE TABLE `MagicItems` (
    `Name_of_the_Item` varchar(20) NOT NULL,
    `Max_Number_of_that_Item` int NOT NULL,
    `Effective_Period` varchar(20) NOT NULL,
    PRIMARY KEY(`Name_of_the_Item`)
);

LOCK TABLES `MagicItems` WRITE;
INSERT INTO `MagicItems` VALUES 
('Resource portion', '5', '1 day'),
('Training portion', '5', '1 hour'),
('Hero portion', '5', '1 hour'),
('Power portion', '5', '1 hour'),
('Builder portion', '5', '1 hour');
UNLOCK TABLES;

DROP TABLE IF EXISTS `BuilderHuts`;
CREATE TABLE `BuilderHuts` (
    `Name_of_the_Hut` varchar(20) NOT NULL,
    `Status` varchar(20) NOT NULL,
    `Hitpoints` int NOT NULL,
    PRIMARY KEY (`Name_of_the_Hut`)
);

LOCK TABLES `BuilderHuts` WRITE;
INSERT INTO `BuilderHuts` VALUES 
('Builder Hut 1', 'Sleeping', '250'),
('Builder Hut 2', 'Sleeping', '250'),
('Builder Hut 3', 'Sleeping', '250'),
('Builder Hut 4', 'Sleeping', '250');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Defences`;
CREATE TABLE `Defences` (
    `DefenceName` varchar(20) NOT NULL,
    `AirDefence` varchar(20) NOT NULL,
    `GroundDefence` varchar(20) NOT NULL,
    `Level` int NOT NULL,
    `Range` varchar(20) NOT NULL,
    `Targets` varchar(20) NOT NULL,
    `FavouriteTargets` varchar(20) NOT NULL,
    `Damagepersecond` int NOT NULL,
    `Hitpoints` int NOT NULL,
    PRIMARY KEY(`DefenceName`)
);

LOCK TABLES `Defences` WRITE;
INSERT INTO `Defences` VALUES 
('Archer Tower', 'IS AIR', 'IS GROUND', '10', '10Tiles', 'Any', 'Any', '63', '810'),
('Cannon', 'NOT AIR', 'IS GROUND', '10', '9Tiles', 'Ground', 'Any', '64', '960'),
('Mortor', 'NOT AIR', 'IS GROUND', '6', '4-11Tiles', 'Ground', 'Any', '11', '650'),
('Air Sweeper', 'IS AIR', 'NOT GROUND', '3', '1-15Tiles', 'Air', 'Any', '0', '900'),
('Hidden Tesla', 'IS AIR', 'NOT GROUND', '6', '7Tiles', 'Any', 'Any', '75', '770'),
('Bomb Tower', 'NOT AIR', 'IS GROUND', '2', '6Tiles', 'Ground', 'Any', '28', '700');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Obstacles`;
CREATE TABLE `Obstacles` (
    `Name_of_the_Obstacles` varchar(20) NOT NULL,
    `Number_of_such_Obstacles` varchar(20) NOT NULL,
    `Amount_to_remove_them` int NOT NULL,
    `Type_of_resource` varchar(20) NOT NULL,
    PRIMARY KEY(`Name_of_the_Obstacles`)
);

LOCK TABLES `Obstacles` WRITE;
INSERT INTO `Obstacles` VALUES 
('Stone', '4', '500', 'Gold'),
('Tree', '2', '1000', 'Elixir'),
('Big tree', '1', '10000', 'Elixir'),
('Mushroom', '5', '250', 'Elixir'),
('Bush', '5', '250', 'Elixir');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Traps`;
CREATE TABLE `Traps` (
    `Name_of_the_Trap` varchar(20) NOT NULL, 
    `Number_of_such_Traps` int NOT NULL,
    `Level` int NOT NULL,
    `Favourite_Target` varchar(20) NOT NULL,
    `Trigger_Radius` varchar(20) NOT NULL,
    PRIMARY KEY(`Name_of_the_Trap`)
);

LOCK TABLES `Traps` WRITE;
INSERT INTO `Traps` VALUES 
('Bombs', '6', '5', 'Any', '1.5Tiles'),
('Spring Trap', '6', '3', 'Any', '0.8Tiles'),
('Air Bomb', '4', '3', 'Any', '4Tiles'),
('Skeleton Trap', '2', '2', 'Any', '5Tiles'),
('Giant Bomb', '4', '3', 'Any', '2Tiles');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Barracks`;
CREATE TABLE `Barracks` (
    `Name_of_the_troop` varchar(20) NOT NULL,
    `Level_of_the_troop` int NOT NULL,
    `Favourite_Target` varchar(20) NOT NULL,
    `Movement_Speed` int NOT NULL,
    `Damage_per_second` int NOT NULL,
    `Hitpoints` int NOT NULL,
    PRIMARY KEY(`Name_of_the_troop`)
);

LOCK TABLES `Barracks` WRITE;
INSERT INTO `Barracks` VALUES 
('Barbarian', '6', 'Any', '16', '23', '105'),
('Archer', '6', 'Any', '24', '20','40'),
('Wizard', '6', 'Any', '16', '170', '165'),
('P.E.K.A', '4', 'Any', '16', '320','4000'),
('Valkyrie', '3', 'Any', '24', '106','850'),
('Hog Rider', '4', 'Defences', '24', '92', '430');
UNLOCK TABLES;

DROP TABLE IF EXISTS `SpellFactory`;
CREATE TABLE `SpellFactory` (
    `Name_of_the_spell` varchar(20) NOT NULL,
    `Level` int NOT NULL,
    `BrewingTime` varchar(20) NOT NULL,
    `Target` varchar(20) NOT NULL,
    `HousingSpace` int NOT NULL,
    `TotalDamage` int NOT NULL,
    PRIMARY KEY(`Name_of_the_spell`)
);  

LOCK TABLES `SpellFactory` WRITE;
INSERT INTO `SpellFactory` VALUES 
('Lightning Spell', '5', ' 6M', 'Any', '1', '270'),
('Healing Spell', '5', '12M', 'Any', '2', '1400'),
('Rage Spell', '5', '12M', 'Any', '2', '28'),
('Poison Spell', '2', '3M', 'Any', '1', '115'),
('Earthquake Spell', '2', '3M', 'Any', '1', '17');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Army`;
CREATE TABLE `Army` (
    `Name_of_the_itemorBuilding` varchar(20) NOT NULL,
    `Level` int NOT NULL,
    `Hitpoints` int NOT NULL,
    `Damage_per_second` int NOT NULL,
    `RegenerationTime` varchar(20) NOT NULL,
    `MovementSpeed` int NOT NULL,
    `Target` varchar(20) NOT NULL,
    `FavouriteTarget` varchar(20) NOT NULL,
    PRIMARY KEY(`Name_of_the_itemorBuilding`)
);

LOCK TABLES `Army` WRITE;
INSERT INTO `Army` VALUES 
('Barbarian King', '15', '213', '143', '14M', '16', 'Ground', 'Any'),
('Archer Queen', '2', '740', '164', '10M', '24', 'Any', 'Any'),
('Army Camp', '8', '350', '0', '0', '0', '0', '0');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Resource_Storage_and_Collectors`;
CREATE TABLE `Resource_Storage_and_Collectors` (
    `Type_of_Resource_it_collects` varchar(20) NOT NULL,
    `Type_of_Resource_it_stores` varchar(20) NOT NULL,
    `Storage_capacity` int NOT NULL,
    `Hitpoints_of_storage` int NOT NULL,
    `Level_of_the_storage` int NOT NULL,
    `Level_of_the_collector` int NOT NULL,
    `ProductionRate` int NOT NULL,
    `Capacity_of_collector` int NOT NULL,
    `Hitpoints_of_capacity` int NOT NULL
);

LOCK TABLES `Resource_Storage_and_Collectors` WRITE;
INSERT INTO `Resource_Storage_and_Collectors` VALUES 
('Elixir', 'Elixir', '10000000', '2100', '11', '11', '4200', '2000000', '960'),
('Gold', 'Gold', '10000000', '2100', '11', '11', '4200', '2000000', '960'),
('Dark Elixir', 'Dark Elixir', '10000000', '2100', '11', '11', '4200', '2000000', '960');
UNLOCK TABLES;

DROP TABLE IF EXISTS `ClanCastle`;
CREATE TABLE `ClanCastle` (
    `ClanName` varchar(20) NOT NULL,
    `Level` int NOT NULL,
    `TypeofTreasure` varchar(20) NOT NULL,
    `Amount_of_that_Treasure` int NOT NULL,
    `Status` varchar(20) NOT NULL,
    `Hitpoints` int NOT NULL
);

LOCK TABLES `ClanCastle` WRITE;
INSERT INTO `ClanCastle` VALUES 
('TUMBAGAHIN', '4', 'Gold', '50000', 'Gaurd', '2600'),
('TUMBAGAHIN', '4', 'Elixir', '1000000', 'Gaurd', '2600'),
('TUMBAGAHIN', '4', 'Dark Elixir', '10000', 'Gaurd', '2600');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Lab`;
CREATE TABLE `Lab` (
    `Name_of_the_spell` varchar(20) NOT NULL,
    `Name_of_the_troop` varchar(20) NOT NULL,
    `Current_troop_inder_update` varchar(20) NOT NULL,
    `Level` int NOT NULL,
    `Current_Level_of_the_troop` int NOT NULL,
    `Updated_level_of_the_troop` int NOT NULL,
    `Hitpoints` int NOT NULL,
    `Change_in_level` int NOT NULL,
    KEY `Name_of_the_spell` (`Name_of_the_spell`),
    KEY `Name_of_the_troop` (`Name_of_the_troop`),
    CONSTRAINT `Lab_ibfk_1` FOREIGN KEY (`Name_of_the_troop`) REFERENCES `Barracks` (`Name_of_the_troop`),
    CONSTRAINT `Lab_ibfk_2` FOREIGN KEY (`Name_of_the_spell`) REFERENCES `SpellFactory` (`Name_of_the_spell`)
);

DROP TABLE IF EXISTS `ConsistsOf`;
CREATE TABLE `ConsistsOf` (
    `VillageID` varchar(20) NOT NULL,
    `Name_of_the_Hut` varchar(20) NOT NULL,
    `Name_of_the_itemorBuilding` varchar(20) NOT NULL,
    `Name_of_the_trap` varchar(20) NOT NULL,
    `DefenceName` varchar(20) NOT NULL,
    `Name_of_the_Obstacles` varchar(20) NOT NULL,
    KEY `VillageID` (`VillageID`),
    KEY `Name_of_the_Hut` (`Name_of_the_Hut`),
    KEY `Name_of_the_itemorBuilding` (`Name_of_the_itemorBuilding`),
    KEY `Name_of_the_Trap` (`Name_of_the_Trap`),
    KEY `DefenceName` (`DefenceName`),
    KEY `Name_of_the_Obstacles` (`Name_of_the_Obstacles`),
    CONSTRAINT `ConsistsOf_ibfk_1` FOREIGN KEY (`VillageID`) REFERENCES `VillageBase` (`VillageID`),
    CONSTRAINT `ConsistsOf_ibfk_2` FOREIGN KEY (`Name_of_the_Hut`) REFERENCES `BuilderHuts` (`Name_of_the_Hut`),
    CONSTRAINT `ConsistsOf_ibfk_3` FOREIGN KEY (`Name_of_the_itemorBuilding`) REFERENCES `Army` (`Name_of_the_itemorBuilding`),
    CONSTRAINT `ConsistsOf_ibfk_4` FOREIGN KEY (`Name_of_the_Trap`) REFERENCES `Traps` (`Name_of_the_Trap`),
    CONSTRAINT `ConsistsOf_ibfk_5` FOREIGN KEY (`DefenceName`) REFERENCES `Defences` (`DefenceName`),
    CONSTRAINT `ConsistsOf_ibfk_6` FOREIGN KEY (`Name_of_the_Obstacles`) REFERENCES `Obstacles` (`Name_of_the_Obstacles`)
);

LOCK TABLES `ConsistsOf` WRITE;
INSERT INTO `ConsistsOf` VALUES 
('#PV2PJ8CQ2', 'Builder Hut 1', 'Barbarian King', 'Bombs', 'Archer Tower', 'Stone'),
('#PYLYG2QY2', 'Builder Hut 3', 'Archer Queen', 'Air Bomb', 'Mortor', 'Bush'),
('#GOLO2P20P', 'Builder Hut 4', 'Archer Queen', 'Giant Bomb', 'Bomb Tower', 'Tree');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Containsthe`;
CREATE TABLE `Containsthe` (
    `VillageID` varchar(20) NOT NULL,
    `Name_of_the_Item` varchar(20) NOT NULL,
    KEY `VillageID` (`VillageID`),
    KEY `Name_of_the_Item` (`Name_of_the_Item`),
    CONSTRAINT `Containsthe_ibfk_1` FOREIGN KEY (`VillageID`) REFERENCES `VillageBase` (`VillageID`),
    CONSTRAINT `Containsthe_ibfk_2` FOREIGN KEY (`Name_of_the_Item`) REFERENCES `MagicItems` (`Name_of_the_Item`)
);

LOCK TABLES `Containsthe` WRITE;
INSERT INTO `Containsthe` VALUES 
('#PV2PJ8CQ2', 'Resource portion'),
('#PYLYG2QY2', 'Hero portion'),
('#QYQ8CJJGG', 'Builder portion');
UNLOCK TABLES;

DROP TABLE IF EXISTS `Unlock_the_trooporSpell`;
CREATE TABLE `Unlock_the_trooporSpell` (
    `Name_of_the_spell` varchar(20),
    `Name_of_the_troop` varchar(20),
    `Current_level` int NOT NULL,
    `Updated_level` int NOT NULL,
    KEY `Name_of_the_troop` (`Name_of_the_troop`),
    KEY `Name_of_the_spell` (`Name_of_the_spell`),
    CONSTRAINT `Unlock_the_trooporSpell_ibfk_1` FOREIGN KEY (`Name_of_the_troop`) REFERENCES `Barracks` (`Name_of_the_troop`),
    CONSTRAINT `Unlock_the_trooporSpell_ibfk_2` FOREIGN KEY (`Name_of_the_spell`) REFERENCES `SpellFactory` (`Name_of_the_spell`)
);

LOCK TABLES `Unlock_the_trooporSpell` WRITE;
INSERT INTO `Unlock_the_trooporSpell` VALUES 
('Lightning Spell', NULL, '5', '6'),
(NULL, 'Valkyrie', '3', '4'),
('Rage Spell', NULL, '5', '6');
UNLOCK TABLES;


