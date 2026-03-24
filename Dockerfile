FROM n8nio/n8n:latest

USER root
# Install git and openssh for backup scripts
RUN apk add --no-cache git openssh-client

ENV N8N_PORT=$PORT
# Setting some defaults for Render
ENV NODE_ENV=production
ENV N8N_PROTOCOL=https

USER node
