# 🧰 Guia Completo de Configuração de Servidor Debian 12.11

> ✨ **Versão do Sistema**: Debian GNU/Linux 12.11 (Bookworm)  
> 🌐 **Hostname**: `server`  
> 🌐 **Domínio**: `mydomain.lan`  
> 🚀 **Endereço IP**: `192.168.0.254/24`  
> 🔐 **Gateway**: `192.168.0.1`  
> 🔎 **DNS Forwarders**: Cloudflare (`1.1.1.1`), Google (`8.8.8.8`), OpenDNS (`208.67.222.222`)

---

## 📅 1. Configuração Pós-Instalação do Debian 12.11

...[conteúdo anterior mantido]...

---

## 🌐 3. Instalação e Configuração do Servidor Web com NGINX

### 📦 Etapa 1: Instalar o NGINX
```bash
sudo apt install nginx -y
```

### ⚙️ Etapa 2: Iniciar e habilitar o serviço
```bash
sudo systemctl enable nginx
sudo systemctl start nginx
```

### 🔍 Etapa 3: Verificar se está funcionando
Acesse via navegador ou terminal:
```bash
curl http://localhost
```
Deve retornar a página padrão do NGINX: **"Welcome to nginx!"**

### 🗂️ Etapa 4: Estrutura de diretórios e permissões
```bash
sudo mkdir -p /var/www/mydomain.lan/html
sudo chown -R www-data:www-data /var/www/mydomain.lan
sudo chmod -R 755 /var/www/mydomain.lan
```

### 📄 Etapa 5: Criar um arquivo `index.html` de teste
```bash
echo '<h1>Servidor NGINX ativo - mydomain.lan</h1>' | sudo tee /var/www/mydomain.lan/html/index.html
```

### 📝 Etapa 6: Criar o bloco de servidor (Virtual Host)
```bash
sudo nano /etc/nginx/sites-available/mydomain.lan
```
Conteúdo:
```nginx
server {
    listen 80;
    server_name mydomain.lan www.mydomain.lan;

    root /var/www/mydomain.lan/html;
    index index.html index.htm index.php;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

### 🔗 Etapa 7: Habilitar o site
```bash
sudo ln -s /etc/nginx/sites-available/mydomain.lan /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

### 🧪 Etapa 8: Testar acesso local
```bash
curl http://mydomain.lan
```
Ou acesse pelo navegador: `http://mydomain.lan`

Se aparecer a mensagem "Servidor NGINX ativo - mydomain.lan", a configuração foi concluída com sucesso!

---

### 🔜 Próximos Capítulos
4. 💡 Integração com PHP 8.2 (FPM)
5. 📂 Instalação do MariaDB e phpMyAdmin
6. 🔧 Instalação do Node.js e PM2
7. ✅ Testes e validação dos serviços

Deseja que eu continue agora com o **Capítulo 4: Integração do PHP 8.2 com NGINX (via FPM)**? 💡

