CREATE OR REPLACE FUNCTION insert_customerRM_proc(
    p_id UUID,
    p_customer_id UUID,
    p_first_name VARCHAR,
    p_last_name VARCHAR,
    p_customer_code VARCHAR,
    p_phone_number VARCHAR
)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO "CustomerRMs" ("Id", "CustomerId", "CustomerFirstName", "CustomerLastName", "CustomerCode", "CustomerPhoneNumber")
    VALUES (p_id, p_customer_id, p_first_name, p_last_name, p_customer_code, p_phone_number);
END;
$$
LANGUAGE plpgsql;

-- SELECT insert_customerRM_proc(
--     '85aeed9f-f7fb-43c8-a201-0388821d82b9',
--     '829b930f-d174-40ed-806d-384d9729bcdd',
--     'John',
--     'Doe',
--     'customer_code_value',
--     '123456789'
-- );