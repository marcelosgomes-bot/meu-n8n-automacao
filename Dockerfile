# Força o uso da versão Debian estável do n8n
FROM n8nio/n8n:latest

USER root

# Usa o comando 'apt' (mais moderno) e limpa tudo para não dar erro de espaço
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*

USER node
