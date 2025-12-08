DROP TABLE IF EXISTS cfx_accounts;

CREATE TABLE cfx_accounts
(
    id                 uuid primary key default gen_random_uuid(),
    username           varchar(32)         not null,
    fullname           varchar(50)         not null,
    password_hash      varchar(256)        not null,
    password_hash_algo varchar(30)         not null,
    email              varchar(255) unique not null,
    CHECK (email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
    mfa_enabled        bool             default false,
    mfa_type           varchar(30),
    creationDate       timestamptz      default now(),
    phoneNumber        varchar(20)
        CHECK (phoneNumber ~ '^\+[1-9][0-9]{7,14}$'),
    active             bool             default false
);

INSERT INTO cfx_accounts (username,
                          fullname,
                          password_hash,
                          password_hash_algo,
                          email,
                          mfa_enabled,
                          mfa_type,
                          creationDate,
                          phoneNumber, active)
VALUES ('alice',
        'Alice Redfield',
        'hash_1',
        'bcrypt',
        'alice@gmail.com',
        false,
        'webauthn',
        NOW(),
        '+14155550123',
        true);