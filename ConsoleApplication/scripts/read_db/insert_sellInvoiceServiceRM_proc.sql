CREATE OR REPLACE FUNCTION insert_sellInvoiceServiceRM_proc(
    p_id UUID,
    p_sell_invoice_id UUID,
    p_service_id UUID,
    p_service_code VARCHAR,
    p_default_price BIGINT,
    p_price BIGINT
)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO "SellInvoiceServiceRMs" (
        "Id",
        "SellInvoiceId",
        "ServiceId",
        "ServiceCode",
        "DefaultPrice",
        "Price"
    )
    VALUES (
        p_id,
        p_sell_invoice_id,
        p_service_id,
        p_service_code,
        p_default_price,
        p_price
    );
END;
$$
LANGUAGE plpgsql;
