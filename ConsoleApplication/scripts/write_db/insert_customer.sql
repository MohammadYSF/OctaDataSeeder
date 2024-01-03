create or replace function insert_customer(p_id uuid, p_code integer, p_first_name character varying, p_last_name character varying, p_phone_number character varying, p_vehicles text) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO "Customer" ("Id", "Code", "FirstName", "LastName", "PhoneNumber", "Vehicles")
    VALUES (p_id, p_code, p_first_name, p_last_name, p_phone_number, p_vehicles);
END;
$$;


