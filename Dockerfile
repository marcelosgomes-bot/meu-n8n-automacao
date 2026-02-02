# Etapa 1: Pega o FFmpeg já compilado e pronto de uma imagem oficial de mídia
FROM mwader/static-ffmpeg:6.1.1 AS ffmpeg-provider

# Etapa 2: Usa a sua imagem do n8n
FROM n8nio/n8n:latest

# Entra como root apenas para colocar o motor no lugar
USER root

# Copia os binários diretamente da imagem de mídia para a pasta de execução do n8n
COPY --from=ffmpeg-provider /ffmpeg /usr/local/bin/
COPY --from=ffmpeg-provider /ffprobe /usr/local/bin/

# Garante que o n8n tenha permissão de usar os arquivos
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

# Volta para o usuário padrão
USER node
