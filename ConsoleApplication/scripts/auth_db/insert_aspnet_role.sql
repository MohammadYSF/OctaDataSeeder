CREATE OR REPLACE FUNCTION insert_aspnet_role(
    p_id uuid,
    p_name VARCHAR(256),
    p_normalized_name VARCHAR(256),
    p_concurrency_stamp TEXT
)
RETURNS void
AS $$
BEGIN
    INSERT INTO "AspNetRoles"("Id","Name", "NormalizedName", "ConcurrencyStamp")
    VALUES (p_id,p_name, p_normalized_name, p_concurrency_stamp);
END;
$$ LANGUAGE plpgsql;
