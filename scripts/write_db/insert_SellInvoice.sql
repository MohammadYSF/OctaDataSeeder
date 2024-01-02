CREATE OR REPLACE FUNCTION insert_SellInvoice(
    p_id uuid,
    p_create_date timestamp,
    p_code integer,
    p_customer uuid,
    p_vehicle uuid,
    p_use_buy_price boolean,
    p_discount bigint,
    p_description text
)
RETURNS void AS
$$
BEGIN
    INSERT INTO "SellInvoices" ("Id", "CreateDate", "Code", "Customer", "Vehicle", "UseBuyPrice", "Discount", "Description")
    VALUES (p_id, p_create_date, p_code, p_customer, p_vehicle, p_use_buy_price, p_discount, p_description);
END;
$$
LANGUAGE plpgsql;
