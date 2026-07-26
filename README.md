<div align="center">

# 🖧 RouterForge NOC

### Gerador de configurações MikroTik com failover, feito para operação de NOC

![RouterOS](https://img.shields.io/badge/RouterOS-MikroTik-red?style=for-the-badge&logo=mikrotik)
![GitHub Pages](https://img.shields.io/badge/Deploy-GitHub%20Pages-2ea44f?style=for-the-badge&logo=github)
![Status](https://img.shields.io/badge/status-ativo-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-blue?style=for-the-badge)

</div>

---

## 📡 Sobre o projeto

O **RouterForge NOC** é uma ferramenta que gera configurações prontas para roteadores **MikroTik**, com foco em **failover de múltiplos links** para operações de provedores de internet (ISPs).

Nasceu da rotina real de NOC: reduzir o tempo entre "o link caiu" e "o cliente nem percebeu", automatizando a geração de scripts que hoje muita gente ainda escreve na mão.

🔗 **Demo ao vivo:** [link do GitHub Pages aqui]

---

## ⚙️ Principais funcionalidades

- Geração automática de configuração de **failover entre múltiplos links WAN**
- Templates prontos para cenários comuns de ISP (link primário + backup, balanceamento, PCC)
- Interface simples, pensada para uso rápido durante atendimento ou implantação
- Scripts exportáveis direto para colar no terminal do RouterOS

---

## 🖥️ Stack

`[preencher: HTML / JS / Python / etc — o que o projeto realmente usa]`

---

## 🚀 Como usar

```bash
# Clone o repositório
git clone https://github.com/luciano-veiga/routerforge-noc.git

# Entre na pasta
cd routerforge-noc

# [preencher: comando para rodar localmente, se aplicável]
```

Ou acesse direto pela versão publicada no GitHub Pages (link acima).

---

## 🗺️ Roadmap

- [ ] Suporte a mais cenários de failover (3+ links)
- [ ] Exportação de configuração em lote
- [ ] Integração com IXC Provider para leitura de clientes/links

---

## 👤 Autor

**Luciano Veiga**
Network & Infrastructure Manager | AWS Certified | DevSecOps

[LinkedIn](https://www.linkedin.com/in/lucianoveiga-ti/) · [GitHub](https://github.com/luciano-veiga)

---

<div align="center">
<sub>Feito por quem também já ficou de plantão às 3h da manhã por causa de um BGP mal configurado.</sub>
</div>
