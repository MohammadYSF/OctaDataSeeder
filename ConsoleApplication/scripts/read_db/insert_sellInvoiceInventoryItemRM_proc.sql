CREATE OR REPLACE FUNCTION insert_sellInvoiceInventoryItemRM_proc(
    p_id UUID,
    p_sell_invoice_id UUID,
    p_inventory_item_id UUID,
    p_inventory_item_code VARCHAR,
    p_count FLOAT,
    p_buy_price BIGINT,
    p_sell_price BIGINT
)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO "SellInvoiceInventoryItemRMs" (
        "Id",
        "SellInvoiceId",
        "InventoryItemId",
        "InventoryItemCode",
        "Count",
        "BuyPrice",
        "SellPrice"
    )
    VALUES (
        p_id,
        p_sell_invoice_id,
        p_inventory_item_id,
        p_inventory_item_code,
        p_count,
        p_buy_price,
        p_sell_price
    );
END;
$$
LANGUAGE plpgsql;
