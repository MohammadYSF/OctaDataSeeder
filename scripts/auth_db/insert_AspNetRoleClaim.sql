CREATE OR REPLACE FUNCTION insert_AspNetRoleClaim(
    p_role_id uuid,
    p_claim_type text,
    p_claim_value text
)
RETURNS void AS
$$
BEGIN
    INSERT INTO "AspNetRoleClaims" ("RoleId", "ClaimType", "ClaimValue")
    VALUES (p_role_id, p_claim_type, p_claim_value);
END;
$$
LANGUAGE plpgsql;
