CREATE OR REPLACE FUNCTION sp_query_account(
    in_user_id uuid DEFAULT NULL,
    in_username varchar DEFAULT NULL)
    RETURNS TABLE
            (
                id           uuid,
                username     varchar(32),
                fullname     varchar(50),
                email        varchar,
                creationDate timestamp,
                phoneNumber  varchar(20),
                active       boolean
            )
    LANGUAGE sql
AS
$$
SELECT id, username, fullname, email, creationDate, phoneNumber, active
FROM cfx_accounts
WHERE (in_user_id IS NULL OR id = in_user_id)
  AND (in_username IS NULL OR username = in_username);
$$;

CREATE OR REPLACE FUNCTION sp_register_account(
    in_username varchar(32),
    in_fullname varchar(50),
    in_password_hash varchar(250),
    in_password_hash_algo varchar(30))
    RETURNS TABLE
            (
                id           uuid,
                username     varchar,
                fullname     varchar,
                email        varchar,
                creationDate timestamp,
                phoneNumber  varchar,
                active       boolean
            )
    LANGUAGE sql
AS
$$
SELECT id, username, fullname, email, creationDate, phoneNumber, active
FROM cfx_accounts
WHERE (in_user_id IS NULL OR id = in_user_id)
  AND (in_username IS NULL OR username = in_username);
$$;