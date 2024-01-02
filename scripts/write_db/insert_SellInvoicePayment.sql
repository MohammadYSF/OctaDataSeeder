CREATE OR REPLACE FUNCTION insert_SellInvoicePayment(
    p_id uuid,
    p_sell_invoice_id uuid,
    p_paid_date timestamp,
    p_payment_track_code text,
    p_paid_amount bigint
)
RETURNS void AS
$$
BEGIN
    INSERT INTO "SellInvoicePayments" ("Id", "SellInvoiceId", "PaidDate", "PaymentTrackCode", "PaidAmount")
    VALUES (p_id, p_sell_invoice_id, p_paid_date, p_payment_track_code, p_paid_amount);
END;
$$
LANGUAGE plpgsql;
