FROM n8nio/n8n:latest

USER root
# Install git and openssh for backup scripts
RUN apk add --no-cache git openssh-client

ENV N8N_PORT=$PORT
# Setting some defaults for Render
ENV NODE_ENV=production
ENV N8N_PROTOCOL=https
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
ENV NODES_EXCLUDE="[]"
ENV N8N_NODES_EXCLUDE="[]"

USER node
