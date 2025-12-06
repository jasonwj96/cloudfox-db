CREATE TABLE cfx_accounts
(
    id           uuid primary key default gen_random_uuid(),
    username     varchar(32),
    password     varchar(256),
    creationDate timestamptz,
    phoneNumber  varchar(20)
        CHECK (phoneNumber ~ '^\+[1-9][0-9]{7,14}$'),
    active       bool
);