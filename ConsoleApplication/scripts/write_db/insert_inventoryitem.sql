create or replace function insert_inventoryitem(p_id uuid, p_buy_price_history text, p_sell_price_history text, p_code integer, p_name text, p_buy_price bigint DEFAULT 0, p_sell_price bigint DEFAULT 0, p_count real DEFAULT 0, p_is_active boolean DEFAULT false, p_register_date timestamp without time zone DEFAULT '1970-01-01 00:00:00'::timestamp without time zone, p_count_lower_bound real DEFAULT 0) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO "InventoryItems" ("Id", "BuyPriceHistory", "SellPriceHistory", "Code", "Name",
                                   "BuyPrice", "SellPrice", "Count", "IsActive", "RegisterDate", "CountLowerBound")
    VALUES (p_id, p_buy_price_history, p_sell_price_history, p_code, p_name,
            p_buy_price, p_sell_price, p_count, p_is_active, p_register_date, p_count_lower_bound);
END;
$$;


