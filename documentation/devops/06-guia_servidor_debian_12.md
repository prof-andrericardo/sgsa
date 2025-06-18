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

## 📂 5. Instalação do MariaDB e phpMyAdmin

...[conteúdo anterior mantido]...

---

## 🔧 6. Instalação do Node.js e PM2

### 🌐 Etapa 1: Adicionar o repositório oficial do Node.js (LTS)

```bash
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
```

### 🔍 Etapa 2: Verificar a instalação

```bash
node -v
npm -v
```

Você deve ver as versões atuais do Node.js e npm.

### 🔁 Etapa 3: Instalar o PM2 para gerenciamento de aplicações

```bash
sudo npm install -g pm2
```

### ⚙️ Etapa 4: Configurar o PM2 para iniciar na inicialização

```bash
pm2 startup systemd
sudo env PATH=$PATH:/usr/bin pm2 startup systemd -u sgsa --hp /home/sgsa
```

### ▶️ Etapa 5: Rodar uma aplicação de teste

Crie um app Node básico:

```bash
mkdir ~/meuapp
cd ~/meuapp
nano index.js
```

Conteúdo de exemplo:

```js
const http = require('http');
const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Servidor Node.js rodando com PM2!\n');
});
server.listen(3000);
console.log('Servidor rodando na porta 3000');
```

Inicie com PM2:

```bash
pm2 start index.js --name sgsa-app
pm2 save
```

Verifique:

```bash
curl http://localhost:3000
```

### 🌐 Etapa 6: Integrar o NGINX como proxy reverso (opcional)

No bloco do `mydomain.lan`, adicione:

```nginx
location /app {
    proxy_pass http://localhost:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
}
```

Recarregue o NGINX:

```bash
sudo nginx -t
sudo systemctl reload nginx
```

Acesse em: `http://mydomain.lan/app`

---

### 🔜 Próximo Capítulo

7. ✅ Testes e validação dos serviços

Deseja que eu continue com o **Capítulo 7: Testes e validação dos serviços**? ✅

