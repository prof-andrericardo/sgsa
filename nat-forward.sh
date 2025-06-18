#!/bin/bash

echo "net.ipv4.ip_forward=1" | sudo tee -a /etc/sysctl.conf

# Interface que recebe conexões da rede externa
EXT_IF="enp3s0"

# IP da VM destino
VM_IP="10.15.15.254"

# Redirecionamento de portas TCP
for PORT in 80 8080 443 3306 3000 22 21 20; do
  sudo iptables -t nat -A PREROUTING -i $EXT_IF -p tcp --dport $PORT -j DNAT --to-destination $VM_IP:$PORT
  sudo iptables -A FORWARD -p tcp -d $VM_IP --dport $PORT -j ACCEPT
done

# Redirecionamento da porta UDP 53 (DNS)
sudo iptables -t nat -A PREROUTING -i $EXT_IF -p udp --dport 53 -j DNAT --to-destination $VM_IP:53
sudo iptables -A FORWARD -p udp -d $VM_IP --dport 53 -j ACCEPT

# Garantir resposta correta da VM para os clientes
sudo iptables -t nat -A POSTROUTING -s 192.168.0.0/22 -d $VM_IP -j MASQUERADE
