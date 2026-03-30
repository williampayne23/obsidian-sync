#!/bin/bash
set -e

# OBSIDIAN_AUTH_TOKEN env var is read directly by ob CLI

# Setup vault sync (idempotent — safe to re-run)
ob sync-setup --vault "$OBSIDIAN_VAULT_NAME" --path /vault

# Initial sync: pull-only to avoid pushing stale local files
ob sync-config --path /vault --mode pull-only
ob sync --path /vault

# Switch to bidirectional for ongoing sync
ob sync-config --path /vault --mode bidirectional
ob sync --continuous --path /vault
