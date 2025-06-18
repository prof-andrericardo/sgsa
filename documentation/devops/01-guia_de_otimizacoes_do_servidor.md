# 🚀 Guia de Otimizações e Hardening do Servidor Debian 12.11

> 🔒 Foco: **Desempenho**, **Segurança**, **Confiabilidade** e **Eficiência**  
> 💻 Baseado em: `Debian GNU/Linux 12.11 (Bookworm)`  
> 📦 Serviços instalados previamente: `NGINX`, `PHP 8.2`, `MariaDB`, `phpMyAdmin`, `Node.js`, `PM2`, `BIND9`

---

## 📘 Objetivo deste Guia

Este documento complementa o **Guia Completo de Configuração de Servidor Debian 12.11**, e visa aplicar **otimizações práticas e seguras** para:

- 🔧 Ajustar parâmetros do sistema
- 🔥 Fortalecer a segurança
- ⚡ Melhorar a performance de serviços
- 📉 Reduzir uso de recursos
- 📊 Monitorar e manter a estabilidade do ambiente

---

## 🗂️ Estrutura deste Guia

1. 🧠 **Ajustes de Sistema Operacional** (kernel, swap, limites)
2. 🌐 **Otimizações do Servidor Web NGINX**
3. 💡 **Ajustes no PHP-FPM**
4. 🗄️ **Tuning do MariaDB**
5. 📡 **Melhorias no DNS (BIND9)**
6. 🧪 **PM2 e Node.js: produção e logs**
7. 🛡️ **Segurança adicional: fail2ban, UFW e hardening**
8. 📈 **Ferramentas de monitoramento e diagnóstico**
9. 🗓️ **Rotina de manutenção e automação de backups**

---

Deseja que eu inicie agora pelo **Capítulo 1: Ajustes de Sistema Operacional (sysctl, swap, limites, desempenho geral)?**

