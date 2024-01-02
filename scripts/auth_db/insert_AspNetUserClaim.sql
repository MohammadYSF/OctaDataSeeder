CREATE OR REPLACE FUNCTION insert_AspNetUserClaim(
    p_user_id uuid,
    p_claim_type text,
    p_claim_value text
)
RETURNS void AS
$$
BEGIN
    INSERT INTO "AspNetUserClaims" ("UserId", "ClaimType", "ClaimValue")
    VALUES (p_user_id, p_claim_type, p_claim_value);
END;
$$
LANGUAGE plpgsql;
