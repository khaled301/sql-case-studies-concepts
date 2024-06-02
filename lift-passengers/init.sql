USE sql_pp;

DROP TABLE IF EXISTS lifts;

CREATE TABLE lifts (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	capacity_kg INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO lifts (id, capacity_kg) VALUES (1, 300);
INSERT INTO lifts (id, capacity_kg) VALUES (2, 350);

DROP TABLE IF EXISTS lift_passengers;

CREATE TABLE lift_passengers (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	passenger_name VARCHAR(255) NOT NULL,
	weight_kg INT NOT NULL,
	lift_id INT NOT NULL,
	created_at TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY (lift_id) REFERENCES lifts(id) ON DELETE CASCADE
);

INSERT INTO lift_passengers (id, passenger_name, weight_kg, lift_id) VALUES (1, "Rahul", 85, 1);
INSERT INTO lift_passengers (id, passenger_name, weight_kg, lift_id) VALUES (2, "Adarsh", 73, 1);
INSERT INTO lift_passengers (id, passenger_name, weight_kg, lift_id) VALUES (3, "Riti", 95, 1);
INSERT INTO lift_passengers (id, passenger_name, weight_kg, lift_id) VALUES (4, "Dheeraj", 80, 1);
INSERT INTO lift_passengers (id, passenger_name, weight_kg, lift_id) VALUES (5, "Vimal", 83, 2);
INSERT INTO lift_passengers (id, passenger_name, weight_kg, lift_id) VALUES (6, "Neha", 77, 2);
INSERT INTO lift_passengers (id, passenger_name, weight_kg, lift_id) VALUES (7, "Priti", 73, 2);
INSERT INTO lift_passengers (id, passenger_name, weight_kg, lift_id) VALUES (8, "Himanshi", 85, 2);
