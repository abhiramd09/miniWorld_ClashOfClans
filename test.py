import subprocess as sp
import pymysql
import pymysql.cursors
from tabulate import tabulate

def option1():
    try:
        sql = "SELECT count(*) FROM TownHall WHERE Total_Amount_of_Gold > 300000;"
        cursor.execute(sql)
        table = cursor.fetchall()
        print("Number of townhalls with gold > 300000")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)

def option2():
    try:
        sql = "SELECT Name_of_the_itemorBuilding FROM Army WHERE Hitpoints = (SELECT MAX(Hitpoints) FROM Army);"
        cursor.execute(sql)
        table = cursor.fetchall()
        print("Army Item With Max Hitpoints")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)

def option3():
    try:
        sql = "SELECT VillageID FROM VillageBase WHERE Sessionpoints = (SELECT MAX(Sessionpoints) FROM VillageBase);"
        cursor.execute(sql)
        table = cursor.fetchall()
        print("Player with maximum number of Session Points")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)

def option4():
    try:
        sql = "SELECT count(*) FROM BuilderHuts WHERE Status = 'Sleeping';"
        cursor.execute(sql)
        table = cursor.fetchall()
        print("Number of builders that are free")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)


def option5():
    try:
        sql = "SELECT count(*) from Unlock_the_trooporSpell where Current_level < Updated_level;"
        cursor.execute(sql)
        table = cursor.fetchall()
        print("Number of spells and troops that are unlocked and not yet updated")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)

def option6():
    try:
        sql = "SELECT VillageID from Containsthe where Name_of_the_Item = 'Builder portion';"
        cursor.execute(sql)
        table = cursor.fetchall()
        print("Players having Resource portion")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)

def option7():
    try:
        sql = "SELECT * from ConsistsOf where Name_of_the_itemorBuilding = 'Barbarian King';"
        cursor.execute(sql)
        table = cursor.fetchall()
        print("Players who have unlocked the Barbarian King")
        print()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    except pymysql.Error as e:
        print(e)
        
def option8():
    print("Update You Clan Name: ")
    print()
    query = """SELECT * FROM ClanCastle"""
    cursor.execute(query)
    table = cursor.fetchall()
    if len(table):
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("No Such Village Found")
        return

    res = input("Are you sure you want to update the above entry? [y/n] ")
    if res == "y" or res == "Y":
        newName = input("New Clan Name: ")
        try:
            query = """UPDATE ClanCastle SET `ClanName` = %s"""
            cursor.execute(query, (newName))
            con.commit()
        except Exception as e:
            print("Unable to update. Potentially invalid type for 'ClanName'")
            return
        print("Updated the requested entry. Updated entry looks like: ")
        query = """SELECT * FROM ClanCastle"""
        cursor.execute(query)
        table = cursor.fetchall()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("Aborted Update.")
    return

def option9():
    print("Update Resource Collector and Storage: ")
    print()
    Res_Type = input("Enter The Type of Resource: ")
    query = """SELECT * FROM Resource_Storage_and_Collectors WHERE `Type_of_Resource_it_collects` = %s;"""
    cursor.execute(query, (Res_Type))
    table = cursor.fetchall()
    if len(table):
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("No player found for this Player_ID")
        return

    res = input("Are you sure you want to update the above entry? [y/n] ")
    if res == "y" or res == "Y":
        NewLevel = input("New Level is: ")
        try:
            query = """UPDATE Resource_Storage_and_Collectors SET `Level_of_the_storage` = %s WHERE `Type_of_Resource_it_stores` = %s"""
            cursor.execute(query, (NewLevel, Res_Type))
            query = """UPDATE Resource_Storage_and_Collectors SET `Level_of_the_collector` = %s WHERE `Type_of_Resource_it_collects` = %s"""
            cursor.execute(query, (NewLevel, Res_Type))
            con.commit()
        except Exception as e:
            print("Unable to update. Potentially invalid type for 'Number of matches'")
            return
        print("Updated the requested entry. Updated entry looks like: ")
        query = """SELECT * FROM Resource_Storage_and_Collectors WHERE `Type_of_Resource_it_collects` = %s;"""
        cursor.execute(query, (Res_Type))
        table = cursor.fetchall()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("Aborted Update.")
    return

def option10():
    print("Use the portion: ")
    print()
    Player_ID = input("Village_ID: ")
    query = """SELECT * FROM Containsthe WHERE `VillageID` = %s;"""
    cursor.execute(query, (Player_ID))
    table = cursor.fetchall()
    if len(table):
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("No Village found for this VillageID")
        return

    res = input("Are you sure you want to update the above entry? [y/n] ")
    if res == "y" or res == "Y":
        portion = input("Enter the portion to use: ")
        try:
            query = """DELETE FROM Containsthe WHERE `Name_of_the_Item` = %s AND `VillageID` = %s;"""
            cursor.execute(query, (portion, Player_ID))
            con.commit()
        except Exception as e:
            print("Unable to update. Potentially invalid type for 'Portion'")
            return
        print("Updated the requested entry. Updated entry looks like: ")
        query = """SELECT * FROM Containsthe;"""
        cursor.execute(query)
        table = cursor.fetchall()
        print(tabulate(table, headers="keys", tablefmt='psql'))
    else:
        print("Aborted Update.")
    return

def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        option1()
    elif(ch == 2):
        option2()
    elif(ch == 3):
        option3()
    elif(ch == 4):
        option4()
    elif(ch == 5):
        option5()
    elif(ch == 6):
        option6()
    elif(ch == 7):
        option7()
    elif(ch == 8):
        option8()
    elif(ch == 9):
        option9()
    elif(ch == 10):
        option10()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # # Can be skipped if you want to hardcode username and password
    # username = input("Username: ")
    # password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="<username>",
                              password="<password>",
                              db='project_final',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cursor:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Here taking example of Employee Mini-world
                print("1. Option 1")  # Number of townhalls with gold > 300000
                print("2. Option 2")  # Army Item With Max Hitpoints
                print("3. Option 3")  # Player with maximum number of Session Points
                print("4. Option 4")  # Number of builders that are free
                print("5. Option 5")  # Number of spells and troops that are unlocked and not yet updated
                print("6. Option 6")  # Players having Resource portion
                print("7. Option 7")  # Players who have unlocked the Barbarian King
                print("8. Option 8")  # Update the Clan Name, if he changed the clan
                print("9. Option 9")  # Update the resource collector to the next level
                print("10. Option 10")  # Update the status of the portion
                print("11. Press 11 to Quit") 
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 11:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")
