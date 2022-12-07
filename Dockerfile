FROM ubuntu:latest

RUN apt-get update && apt-get install -y iptables

CMD iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination 192.168.1.5:180 && \
    iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination 192.168.1.5:1443
