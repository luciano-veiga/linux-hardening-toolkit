# linux-hardening-toolkit

Scripts e checklists de hardening para servidores Linux, construídos com base em boas práticas de segurança (CIS Benchmarks, recomendações da comunidade) e testados em ambiente real.

## Conteúdo

| Item | Descrição | Status |
|---|---|---|
| [ssh-hardening](./ssh-hardening) | Script que endurece a configuração do SSH | ✅ |
| cis-checklist | Checklist resumido do CIS Benchmark para Linux | 🔜 |
| fail2ban-setup | Instalação e configuração de fail2ban | 🔜 |
| port-scanner | Scanner simples de portas abertas | 🔜 |
| user-audit | Relatório de auditoria de usuários e permissões sudo | 🔜 |

## Aviso importante

Estes scripts alteram configurações de segurança do sistema (SSH, firewall, etc). **Sempre teste em ambiente controlado antes de aplicar em produção**, e garanta que você tem uma forma alternativa de acessar a máquina (console da nuvem, KVM) caso algo bloqueie o acesso remoto.
