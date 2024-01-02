CREATE OR REPLACE FUNCTION clear_write_db()
RETURNS void AS
$$
BEGIN
    DELETE FROM "BuyInvoice";
    DELETE FROM "BuyInvoicecInventoryItems";
    DELETE FROM "Customer";
    DELETE FROM "InventoryItems";
    DELETE FROM "SellInvoicecInventoryItems";
    DELETE FROM "SellInvoicePayments";
    DELETE FROM "SellInvoices";
    DELETE FROM "SellInvoiceServices";
    DELETE FROM "Services";
    DELETE FROM "Vehicle";
END;
$$
LANGUAGE plpgsql;
