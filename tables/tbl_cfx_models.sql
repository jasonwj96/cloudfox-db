DROP TABLE IF EXISTS cfx_models;

CREATE TABLE cfx_models
(
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
    account_id       UUID REFERENCES cfx_accounts (id)          NOT NULL,
    name             TEXT UNIQUE                                NOT NULL,
    generated_tokens INT              DEFAULT 0                 NOT NULL,
    creation_date    TIMESTAMPTZ      DEFAULT NOW(),
    file_name        VARCHAR(255)                               NOT NULL,
    framework        TEXT                                       NOT NULL,
    active           BOOL             default false             NOT NULL,
    last_modified    TIMESTAMPTZ      default NOW()
);

select * from cfx_models;
