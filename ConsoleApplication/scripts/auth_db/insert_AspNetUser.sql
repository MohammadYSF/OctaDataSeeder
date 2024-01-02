CREATE OR REPLACE FUNCTION insert_AspNetUser(
    p_id uuid,
    p_first_name text,
    p_last_name text,
    p_user_name varchar(256),
    p_normalized_user_name varchar(256),
    p_email varchar(256),
    p_normalized_email varchar(256),
    p_email_confirmed boolean,
    p_password_hash text,
    p_security_stamp text,
    p_concurrency_stamp text,
    p_phone_number text,
    p_phone_number_confirmed boolean,
    p_two_factor_enabled boolean,
    p_lockout_end timestamp with time zone,
    p_lockout_enabled boolean,
    p_access_failed_count integer
)
RETURNS void AS
$$
BEGIN
    INSERT INTO "AspNetUsers" (
        "Id", "FirstName", "LastName", "UserName", "NormalizedUserName",
        "Email", "NormalizedEmail", "EmailConfirmed", "PasswordHash",
        "SecurityStamp", "ConcurrencyStamp", "PhoneNumber",
        "PhoneNumberConfirmed", "TwoFactorEnabled", "LockoutEnd",
        "LockoutEnabled", "AccessFailedCount"
    )
    VALUES (
        p_id, p_first_name, p_last_name, p_user_name, p_normalized_user_name,
        p_email, p_normalized_email, p_email_confirmed, p_password_hash,
        p_security_stamp, p_concurrency_stamp, p_phone_number,
        p_phone_number_confirmed, p_two_factor_enabled, p_lockout_end,
        p_lockout_enabled, p_access_failed_count
    );
END;
$$
LANGUAGE plpgsql;
