FROM node:20-slim

# Sistem kütüphaneleri
RUN apt-get update && apt-get install -y graphicsmagick ghostscript ca-certificates && rm -rf /var/lib/apt/lists/*

# En güncel n8n
RUN npm install -g n8n

# Port Ayarı
ENV N8N_PORT=7860
EXPOSE 7860

# Neon.tech Veritabanı Bağlantısı (Daha önce verdiğin bilgiler)
ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_HOST=ep-shy-wave-antpjuod-pooler.c-6.us-east-1.aws.neon.tech
ENV DB_POSTGRESDB_PORT=5432
ENV DB_POSTGRESDB_DATABASE=neondb
ENV DB_POSTGRESDB_USER=neondb_owner
ENV DB_POSTGRESDB_PASSWORD=npg_05NSHlMDdRxq
ENV DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false

# Güvenlik ve Arayüz Ayarları
ENV N8N_USER_MANAGEMENT_DISABLED=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
ENV N8N_COOKIES_SAME_SITE=lax
ENV N8N_CORS_ALLOWED_ORIGINS=*
ENV N8N_PROTOCOL=https

WORKDIR /home/node
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node

CMD ["node", "/usr/local/bin/n8n", "start"]
