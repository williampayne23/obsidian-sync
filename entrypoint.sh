#!/bin/bash
set -e

# OBSIDIAN_AUTH_TOKEN env var is read directly by ob CLI

# Setup vault sync (idempotent — safe to re-run)
ob sync-setup --vault "$OBSIDIAN_VAULT_NAME" --path /vault

# Run continuous sync
ob sync --continuous --path /vault
