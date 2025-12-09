CREATE OR REPLACE PROCEDURE sp_query_accounts(
    IN in_option int, IN in_user_id uuid,
    IN in_username VARCHAR(50)
)
    LANGUAGE plpgsql
AS
$$
BEGIN
    IF in_option == 1 THEN
        SELECT id,
               username,
               fullname,
               email,
               creationDate,
               phoneNumber,
               active
        FROM cfx_accounts
        WHERE id = in_user_id;
    END IF;

    IF in_option == 2 THEN
        SELECT id,
               username,
               fullname,
               email,
               creationDate,
               phoneNumber,
               active
        FROM cfx_accounts
        WHERE username = in_username;
    END IF;
END;
$$;