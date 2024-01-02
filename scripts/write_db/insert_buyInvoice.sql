CREATE OR REPLACE FUNCTION insert_buyInvoice(
    p_id uuid,
    p_buydate timestamp,
    p_code integer,
    p_sellername varchar(255)
)
RETURNS void AS
$$
BEGIN
    INSERT INTO "BuyInvoice" ("Id", "BuyDate", "Code", "SellerName")
    VALUES (p_id, p_buydate, p_code, p_sellername);
END;
$$
LANGUAGE plpgsql;
