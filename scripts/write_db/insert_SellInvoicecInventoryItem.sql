CREATE OR REPLACE FUNCTION insert_SellInvoicecInventoryItem(
    p_id uuid,
    p_sell_invoice_id uuid,
    p_inventory_item_id uuid,
    p_count real
)
RETURNS void AS
$$
BEGIN
    INSERT INTO "SellInvoicecInventoryItems" ("Id", "SellInvoiceId", "InventoryItemId", "Count")
    VALUES (p_id, p_sell_invoice_id, p_inventory_item_id, p_count);
END;
$$
LANGUAGE plpgsql;
