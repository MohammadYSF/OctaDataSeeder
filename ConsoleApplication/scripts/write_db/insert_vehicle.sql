create or replace function insert_vehicle(p_id uuid, p_code integer, p_name character varying, p_plate character varying, p_color text) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO "Vehicle" ("Id", "Code", "Name", "Plate", "Color")
    VALUES (p_id, p_code, p_name, p_plate, p_color);
END;
$$;


