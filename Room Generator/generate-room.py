import random

insert_room_query = "INSERT INTO `Room`(`Type`, `HID`, `Room#`, `Price`) VALUES "
room_types = ["Suite", "Apartment", "Studio", "Presidential suite", "Deluxe Hotel rooms", "Standard suite rooms", "Penthouse apartment", "Quad Bedroom", "Penthouse suite living room", "Hospitality suite"]

for i in range(1, 4):
    for j in range(1, 50):
        random_room_type = random.choice(room_types)
        price = random.randint(500, 10000)
        insert_room_query += f"('{random_room_type}', {i}, {j}, {price}),"

insert_room_query = insert_room_query.rstrip(',') + ";"

filename = "room_insert_query.txt"

with open(filename, "w") as file:
    file.write(insert_room_query)

print(f"SQL query has been saved to {filename}.")
