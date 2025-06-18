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

### 📦 Etapa 1: Backup antes de modificar

Antes de alterar configurações sensíveis:

```bash
sudo cp /etc/mysql/mariadb.conf.d/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf.bkp
```

### 🛠️ Etapa 2: Editar configurações principais do MariaDB

```bash
sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
```

Ajuste ou adicione dentro da seção `[mysqld]`:

```ini
innodb_buffer_pool_size = 512M
innodb_log_file_size = 128M
innodb_flush_method = O_DIRECT
innodb_file_per_table = 1
query_cache_type = 0
query_cache_size = 0
slow_query_log = 1
slow_query_log_file = /var/log/mysql/slow.log
long_query_time = 2
```

> ⚙️ Ajuste `innodb_buffer_pool_size` para 50-70% da RAM total em servidores dedicados ao banco.

Crie o arquivo de log, se necessário:

```bash
sudo touch /var/log/mysql/slow.log
sudo chown mysql:mysql /var/log/mysql/slow.log
```

---

### 🔁 Etapa 3: Reiniciar e validar o serviço

```bash
sudo systemctl restart mariadb
sudo systemctl status mariadb
```

### 📊 Etapa 4: Monitoramento e diagnóstico do banco

Ver comandos úteis:

```bash
mysqladmin -u root -p processlist
mysql -u root -p -e "SHOW STATUS LIKE 'Threads%';"
```

> ✅ Com essas otimizações, o MariaDB passa a oferecer maior desempenho e visibilidade de queries lentas para análise futura.

---

Deseja que eu continue agora com o **Capítulo 5: Melhorias no DNS (BIND9)**? 📡

