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

### 🧪 Etapa 1: Ativar Gzip para compressão de conteúdo

Edite o arquivo de configuração principal:

```bash
sudo nano /etc/nginx/nginx.conf
```

Adicione dentro do bloco `http`:

```nginx
gzip on;
gzip_disable "msie6";
gzip_vary on;
gzip_proxied any;
gzip_comp_level 6;
gzip_buffers 16 8k;
gzip_http_version 1.1;
gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;
```

### 🚀 Etapa 2: Aumentar buffers e conexões simultâneas

Ainda dentro do bloco `http`:

```nginx
client_body_buffer_size 16K;
client_header_buffer_size 1k;
large_client_header_buffers 4 8k;
client_max_body_size 10M;
keepalive_timeout 65;
server_tokens off;
```

> 🔐 `server_tokens off` remove a versão do NGINX nas respostas HTTP, ajudando na segurança.

---

### 🗃️ Etapa 3: Habilitar cache de arquivos estáticos (CSS, JS, imagens)

No seu bloco de servidor (`/etc/nginx/sites-available/mydomain.lan`), adicione dentro do `server`:

```nginx
location ~* \.(jpg|jpeg|png|gif|ico|css|js)$ {
    expires 30d;
    access_log off;
    add_header Pragma public;
    add_header Cache-Control "public";
}
```

---

### 🧯 Etapa 4: Validar e aplicar as configurações

```bash
sudo nginx -t
sudo systemctl reload nginx
```

> ✅ Com essas configurações, o servidor NGINX estará mais leve, seguro e rápido.

---

Deseja que eu continue agora com o **Capítulo 3: Ajustes no PHP-FPM**? 💡

