#!/bin/bash
set -e

# Write credentials from secret mount to where ob expects them
mkdir -p /root/.config/obsidian-headless
cp /secrets/obsidian-credentials /root/.config/obsidian-headless/credentials.json

# Setup vault sync (idempotent — safe to re-run)
ob sync-setup --vault "$OBSIDIAN_VAULT_NAME" --path /vault

# Run continuous sync
ob sync --continuous --path /vault
