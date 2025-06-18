# 🧰 Guia Completo de Configuração de Servidor Debian 12.11

> ✨ **Versão do Sistema**: Debian GNU/Linux 12.11 (Bookworm)\
> 🌐 **Hostname**: `server`\
> 🌐 **Domínio**: `mydomain.lan`\
> 🚀 **Endereço IP**: `192.168.0.254/24`\
> 🚪 **Gateway**: `192.168.0.1`\
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

### 🪧 Etapa 4: Configurar o fuso horário e localização

```bash
sudo dpkg-reconfigure tzdata
sudo apt install locales -y
sudo dpkg-reconfigure locales
```

### 🗂 Etapa 5: Estrutura inicial de diretórios para serviços web

```bash
sudo mkdir -p /var/www/mydomain.lan
sudo chown -R www-data:www-data /var/www/mydomain.lan
sudo chmod -R 755 /var/www
```

### ⛑️ Etapa 6: Criar usuário de administração para serviços

```bash
sudo adduser sgsa
sudo usermod -aG sudo,www-data sgsa
```

---

### 🔹 Próximos Capítulos

1. 🔍 Instalação e configuração do BIND9 como servidor DNS
2. 🌐 Instalação do NGINX
3. 💡 Integração com PHP 8.2 (FPM)
4. 📂 Instalação do MariaDB e phpMyAdmin
5. 🔧 Instalação do Node.js e PM2
6. ✅ Testes e validação dos serviços

---

Deseja que eu continue agora com o **Capítulo 2: DNS com BIND9**? 🚀

