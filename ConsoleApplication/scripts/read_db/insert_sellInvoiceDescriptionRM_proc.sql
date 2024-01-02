CREATE OR REPLACE FUNCTION insert_sellInvoiceDescriptionRM_proc(
    p_id UUID,
    p_sell_invoice_id UUID,
    p_kilometer_1 BIGINT,
    p_kilometer_2 BIGINT,
    p_kilometer_3 BIGINT,
    p_kilometer_4 BIGINT,
    p_description VARCHAR
)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO "SellInvoiceDescriptionRMs" (
        "Id",
        "SellInvoiceId",
        "Kilometer1",
        "Kilometer2",
        "Kilometer3",
        "Kilometer4",
        "Description"
    )
    VALUES (
        p_id,
        p_sell_invoice_id,
        p_kilometer_1,
        p_kilometer_2,
        p_kilometer_3,
        p_kilometer_4,
        p_description
    );
END;
$$
LANGUAGE plpgsql;
