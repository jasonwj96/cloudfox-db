DROP TABLE IF EXISTS cfx_accounts;

CREATE TABLE cfx_accounts
(
    id                 uuid primary key default gen_random_uuid(),
    username           varchar(32)                    not null,
    fullname           varchar(50)                    not null,
    password_hash      text                           not null,
    password_salt      bytea                          not null,
    password_hash_algo text                           not null,
    email              varchar(255) unique            null,
    mfa_enabled        bool             default false,
    mfa_type           varchar(30)                    null,
    creationDate       timestamptz      default now() not null,
    phoneNumber        varchar(20)                    null,
    active             bool             default false
);

INSERT INTO cfx_accounts
(id, username, fullname, password_hash,
 password_salt,
 password_hash_algo, email, mfa_enabled, mfa_type,
 creationdate, phonenumber, active)
VALUES ('85f13ac1-9417-4b05-a577-fc5737bf330d', 'alice', 'Alice Redfield', 'hash_1',
        '8f3a2c9d1e4b7a0f6c8e2d5b4a9f1c3e7b6d0a2f4c9e8d1b5a6c7e3f2a9d4b1',
        'argonid',
        'alice@gmail.com', false, 'webauthn', '2025-12-08 21:31:55.121884 +00:00', '+14155550123',
        true);

select * from cfx_accounts