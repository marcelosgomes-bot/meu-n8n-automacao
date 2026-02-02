# Usa a imagem oficial (baseada em Alpine)
FROM n8nio/n8n:latest

# Entra como root para ter poder de instalação
USER root

# Instala o FFmpeg usando o APK (instalador nativo do Alpine)
RUN apk add --no-cache ffmpeg

# Volta para o usuário padrão para manter a segurança
USER node
