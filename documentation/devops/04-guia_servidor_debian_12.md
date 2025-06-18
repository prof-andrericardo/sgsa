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

## 🌐 3. Instalação e Configuração do Servidor Web com NGINX

...[conteúdo anterior mantido]...

---

## 💡 4. Integração do PHP 8.2 com NGINX (via FPM)

### 📦 Etapa 1: Instalar o PHP 8.2 e extensões básicas
```bash
sudo apt install php8.2 php8.2-fpm php8.2-mysql php8.2-cli php8.2-curl php8.2-xml php8.2-mbstring php8.2-zip -y
```

### ⚙️ Etapa 2: Iniciar e habilitar o PHP-FPM
```bash
sudo systemctl enable php8.2-fpm
sudo systemctl start php8.2-fpm
```

### 🧪 Etapa 3: Verificar o status do PHP-FPM
```bash
systemctl status php8.2-fpm
```
Deve aparecer como **active (running)**.

### 🛠️ Etapa 4: Ajustar o bloco do servidor NGINX para suportar PHP
Edite o arquivo do virtual host:
```bash
sudo nano /etc/nginx/sites-available/mydomain.lan
```
Atualize o conteúdo para incluir o bloco de PHP:
```nginx
server {
    listen 80;
    server_name mydomain.lan www.mydomain.lan;

    root /var/www/mydomain.lan/html;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.2-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

### 🔁 Etapa 5: Testar integração com arquivo PHP
Crie um arquivo `info.php` para testar:
```bash
echo '<?php phpinfo(); ?>' | sudo tee /var/www/mydomain.lan/html/info.php
```

Recarregue o NGINX:
```bash
sudo nginx -t
sudo systemctl reload nginx
```

Acesse pelo navegador:
```
http://mydomain.lan/info.php
```
Você verá a tela com informações completas do PHP se tudo estiver funcionando corretamente.

---

### 🔜 Próximos Capítulos
5. 📂 Instalação do MariaDB e phpMyAdmin
6. 🔧 Instalação do Node.js e PM2
7. ✅ Testes e validação dos serviços

Deseja que eu continue agora com o **Capítulo 5: Instalação do MariaDB e phpMyAdmin**? 📂

