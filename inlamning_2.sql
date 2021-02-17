Skapa databas bank account
skapa en tabell locations och bank acoounts med data I som vi fick I inlämning 1 I data basen


för att använda databasen bank account
use bank_account;

Skapa locations tabell 
CREATE TABLE locations (id INT PRIMARY KEY AUTO_INCREMENT, 
country VARCHAR (100), 
address VARCHAR (100));


lägga data I location tabellen
insert into locations ( id, country, address ) values (1,"SE" ,"Vimmerbygatan 20");
+----+---------+------------------+
| id | country | address          |
+----+---------+------------------+
|  1 | SE      | Vimmerbygatan 20 |
|  2 | US      | Asteroid road 5  |
|  3 | US      | Comet road 41    |
|  4 | SE      | Brunnsgatan 7    |
+----+---------+------------------+


nu måste jag koppla  Corbin Hauck till brunnsgatan 7 
först vill jag se om Corban finns I databasen och vad har han för id
select * from bank_accounts where first_name = "Corbin";

+----+------------+-----------+---------+
| id | first_name | last_name | holding |
+----+------------+-----------+---------+
| 55 | Corbin     | Hauck     |  449092 |
+----+------------+-----------+---------+
+----+------------+-----------+---------+
| id | first_name | last_name | holding |
+----+------------+-----------+---------+
| 89 | Vanya      | Worsell   |  330641 |
+----+------------+-----------+---------+
+-----+------------+-----------+---------+
| id  | first_name | last_name | holding |
+-----+------------+-----------+---------+
| 174 | Eldon      | McCartan  |   75096 |
+-----+------------+-----------+---------+
+-----+------------+-------------+---------+
| id  | first_name | last_name   | holding |
+-----+------------+-------------+---------+
| 170 | Ingunna    | Castellucci |  471372 |
+-----+------------+-------------+---------+


skapa en relation tabell som innehåller location id och bank-konto id 
CREATE TABLE home ( locations_id int NOT NULL, 
bank_account_id int NOT NULL, 
FOREIGN KEY (locations_id) REFERENCES locations(id), 
FOREIGN KEY (bank_account_id) REFERENCES bank_accounts(id));




Jag lägger location id och bank account id I tabellen home
insert into home (locations_id, bank_account_id) values (4,55);
insert into home (locations_id, bank_account_id) values (2,89);
insert into home (locations_id, bank_account_id) values (1,174);
insert into home (locations_id, bank_account_id) values (3,170);



SELECT * FROM home,bank_accounts WHERE home.bank_account_id = bank_accounts.id; 

+--------------+-----------------+-----+------------+-------------+---------+
| locations_id | bank_account_id | id  | first_name | last_name   | holding |
+--------------+-----------------+-----+------------+-------------+---------+
|            4 |              55 |  55 |   Corbin   | Hauck       |  449092 |
|            2 |              89 |  89 | Vanya      | Worsell     |  330641 |
|            1 |             174 | 174 | Eldon      | McCartan    |   75096 |
|            3 |             170 | 170 | Ingunna    | Castellucci |  471372 |
+--------------+-----------------+-----+------------+-------------+---------+

För att få reda på namnet och adressen istället för att se id nummret 
SELECT first_name,address,country FROM home 
JOIN bank_accounts ON bank_accounts.id=home.bank_account_id 
JOIN locations ON locations.id=home.locations_id;
+------------+------------------+---------+
| first_name | address          | country |
+------------+------------------+---------+
| Eldon      | Vimmerbygatan 20 | SE      |
| Vanya      | Asteroid road 5  | US      |
| Ingunna    | Comet road 41    | US      |
| Corbin     | Brunnsgatan 7    | SE      |
+------------+------------------+---------+

Alla bank konto som är kopplad till SE 
select first_name,address,country from home 
join bank_accounts ON bank_accounts.id=home.bank_account_id 
join locations ON locations.id=home.locations_id 
where country="SE";
+------------+------------------+---------+
| first_name | address          | country |
+------------+------------------+---------+
| Eldon      | Vimmerbygatan 20 | SE      |
| Corbin     | Brunnsgatan 7    | SE      |
+------------+------------------+---------+


________________________________________________________________________________________
MysQl

Create 
    
    Create TABLE students (
        id INT PRIMARY KEY AUTO_INCREMENT,
        first_name VARCHAR(100),
        last_name VARCHAR(100)
    );

    INSERT INTO students (first_name, last_name) VALUES ("Rammy", "Mansour");

Read 

    SELECT * FROM students;

UPDATE

    UPDATE students SET last_name ="Andersson" WHERE id=1;

DELETE

    DELETE FROM students WHERE id=1;

________________________________________________________________________________________
MongoDB

Create

    db.students.insertOne({ first_name: "Rammy", last_name: "Mansour"})

Read 

    db.students.find().pretty()

UPDATE

    db.students.update(
    {
        _id : ObjectId("602cf934a7984a2b35ca54d0")
        },
    {
        $set: {last_name :"Andersson"}
        }
)
DELETE

    db.students.deleteOne({"_id" : ObjectId("602cf934a7984a2b35ca54d0")})

________________________________________________________________________________________

1. Vad är motsvarigheten i MongoDB till en foreign key? 


2. Vad är motsvarigheten till en SELECT i MongoDB? 

3. Hur hade du löst del 2 och 3 i MongoDB? (du behöver inte göra en komplett lösning, men beskriv på ett ungefär hur du hade gjort) 

4. Vad behöver du för information för att kunna logga in i någon annans databas? 

5. Varför skulle man vilja använda sig utav en databas? 

6. Nämn några andra ställen / situationer utöver databaser som CRUD används 
