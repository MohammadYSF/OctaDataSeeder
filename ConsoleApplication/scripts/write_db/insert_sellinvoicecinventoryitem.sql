create or replace function insert_sellinvoicecinventoryitem(p_id uuid, p_sell_invoice_id uuid, p_inventory_item_id uuid, p_count real) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO "SellInvoicecInventoryItems" ("Id", "SellInvoiceId", "InventoryItemId", "Count")
    VALUES (p_id, p_sell_invoice_id, p_inventory_item_id, p_count);
END;
$$;


