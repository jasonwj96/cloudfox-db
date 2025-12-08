DROP TABLE IF EXISTS cfx_accounts;

CREATE TABLE cfx_accounts
(
    id                 uuid primary key default gen_random_uuid(),
    username           varchar(32)                    not null,
    fullname           varchar(50)                    not null,
    password_hash      varchar(256)                   not null,
    password_hash_algo varchar(30)                    not null,
    email              varchar(255) unique            not null,
    CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    mfa_enabled        bool             default false,
    mfa_type           varchar(30)                    not null,
    creationDate       timestamptz      default now() not null,
    phoneNumber        varchar(20)
        CHECK (phoneNumber ~ '^\+[1-9][0-9]{7,14}$'),
    active             bool             default false
);