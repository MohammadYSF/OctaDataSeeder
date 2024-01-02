CREATE OR REPLACE FUNCTION insert_inventoryItemRM_proc(
    p_id UUID,
    p_inventory_item_id UUID,
    p_inventory_item_code VARCHAR,
    p_inventory_item_name VARCHAR,
    p_inventory_item_count FLOAT,
    p_inventory_item_buy_price BIGINT,
    p_inventory_item_sell_price BIGINT,
    p_from_date TIMESTAMP,
    p_to_date TIMESTAMP,
    p_is_deleted BOOLEAN
)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO "InventoryItemRMs" (
        "Id",
        "InventoryItemId",
        "InventoryItemCode",
        "InventoryItemName",
        "InventoryItemCount",
        "InventoryItemBuyPrice",
        "InventoryItemSellPrice",
        "FromDate",
        "ToDate",
        "IsDeleted"
    )
    VALUES (
        p_id,
        p_inventory_item_id,
        p_inventory_item_code,
        p_inventory_item_name,
        p_inventory_item_count,
        p_inventory_item_buy_price,
        p_inventory_item_sell_price,
        p_from_date,
        p_to_date,
        p_is_deleted
    );
END;
$$
LANGUAGE plpgsql;
