CREATE OR REPLACE FUNCTION clear_auth_db()
RETURNS void AS
$$
BEGIN
    DELETE FROM "AspNetRoleClaims";
    DELETE FROM "AspNetUserRoles";
    DELETE FROM "AspNetRoles";
    DELETE FROM "AspNetUserClaims";
    DELETE FROM "AspNetUserLogins";
    DELETE FROM "AspNetUserTokens";
    DELETE FROM "AspNetUsers";
END;
$$
LANGUAGE plpgsql;
