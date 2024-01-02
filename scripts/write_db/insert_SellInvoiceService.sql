CREATE OR REPLACE FUNCTION insert_SellInvoiceService(
    p_id uuid,
    p_sell_invoice_id uuid,
    p_service_id uuid,
    p_service_price bigint
)
RETURNS void AS
$$
BEGIN
    INSERT INTO "SellInvoiceServices" ("Id", "SellInvoiceId", "ServiceId", "ServicePrice")
    VALUES (p_id, p_sell_invoice_id, p_service_id, p_service_price);
END;
$$
LANGUAGE plpgsql;
