CREATE OR REPLACE FUNCTION clear_read_db()
RETURNS void AS
$$
BEGIN
    DELETE FROM "BuyInvoiceRMs";
    DELETE FROM "CustomerRMs";
    DELETE FROM "CustomerVehicleRMs";
    DELETE FROM "InventoryItemRMs";
    DELETE FROM "SellInvoiceDescriptionRMs";
    DELETE FROM "SellInvoiceInventoryItemRMs";
    DELETE FROM "SellInvoicePaymentRMs";
    DELETE FROM "SellInvoiceRMs";
    DELETE FROM "SellInvoiceServiceRMs";
    DELETE FROM "ServiceRMs";
    DELETE FROM "VehicleRMs";
END;
$$
LANGUAGE plpgsql;

