# Vault Docker
## Get quickly up and running with Vault using Docker

The following steps need to be followed to get going.

1. Change execution mode for sh files e.g. chmod 755 *.sh
2. Execute initalSetup.sh
3. Run following commands in terminal to unseal the vault
    - `vault operator init -key-shares=6 -key-threshold=3`
    - `vault operator unseal ZO8Vze1ml...74wh`
    - `vault operator unseat iGYZITAvm...4BSK`
    - `vault operator unseal In/4MkBvA...qwzx`
    - `vault login s.F82wC...wW11`
4. Execute databasePolicy.sh

You can use the token generated by the script to be passed to your application using this token

---
### Notes
- postgres.txt has the db credentials that is stored in the vault
- You can access the vault ui from http://localhost:8200/ui

