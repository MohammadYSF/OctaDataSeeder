CREATE OR REPLACE FUNCTION insert_Vehicle(
    p_id uuid,
    p_code integer,
    p_name varchar(255),
    p_plate varchar(255),
    p_color text
)
RETURNS void AS
$$
BEGIN
    INSERT INTO "Vehicle" ("Id", "Code", "Name", "Plate", "Color")
    VALUES (p_id, p_code, p_name, p_plate, p_color);
END;
$$
LANGUAGE plpgsql;
