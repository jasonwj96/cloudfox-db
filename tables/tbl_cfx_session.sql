DROP TABLE IF EXISTS cfx_session CASCADE;

CREATE TABLE cfx_session
(
    id               uuid PRIMARY KEY     DEFAULT gen_random_uuid(),
    account_id       uuid  UNIQUE      NOT NULL
        REFERENCES cfx_accounts (id)
            ON DELETE CASCADE,
    session_token    uuid,
    user_agent       text        NULL,
    ip_address       text        NULL,
    creation_date    timestamptz          DEFAULT now(),
    expiration_date  timestamptz NOT NULL,
    last_active_date timestamptz          DEFAULT now(),
    is_active        boolean     NOT NULL DEFAULT true,

    CONSTRAINT chk_session_expiration
        CHECK (expiration_date > creation_date)
);

CREATE UNIQUE INDEX ux_cfx_session_token
    ON cfx_session (session_token);

CREATE INDEX idx_cfx_session_token_active
    ON cfx_session (session_token)
    WHERE is_active = true;

CREATE INDEX idx_cfx_session_account_active
    ON cfx_session (account_id)
    WHERE is_active = true;

CREATE INDEX idx_cfx_session_expiration
    ON cfx_session (expiration_date);


SELECT * from cfx_session