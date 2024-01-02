create or replace function insert_service(p_id uuid, p_name text, p_code integer, p_default_price bigint DEFAULT 0, p_default_price_history text DEFAULT ''::text) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO "Services" ("Id", "Name", "Code", "DefaultPrice", "DefaultPricecHistory")
    VALUES (p_id, p_name, p_code, p_default_price, p_default_price_history);
END;
$$;

alter function insert_service(uuid, text, integer, bigint, text) owner to octauser;

