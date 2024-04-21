# Installation 

## Prerequisites

1. Run this command to create environment file with required variables 

```bash
echo "PG_PASS=$(openssl rand -base64 36)" >> .env
echo "AUTHENTIK_SECRET_KEY=$(openssl rand -base64 60)" >> .env
```

2. <code>PG_PASS</code> is the password for Postgresql db which is required for authentik
3. <code>AUTHENIK_SECRET_KEY</code> is the authentik secret required for installation

4. To enable error reporting, run the following command:

```bash 
echo "AUTHENTIK_ERROR_REPORTING__ENABLED=true" >> .env
```
5. To configure email credentials, append this block to your .env file
```bash
# SMTP Host Emails are sent to
AUTHENTIK_EMAIL__HOST=localhost
AUTHENTIK_EMAIL__PORT=25
# Optionally authenticate (don't add quotation marks to your password)
AUTHENTIK_EMAIL__USERNAME=
AUTHENTIK_EMAIL__PASSWORD=
# Use StartTLS
AUTHENTIK_EMAIL__USE_TLS=false
# Use SSL
AUTHENTIK_EMAIL__USE_SSL=false
AUTHENTIK_EMAIL__TIMEOUT=10
# Email address authentik will send from, should have a correct @domain
AUTHENTIK_EMAIL__FROM=authentik@localhost
```

