### Query 1
## Retrive the number of townhalls with gold > 3000000
From the table TownHall, we get the players with gold greater than 3000000
Uses: We get the players who have more gold, we can use it for clan selection
# SELECT count(*) FROM TownHall WHERE Total_Amount_of_Gold > 300000;

mysql> SELECT count(*) FROM TownHall WHERE Total_Amount_of_Gold > 300000;
+----------+
| count(*) |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)

### Query 2
## Retrive the Army item with max hitpoints
In the table Army, we select the item with max hitpoints
Uses: Enables us to select them or not for a battle
# SELECT Name_of_the_itemorBuilding FROM Army WHERE Hitpoints = (SELECT MAX(Hitpoints) FROM Army);

mysql> SELECT Name_of_the_itemorBuilding FROM Army WHERE Hitpoints = (SELECT MAX(Hitpoints) FROM Army);
+----------------------------+
| Name_of_the_itemorBuilding |
+----------------------------+
| Archer Queen               |
+----------------------------+
1 row in set (0.00 sec)

### Query 3
## Retrive the player with maximum number of Session Points
From the village base table, we get the session points 
Uses: We get the data of the season of the game
# SELECT VillageID FROM VillageBase WHERE Sessionpoints = (SELECT MAX(Sessionpoints) FROM VillageBase);

mysql> SELECT VillageID FROM VillageBase WHERE Sessionpoints = (SELECT MAX(Sessionpoints) FROM VillageBase);
+------------+
| VillageID  |
+------------+
| #PV2PJ8CQ2 |
+------------+
1 row in set (0.00 sec)

### Query 4
## Retrive the number of builders that are free
From the table builder hut, we get the status of the builder
Uses: Enables us the chance to make updates
# SELECT count(*) FROM BuilderHuts WHERE Status = 'Sleeping';

mysql> SELECT count(*) FROM BuilderHuts WHERE Status = 'Sleeping';
+----------+
| count(*) |
+----------+
|        4 |
+----------+
1 row in set (0.00 sec)

### Query 5
## Retrive the number of spells and troops that are unlocked and not yet updated
From the Unlock the troop or spell table we get the data of troops and spells that can be updated
Uses: Enables us with a vision of the further updates
# SELECT count(*) from Unlock_the_trooporSpell where Current_level < Updated_level;

mysql> SELECT count(*) from Unlock_the_trooporSpell where Current_level < Updated_level;
+----------+
| count(*) |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)

### Query 6
## Retrive the players having Resource portion
From the contains the table, players having resource can be obtained
Uses: Can be used to select the friend, so that donation can be done
# SELECT VillageID from Containsthe where Name_of_the_Item = 'Resource portion';

mysql> SELECT VillageID from Containsthe where Name_of_the_Item = 'Resource portion';
+------------+
| VillageID  |
+------------+
| #PV2PJ8CQ2 |
+------------+
1 row in set (0.00 sec)

### Query 7
## Retrive the players info having Barbarian king
From Consists of, we get the players info having Barbarian king
Uses: Enables us to select the opponent.
# SELECT * from ConsistsOf where Name_of_the_itemorBuilding = 'Barbarian King';

mysql> SELECT * from ConsistsOf where Name_of_the_itemorBuilding = 'Barbarian King';
+------------+-----------------+----------------------------+------------------+--------------+-----------------------+
| VillageID  | Name_of_the_Hut | Name_of_the_itemorBuilding | Name_of_the_trap | DefenceName  | Name_of_the_Obstacles |
+------------+-----------------+----------------------------+------------------+--------------+-----------------------+
| #PV2PJ8CQ2 | Builder Hut 1   | Barbarian King             | Bombs            | Archer Tower | Stone                 |
+------------+-----------------+----------------------------+------------------+--------------+-----------------------+
1 row in set (0.00 sec)

### Update 1
## Update the Clan Name, if he changed the clan
Changes the clan name is player wishes to

### Update 2
## Update the resource collector to the next level
We update all the attributes such, corresponding to the level update

### Update 3
## Update the status of the portion
We use the portion, so that entry is deleted from table.


