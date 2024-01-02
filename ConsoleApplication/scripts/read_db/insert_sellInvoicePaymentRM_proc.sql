CREATE OR REPLACE FUNCTION insert_sell_invoice_proc(
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
    INSERT INTO sell_invoice (
        id,
        sell_invoice_id,
        sell_invoice_code,
        sell_invoice_date,
        customer_name,
        customer_code,
        vehicle_name,
        vehicle_code,
        total_price,
        total_price_when_using_buy_prices,
        tax,
        discount,
        to_pay,
        to_pay_when_using_buy_prices,
        use_buy_price
    )
    VALUES (
        UUID_GENERATE_V4(),
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
