create or replace function insert_sellinvoicepayment(p_id uuid, p_sell_invoice_id uuid, p_paid_date timestamp without time zone, p_payment_track_code text, p_paid_amount bigint) returns void
    language plpgsql
as
$$
BEGIN
    INSERT INTO "SellInvoicePayments" ("Id", "SellInvoiceId", "PaidDate", "PaymentTrackCode", "PaidAmount")
    VALUES (p_id, p_sell_invoice_id, p_paid_date, p_payment_track_code, p_paid_amount);
END;
$$;


