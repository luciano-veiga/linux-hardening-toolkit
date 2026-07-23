#!/usr/bin/env bash
#
# harden_ssh.sh — Aplica um conjunto de boas práticas de segurança
# à configuração do SSH em um servidor Linux.
#
# Uso:
#   sudo ./harden_ssh.sh [porta_ssh]
#
# ATENÇÃO: este script desabilita login root e autenticação por senha.
# Garanta que você já tem uma chave SSH configurada para o seu usuário
# ANTES de rodar, e uma forma alternativa de acesso (console da nuvem)
# caso algo dê errado.

set -euo pipefail

SSH_PORT="${1:-22}"
SSHD_CONFIG="/etc/ssh/sshd_config"
BACKUP_PATH="/etc/ssh/sshd_config.bak.$(date +%Y%m%d_%H%M%S)"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

if [ "$EUID" -ne 0 ]; then
  echo "Erro: rode este script como root (sudo)." >&2
  exit 1
fi

if [ ! -f "${SSHD_CONFIG}" ]; then
  echo "Erro: ${SSHD_CONFIG} não encontrado." >&2
  exit 1
fi

log "Fazendo backup da configuração atual em ${BACKUP_PATH}"
cp "${SSHD_CONFIG}" "${BACKUP_PATH}"

set_config() {
  local key="$1"
  local value="$2"
  if grep -qE "^\s*#?\s*${key}\s+" "${SSHD_CONFIG}"; then
    sed -i "s|^\s*#\?\s*${key}\s\+.*|${key} ${value}|" "${SSHD_CONFIG}"
  else
    echo "${key} ${value}" >> "${SSHD_CONFIG}"
  fi
  log "Aplicado: ${key} ${value}"
}

log "Aplicando configurações de hardening ..."

set_config "Port" "${SSH_PORT}"
set_config "PermitRootLogin" "no"
set_config "PasswordAuthentication" "no"
set_config "PubkeyAuthentication" "yes"
set_config "PermitEmptyPasswords" "no"
set_config "X11Forwarding" "no"
set_config "MaxAuthTries" "3"
set_config "ClientAliveInterval" "300"
set_config "ClientAliveCountMax" "2"
set_config "Protocol" "2"

log "Validando sintaxe do arquivo de configuração ..."
if sshd -t; then
  log "Sintaxe válida."
else
  echo "Erro: sintaxe inválida em ${SSHD_CONFIG}. Restaurando backup." >&2
  cp "${BACKUP_PATH}" "${SSHD_CONFIG}"
  exit 1
fi

log "Reiniciando serviço SSH ..."
systemctl restart sshd || systemctl restart ssh

log "Hardening aplicado com sucesso."
log "Porta SSH ativa: ${SSH_PORT}"
log "Backup da configuração anterior salvo em: ${BACKUP_PATH}"
log "IMPORTANTE: teste a conexão SSH em uma NOVA sessão antes de fechar esta."
