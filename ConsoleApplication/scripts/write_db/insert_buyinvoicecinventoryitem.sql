create or replace function insert_buyinvoicecinventoryitem(p_id uuid, p_sell_invoice_id uuid, p_inventory_item_id uuid, p_count real, p_buy_invoice_id uuid) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO "BuyInvoicecInventoryItems" ("Id", "SellInvoiceId", "InventoryItemId", "Count", "BuyInvoiceId")
    VALUES (p_id, p_sell_invoice_id, p_inventory_item_id, p_count, p_buy_invoice_id);
END;
$$;


