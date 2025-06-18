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

### ⚙️ Etapa 1: Editar configurações de pool PHP

Abra o arquivo principal do pool:

```bash
sudo nano /etc/php/8.2/fpm/pool.d/www.conf
```

Ajuste os seguintes parâmetros:

```ini
pm = dynamic
pm.max_children = 20
pm.start_servers = 4
pm.min_spare_servers = 2
pm.max_spare_servers = 8
pm.max_requests = 500
```

> 🔄 Estes valores são indicativos para servidores com até 2GB de RAM. Ajuste conforme seu hardware.

---

### 🧮 Etapa 2: Ativar buffer de saída e compressão (opcional)

Edite:

```bash
sudo nano /etc/php/8.2/fpm/php.ini
```

Ajuste:

```ini
output_buffering = 4096
zlib.output_compression = On
expose_php = Off
```

> 🔐 `expose_php = Off` remove a exposição da versão do PHP nas respostas HTTP.

---

### 🔁 Etapa 3: Reiniciar o serviço PHP-FPM

```bash
sudo systemctl restart php8.2-fpm
```

Verifique o status:

```bash
sudo systemctl status php8.2-fpm
```

Deve estar como **active (running)**.

---

Deseja que eu continue agora com o **Capítulo 4: Tuning do MariaDB**? 🗄️

