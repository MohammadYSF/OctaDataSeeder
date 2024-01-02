CREATE OR REPLACE FUNCTION insert_buyInvoiceRM_proc(
    p_id UUID,
    p_buy_invoice_id UUID,
    p_buy_invoice_code VARCHAR,
    p_create_date TIMESTAMP,
    p_total_price BIGINT
)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO "BuyInvoiceRMs" ("Id", "BuyInvoiceId", "BuyInvoiceCode", "BuyInvoiceCreateDate", "TotalPrice")
    VALUES (p_id, p_buy_invoice_id, p_buy_invoice_code, p_create_date, p_total_price);
END;
$$
LANGUAGE plpgsql;
