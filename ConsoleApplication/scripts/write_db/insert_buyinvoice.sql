create or replace function insert_buyinvoice(p_id uuid, p_buydate timestamp without time zone, p_code integer, p_sellername character varying) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO "BuyInvoice" ("Id", "BuyDate", "Code", "SellerName")
    VALUES (p_id, p_buydate, p_code, p_sellername);
END;
$$;


