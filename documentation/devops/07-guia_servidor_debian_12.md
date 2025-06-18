# 🧰 Guia Completo de Configuração de Servidor Debian 12.11

> ✨ **Versão do Sistema**: Debian GNU/Linux 12.11 (Bookworm)\
> 🌐 **Hostname**: `server`\
> 🌐 **Domínio**: `mydomain.lan`\
> 🚀 **Endereço IP**: `192.168.0.254/24`\
> 🔐 **Gateway**: `192.168.0.1`\
> 🔎 **DNS Forwarders**: Cloudflare (`1.1.1.1`), Google (`8.8.8.8`), OpenDNS (`208.67.222.222`)

---

## 📅 1. Configuração Pós-Instalação do Debian 12.11

...[conteúdo anterior mantido]...

---

## 🔧 6. Instalação do Node.js e PM2

...[conteúdo anterior mantido]...

---

## ✅ 7. Testes e Validação dos Serviços

### 🧪 Testar DNS Local (BIND9)
```bash
dig @localhost mydomain.lan
host www.mydomain.lan 127.0.0.1
```
✔️ Esperado: resolução de nomes apontando para `192.168.0.254`

### 🧪 Testar NGINX
```bash
curl http://localhost
```
✔️ Esperado: retorno da página HTML padrão com mensagem do `index.html`

### 🧪 Testar suporte ao PHP
```bash
curl http://localhost/info.php
```
✔️ Esperado: retorno com informações do PHP (`phpinfo()`)

### 🧪 Testar MariaDB
```bash
sudo mysql -u root -p -e "SHOW DATABASES;"
```
✔️ Esperado: exibição dos bancos padrão (`information_schema`, `mysql`, etc.)

### 🧪 Testar phpMyAdmin via navegador
```
http://mydomain.lan/phpmyadmin
```
✔️ Esperado: tela de login funcional, acessível com `admin` / `Adm1n@5enha`

### 🧪 Testar aplicação Node.js com PM2
```bash
curl http://localhost:3000
```
✔️ Esperado: resposta `Servidor Node.js rodando com PM2!`

### 🧪 Testar Proxy Reverso para Node.js
```bash
curl http://mydomain.lan/app
```
✔️ Esperado: resposta da aplicação Node através do NGINX

### 🧪 Verificar status dos serviços
```bash
sudo systemctl status bind9
sudo systemctl status nginx
sudo systemctl status mariadb
sudo systemctl status php8.2-fpm
pm2 status
```
✔️ Todos os serviços devem estar com status **active (running)**

### 🧯 Diagnóstico rápido em caso de falhas
- **Logs do sistema**: `sudo journalctl -xe`
- **Logs do NGINX**: `/var/log/nginx/error.log`
- **Logs do PHP**: `/var/log/php8.2-fpm.log`
- **Logs do MariaDB**: `/var/log/mysql/error.log`
- **Logs do PM2**: `pm2 logs`

---

🎉 **Servidor Debian 12.11 configurado com sucesso!**  
📌 Todos os serviços estão ativos e integrados de forma segura e funcional.

> Próximo passo sugerido: realizar snapshots, backups e versionamento do ambiente.

---

Deseja exportar este guia como `.md`, `.pdf` ou outro formato? 📁