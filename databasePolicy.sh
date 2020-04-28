#!/bin/bash

export VAULT_ADDR='http://127.0.0.1:8200'
# enable approle
vault auth enable approle 

# create secret path 
vault secrets enable -path=database kv-v2 

# database-policy.hcl 
# Read-only permission on 'database/*' path
vault policy write database database-policy.hcl

# database-init-token.hcl 
# policy for initial token
vault policy write database-init-token database-init-token.hcl

# write approle for pg_service_1 with policy:database and ttl:1h 
vault write auth/approle/role/pg_service_1 policies="database" token_ttl=1h

#Store KV data
vault kv put database/postgres/service_1 @postgres.txt

# Generate init token for APP, valid for 3 days 
vault token create -policy=database-init-token -ttl=72h 
 
# Result: s.rMdwZh8udP9HVYmu1SmrSO3F