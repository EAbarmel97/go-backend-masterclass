CREATE TABLE accounts (
  id BIGSERIAL PRIMARY KEY,
  owner VARCHAR NOT NULL,
  balance BIGINT NOT NULL,
  currency VARCHAR NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE entries (
  id BIGSERIAL PRIMARY KEY,
  account_id BIGINT NOT NULL REFERENCES accounts(id),
  amount BIGINT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transfers (
  id SERIAL PRIMARY KEY,
  from_account_id BIGINT NOT NULL REFERENCES accounts(id),
  to_account_id BIGINT NOT NULL REFERENCES accounts(id),
  amount BIGINT NOT NULL CHECK (amount > 0),
  created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX ON accounts (owner);
CREATE INDEX ON entries (account_id);
CREATE INDEX ON entries (account_id);
CREATE INDEX ON transfers (from_account_id);
CREATE INDEX ON transfers (to_account_id);
CREATE INDEX ON transfers (from_account_id, to_account_id);