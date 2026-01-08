DROP TABLE IF EXISTS cfx_payments CASCADE ;

CREATE TABLE cfx_payments
(
    id                 BIGSERIAL PRIMARY KEY,
    public_id          UUID                              NOT NULL DEFAULT gen_random_uuid(),
    account_id         UUID REFERENCES cfx_accounts (id) NOT NULL,
    amount_lowest_unit INT                            NOT NULL CHECK (amount_lowest_unit > 0),
    currency           vARCHAR(3)                           NOT NULL,
    status             TEXT                              NOT NULL CHECK (status IN ('pending', 'succeeded', 'failed')),
    creation_date      TIMESTAMPTZ                       NOT NULL DEFAULT now(),

    CONSTRAINT fk_payments_account
        FOREIGN KEY (account_id)
            REFERENCES cfx_accounts (id)
            ON DELETE RESTRICT
);

CREATE UNIQUE INDEX idx_payments_public_id ON cfx_payments (public_id);
CREATE INDEX idx_payments_account_id ON cfx_payments (account_id);