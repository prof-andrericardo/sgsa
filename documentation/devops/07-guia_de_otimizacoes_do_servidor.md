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

...[conteúdo anterior mantido]...

---

## 🧪 6. PM2 e Node.js – Produção e Logs

### 🚀 Etapa 1: Executar em modo de produção

Inicie sua aplicação com `--name` e salve o estado:

```bash
pm2 start app.js --name sgsa-app
pm2 save
```

### 🔁 Etapa 2: Ativar modo cluster (auto-load balance)

Ideal para CPUs com múltiplos núcleos:

```bash
pm2 start app.js -i max --name sgsa-app-cluster
pm2 save
```

> 💡 `-i max` detecta e usa todos os núcleos disponíveis.

### 📊 Etapa 3: Monitoramento em tempo real

```bash
pm2 monit
```

### 📂 Etapa 4: Gerenciamento de logs

Visualizar logs padrão:

```bash
pm2 logs sgsa-app
```

Limpar logs antigos:

```bash
pm2 flush
```

Arquivos de log padrão:

- `~/.pm2/logs/sgsa-app-out.log`
- `~/.pm2/logs/sgsa-app-error.log`

### 🛠️ Etapa 5: Integrar com o sistema (Systemd)

```bash
pm2 startup systemd
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u sgsa --hp /home/sgsa
```

> ✅ Após essas configurações, o PM2 manterá sua aplicação ativa mesmo após reboot, com logs organizados e escalabilidade automática.

---

Deseja que eu continue agora com o **Capítulo 7: Segurança adicional (fail2ban, UFW e hardening)**? 🛡️

