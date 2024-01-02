CREATE OR REPLACE FUNCTION insert_serviceRM_proc(
    p_id UUID,
    p_service_id UUID,
    p_service_code VARCHAR,
    p_service_name VARCHAR,
    p_service_default_price BIGINT,
    p_from_date TIMESTAMP,
    p_to_date TIMESTAMP,
    p_is_deleted BOOLEAN
)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO "ServiceRMs" (
        "Id",
        "ServiceId",
        "ServiceCode",
        "ServiceName",
        "ServiceDefaultPrice",
        "FromDate",
        "ToDate",
        "IsDeleted"
    )
    VALUES (
        p_id,
        p_service_id,
        p_service_code,
        p_service_name,
        p_service_default_price,
        p_from_date,
        p_to_date,
        p_is_deleted
    );
END;
$$
LANGUAGE plpgsql;
