# 🧰 Guia Completo de Configuração de Servidor Debian 12.11

> ✨ **Versão do Sistema**: Debian GNU/Linux 12.11 (Bookworm)\
> 🌐 **Hostname**: `server`\
> 🌐 **Domínio**: `mydomain.lan`\
> 🚀 **Endereço IP**: `192.168.0.254/24`\
> 🔐 **Gateway**: `192.168.0.1`\
> 🔎 **DNS Forwarders**: Cloudflare (`1.1.1.1`), Google (`8.8.8.8`), OpenDNS (`208.67.222.222`)

---

## 📅 1. Configuração Pós-Instalação do Debian 12.11

### 🔧 Etapa 1: Atualização do Sistema

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install net-tools curl wget unzip htop bash-completion sudo -y
```

### 🌌 Etapa 2: Configuração de Hostname e Domínio

```bash
echo 'server' | sudo tee /etc/hostname
echo '127.0.1.1 server.mydomain.lan server' | sudo tee -a /etc/hosts
sudo hostnamectl set-hostname server
```

> ℹ️ Reinicie o sistema para aplicar completamente a mudança de hostname:

```bash
sudo reboot
```

### 🌐 Etapa 3: Configuração de IP Estático

Edite o arquivo da interface de rede:

```bash
sudo nano /etc/network/interfaces
```

Exemplo para interface `enp0s3`:

```ini
auto enp0s3
iface enp0s3 inet static
    address 192.168.0.254/24
    gateway 192.168.0.1
    dns-nameservers 1.1.1.1 8.8.8.8 208.67.222.222
```

> ⚠️ **Importante**: Confirme o nome da sua interface com `ip a`

Depois reinicie a rede:

```bash
sudo systemctl restart networking
```

### 🪷 Etapa 4: Configurar o fuso horário e localização

```bash
sudo dpkg-reconfigure tzdata
sudo apt install locales -y
sudo dpkg-reconfigure locales
```

### 🗂️ Etapa 5: Estrutura inicial de diretórios para serviços web

```bash
sudo mkdir -p /var/www/mydomain.lan
sudo chown -R www-data:www-data /var/www/mydomain.lan
sudo chmod -R 755 /var/www
```

### 🛡️ Etapa 6: Criar usuário de administração para serviços

```bash
sudo adduser sgsa
sudo usermod -aG sudo,www-data sgsa
```

---

## 🧭 2. Instalação e Configuração do Servidor DNS com BIND9

### 📦 Etapa 1: Instalar o pacote do BIND9

```bash
sudo apt install bind9 bind9utils bind9-doc dnsutils -y
```

### 🗃️ Etapa 2: Configuração do serviço de resolução (cache + autoridade)

#### Arquivo `/etc/bind/named.conf.options`

```bash
sudo nano /etc/bind/named.conf.options
```

Adicione ou edite:

```conf
options {
    directory "/var/cache/bind";

    recursion yes;
    allow-query { any; };

    forwarders {
        1.1.1.1;
        8.8.8.8;
        208.67.222.222;
    };

    dnssec-validation auto;
};
```

#### Arquivo `/etc/bind/named.conf.local`

```bash
sudo nano /etc/bind/named.conf.local
```

Adicione a zona:

```conf
zone "mydomain.lan" {
    type master;
    file "/etc/bind/zones/db.mydomain.lan";
};
```

Crie a pasta de zonas:

```bash
sudo mkdir -p /etc/bind/zones
```

#### Criar o arquivo da zona:

```bash
sudo nano /etc/bind/zones/db.mydomain.lan
```

Conteúdo:

```dns
$TTL 604800
@   IN  SOA server.mydomain.lan. root.mydomain.lan. (
        2         ; Serial
        604800    ; Refresh
        86400     ; Retry
        2419200   ; Expire
        604800 )  ; Negative Cache TTL
;
@       IN  NS      server.mydomain.lan.
@       IN  A       192.168.0.254

server  IN  A       192.168.0.254
www     IN  CNAME   server.mydomain.lan.
ftp     IN  CNAME   server.mydomain.lan.
gateway IN  CNAME   server.mydomain.lan.
pop     IN  CNAME   server.mydomain.lan.
pop3    IN  CNAME   server.mydomain.lan.
mail    IN  CNAME   server.mydomain.lan.
smtp    IN  CNAME   server.mydomain.lan.
```

### 🧪 Etapa 3: Validar e reiniciar serviço

```bash
sudo named-checkconf
sudo named-checkzone mydomain.lan /etc/bind/zones/db.mydomain.lan
sudo systemctl restart bind9
```

### 📡 Etapa 4: Testes básicos de resolução

```bash
dig @192.168.0.254 mydomain.lan
host www.mydomain.lan 192.168.0.254
```

> ✅ Se tudo estiver correto, os nomes devem resolver para `192.168.0.254`

---

### 🔜 Próximos Capítulos

3. 🌐 Instalação do NGINX
4. 💡 Integração com PHP 8.2 (FPM)
5. 📂 Instalação do MariaDB e phpMyAdmin
6. 🔧 Instalação do Node.js e PM2
7. ✅ Testes e validação dos serviços

Deseja que eu continue agora com o **Capítulo 3: Instalação do NGINX**? 🌐

