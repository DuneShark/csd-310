"""
    Title: show_tables.py
    Author: Group 2
    Date: 8 July 2022
    Description: Outdoors Database show tables script.
"""

import mysql.connector
from mysql.connector import errorcode

#variable to has sql connection info
config = {
    "user": "outdoors_user",
    "password": "nature",
    "host": "127.0.0.1",
    "database": "outdoors",
    "raise_on_warnings": True
}
#connects to the database
try:
    db = mysql.connector.connect(**config)
    print("\n Database user {} connected to MySQL on host {} with database {}".format(config["user"], config["host"], config["database"]))

    input("\n\n Press any key to continue...")

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("   The supplied username or password are invalid")

    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("  The specified database does not exist")

    else:
        print(err)

#finally:
#    db.close()

#Displays Guide query
cursor = db.cursor()
cursor.execute("SELECT guide_ID, firstName, lastName FROM guides;")
guideColumns = cursor.fetchall()
print("-- DISPLAYING Guide RECORDS -- \n")
for guideColumns in guideColumns:
    print("Guide ID: {}\n First Name: {}\n Last Name: {}\n".format(guideColumns[0], guideColumns[1], guideColumns[2]))

#Displays Location query
cursor = db.cursor()
cursor.execute("SELECT location_id, location_name, requiresVisa, requiresImmunization FROM locations;")
locationColumns = cursor.fetchall()
print("-- DISPLAYING Location RECORDS -- \n")
for locationColumns in locationColumns:
     print("Locale ID: {}\n Location: {}\n Visa: {}\n Immunization: {} \n".format(locationColumns[0], locationColumns[1],locationColumns[2],locationColumns[3]))

#Displays Trip query
cursor = db.cursor()
cursor.execute("SELECT trip_id, location_id, guide_id, startDate, endDate FROM trips;")
tripColumns = cursor.fetchall()
print("-- DISPLAYING Trip RECORDS -- \n")
for tripColumns in tripColumns:
    print("Trip ID: {}\n Locale ID: {}\n Guide ID: {}\n Start Date: {}\n End Date: {}\n".format(tripColumns[0], tripColumns[1], tripColumns[2], tripColumns[3], tripColumns[4]))

#Displays Booking query
cursor = db.cursor()
cursor.execute("SELECT booking_id, trip_id, client_id, airfare FROM bookings;")
bookingColumns = cursor.fetchall()
print("-- DISPLAYING Booking RECORDS -- \n")
for bookingColumns in bookingColumns:
    print("Booking ID: {}\n Trip ID: {}\n Client ID: {}\n Airfare: {}\n".format(bookingColumns[0], bookingColumns[1], bookingColumns[2], bookingColumns[3]))

#Displays Client query
cursor = db.cursor()
cursor.execute("SELECT client_id, firstName, lastName, email FROM clients;")
clientColumns = cursor.fetchall()
print("-- DISPLAYING Client RECORDS -- \n")
for clientColumns in clientColumns:
    print("Client ID: {}\n First Name: {}\n Last Name: {}\n Email: {}\n".format(clientColumns[0], clientColumns[1], clientColumns[2], clientColumns[3]))

#Displays Rental query
cursor = db.cursor()
cursor.execute("SELECT rental_id, equipment_id, rentalStart, rentalEnd, client_id FROM rentals;")
rentalColumns = cursor.fetchall()
print("-- DISPLAYING Rental RECORDS -- \n")
for rentalColumns in rentalColumns:
    print("Rental ID: {}\n Equipment: {}\n Rental Start: {}\n client ID: {}\n".format(rentalColumns[0], rentalColumns[1], rentalColumns[2], rentalColumns[3], rentalColumns[4]))

#Displays Equipment query
cursor = db.cursor()
cursor.execute("SELECT equipment_id, description, inventoryDate, purchaseFlag, purchaseDate FROM equipment;")
equipmentColumns = cursor.fetchall()
print("-- DISPLAYING Equipment RECORDS -- \n")
for equipmentColumns in equipmentColumns:
    print("Equipment ID: {}\n Description: {}\n Inventory Date: {}\n Purchase Flag: {}\n Purchase Date: {} \n".format(equipmentColumns[0], equipmentColumns[1], equipmentColumns[2], equipmentColumns[3], equipmentColumns[4]))



db.close


# Template for displaying SQL queries
"""cursor = db.cursor()
cursor.execute(“SELECT f_name, l_name, email FROM employee”) -- selecting three fields
employees = cursor.fetchall()
for employee in employee:
print(“First Name: {}\n Last Name:{}\n Email:{}\n”.format(employee[0], employee[1], employee[2])) -- three fields"""