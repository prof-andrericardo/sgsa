# 🚀 Guia de Otimizações e Hardening do Servidor Debian 12.11

> 🔒 Foco: **Desempenho**, **Segurança**, **Confiabilidade** e **Eficiência**\
> 💻 Baseado em: `Debian GNU/Linux 12.11 (Bookworm)`\
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

## 🧠 1. Ajustes de Sistema Operacional (sysctl, swap, limites)

...[conteúdo anterior mantido]...

---

## 🌐 2. Otimizações do Servidor Web NGINX

...[conteúdo anterior mantido]...

---

## 💡 3. Ajustes no PHP-FPM

...[conteúdo anterior mantido]...

---

## 🗄️ 4. Tuning do MariaDB

...[conteúdo anterior mantido]...

---

## 📡 5. Melhorias no DNS (BIND9)

### 📦 Etapa 1: Ajustar parâmetros de cache e performance

Edite o arquivo:

```bash
sudo nano /etc/bind/named.conf.options
```

Adicione ou edite dentro de `options`:

```conf
max-cache-size 64M;
max-cache-ttl 3600;
max-ncache-ttl 600;
recursive-clients 1000;
```

> ⚙️ Essas opções controlam a quantidade de cache usada, o tempo de vida das entradas, e limitam sobrecarga.

---

### 🛡️ Etapa 2: Melhorar a segurança e bloquear abusos

Ainda no bloco `options`, verifique se os seguintes estão ativos:

```conf
allow-recursion { localnets; };
allow-query { any; };
allow-transfer { none; };
rate-limit {
    responses-per-second 5;
};
```

> 🚫 `allow-transfer { none; };` evita vazamento da base de DNS. 🔒 A opção `rate-limit` reduz ataques de amplificação DNS.

---

### 🔁 Etapa 3: Reiniciar e validar

```bash
sudo named-checkconf
sudo systemctl restart bind9
```

### 🧪 Etapa 4: Testar cache e TTL

```bash
dig @localhost google.com
```

Execute duas vezes e compare o tempo de resposta. A segunda deve ser mais rápida (vinda do cache).

> ✅ Essas otimizações garantem mais eficiência, segurança e controle sobre a resolução DNS no servidor local.

---

Deseja que eu continue agora com o **Capítulo 6: PM2 e Node.js – Produção e Logs**? 🧪

