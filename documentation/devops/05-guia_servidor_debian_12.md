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

...[conteúdo anterior mantido]...

---

## 📂 5. Instalação do MariaDB e phpMyAdmin

### 🧱 Etapa 1: Instalar o MariaDB

```bash
sudo apt install mariadb-server mariadb-client -y
```

### 🔒 Etapa 2: Proteger a instalação com script de segurança

```bash
sudo mysql_secure_installation
```

Recomendações durante o script:

- Definir senha de root (mesmo que você use usuários separados)
- Remover usuários anônimos
- Desabilitar login remoto do root
- Remover banco de teste
- Aplicar alterações

### 🧪 Etapa 3: Testar acesso local ao banco

```bash
sudo mysql -u root -p
```

### 👤 Etapa 4: Criar usuário de administração

```sql
CREATE USER 'admin_sgsa'@'%' IDENTIFIED BY '@Aluno#Tec';
GRANT ALL PRIVILEGES ON *.* TO 'admin_sgsa'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

> 💡 O usuário `admin_sgsa` terá acesso total e remoto.

### 🌐 Etapa 5: Configurar MariaDB para aceitar conexões externas

Edite:

```bash
sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
```

Altere:

```ini
bind-address = 0.0.0.0
```

Depois:

```bash
sudo systemctl restart mariadb
```

---

### 🧭 Etapa 6: Instalar phpMyAdmin

```bash
sudo apt install phpmyadmin -y
```

Durante a instalação:

- Escolha **nginx** como servidor web: **[Espaço] para desmarcar Apache, [Tab] para continuar**
- Escolha **configurar dbconfig-common**: Sim
- Informe a senha do usuário `phpmyadmin` (ex: `Adm1n@5enha`)

Se o NGINX não configurar automaticamente, crie um link manual:

```bash
sudo ln -s /usr/share/phpmyadmin /var/www/mydomain.lan/html/phpmyadmin
```

### 🔐 Etapa 7: Restringir acesso ao phpMyAdmin (opcional)

Adicione no bloco do servidor:

```nginx
location /phpmyadmin {
    allow 127.0.0.1;
    allow 192.168.0.0/24;
    deny all;
}
```

### ✅ Etapa 8: Teste de acesso ao phpMyAdmin

Acesse:

```
http://mydomain.lan/phpmyadmin
```

Login:

- **Usuário**: `admin`
- **Senha**: `Adm1n@5enha`

---

### 🔜 Próximos Capítulos

6. 🔧 Instalação do Node.js e PM2
7. ✅ Testes e validação dos serviços

Deseja que eu continue agora com o **Capítulo 6: Instalação do Node.js e PM2**? 🔧

