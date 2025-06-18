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

### ⚙️ Etapa 1: Ajustes do Kernel com `sysctl`

Crie/edite o arquivo:

```bash
sudo nano /etc/sysctl.d/99-otimizacoes.conf
```

Adicione:

```conf
# Melhor desempenho de rede
net.core.somaxconn = 1024
net.core.netdev_max_backlog = 5000
net.ipv4.tcp_max_syn_backlog = 2048
net.ipv4.tcp_fin_timeout = 15
net.ipv4.tcp_tw_reuse = 1

# Proteções básicas
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1

# Evita ataques de SYN flood
net.ipv4.tcp_syncookies = 1
```

Aplique as mudanças:

```bash
sudo sysctl --system
```

---

### 📊 Etapa 2: Ajustar Limites de Arquivos e Processos (ulimits)

Edite o arquivo de limites:

```bash
sudo nano /etc/security/limits.conf
```

Adicione no final:

```conf
* soft nofile 65535
* hard nofile 65535
* soft nproc 65535
* hard nproc 65535
```

Garanta que o PAM suporte esteja ativo:

```bash
sudo nano /etc/pam.d/common-session
```

Verifique se há:

```conf
session required pam_limits.so
```

Edite o profile do bash (opcional):

```bash
echo 'ulimit -n 65535' | sudo tee -a /etc/profile
```

---

### 🧩 Etapa 3: Otimização do uso de Swap

Verifique o valor atual:

```bash
cat /proc/sys/vm/swappiness
```

Recomenda-se reduzir para 10 ou 20 em servidores:

```bash
echo 'vm.swappiness=10' | sudo tee /etc/sysctl.d/60-swap.conf
sudo sysctl --system
```

> 💡 **Swappiness** define com que frequência o kernel move processos para a memória swap. Valores menores priorizam RAM.

---

Deseja que eu continue agora com o **Capítulo 2: Otimizações do Servidor Web NGINX**? 🌐

