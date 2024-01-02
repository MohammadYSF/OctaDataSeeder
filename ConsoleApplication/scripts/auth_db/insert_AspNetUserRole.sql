CREATE OR REPLACE FUNCTION insert_AspNetUserRole(
    p_user_id uuid,
    p_role_id uuid
)
RETURNS void AS
$$
BEGIN
    INSERT INTO "AspNetUserRoles" ("UserId", "RoleId")
    VALUES (p_user_id, p_role_id);
END;
$$
LANGUAGE plpgsql;
