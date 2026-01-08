DROP TABLE IF EXISTS cfx_idp_keys cASCADE;

CREATE TABLE cfx_idp_keys
(
    id              BIGSERIAL PRIMARY KEY,
    idempotency_key TEXT        NOT NULL,
    operation       TEXT        NOT NULL,
    request_hash    TEXT        NOT NULL,
    response_status INTEGER     NOT NULL,
    response_body   JSONB       NOT NULL,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    expires_at      TIMESTAMPTZ NOT NULL,
    UNIQUE (idempotency_key, operation)
);

CREATE INDEX idx_key_lookup
    ON cfx_idp_keys (idempotency_key, operation);