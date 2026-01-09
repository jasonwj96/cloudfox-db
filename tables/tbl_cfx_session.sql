DROP TABLE IF EXISTS cfx_session CASCADE;

CREATE TABLE cfx_session
(
    id               uuid PRIMARY KEY     DEFAULT gen_random_uuid(),
    account_id       uuid        NOT NULL REFERENCES cfx_accounts (id) ON DELETE CASCADE,
    session_token    uuid        NOT NULL,
    user_agent       text        NULL,
    ip_address       inet        NULL,
    creation_date    timestamptz NOT NULL DEFAULT now(),
    expiration_date  timestamptz NOT NULL,
    last_active_date timestamptz NOT NULL DEFAULT now(),
    is_active        boolean     NOT NULL DEFAULT true
);

CREATE INDEX idx_cfx_sessions_account_id ON cfx_session (account_id);
CREATE INDEX idx_cfx_sessions_token ON cfx_session (session_token);