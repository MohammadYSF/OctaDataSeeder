CREATE OR REPLACE FUNCTION insert_sellInvoiceRM_proc(
    p_id UUID,
    p_sell_invoice_id UUID,
    p_sell_invoice_code VARCHAR,
    p_sell_invoice_date TIMESTAMP,
    p_customer_name VARCHAR,
    p_customer_code VARCHAR,
    p_vehicle_name VARCHAR,
    p_vehicle_code VARCHAR,
    p_total_price BIGINT,
    p_total_price_when_using_buy_prices BIGINT,
    p_tax BIGINT,
    p_discount BIGINT,
    p_to_pay BIGINT,
    p_to_pay_when_using_buy_prices BIGINT,
    p_use_buy_price BOOLEAN
)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO "SellInvoiceRMs" (
        "Id",
        "SellInvoiceId",
        "SellInvoiceCode",
        "SellInvoiceDate",
        "CustomerName",
        "CustomerCode",
        "VehicleName",
        "VehicleCode",
        "TotalPrice",
        "TotalPriceWhenUsingBuyPrices",
        "Tax",
        "Discount",
        "ToPay",
        "ToPayWhenUsingBuyPrices",
        "UseBuyPrice"
    )
    VALUES (
        p_id,
        p_sell_invoice_id,
        p_sell_invoice_code,
        p_sell_invoice_date,
        p_customer_name,
        p_customer_code,
        p_vehicle_name,
        p_vehicle_code,
        p_total_price,
        p_total_price_when_using_buy_prices,
        p_tax,
        p_discount,
        p_to_pay,
        p_to_pay_when_using_buy_prices,
        p_use_buy_price
    );
END;
$$
LANGUAGE plpgsql;
