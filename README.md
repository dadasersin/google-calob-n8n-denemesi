# n8n + Render + Colab Project

Bu proje, n8n'i **Render** üzerinde Docker kullanarak çalıştırır, verilerini **Neon.tech** Postgres veritabanında saklar ve ağır işlemleri **Google Colab** üzerinden yönetmenizi sağlar.

## 🚀 Kurulum Adımları

### 1. Neon.tech Veritabanı
*   [Neon.tech](https://neon.tech) üzerinden ücretsiz bir Postgres veritabanı oluşturun.
*   Bağlantı dizesini (Connection string) not edin.

### 2. Render Deployment
*   Render üzerinde "New Web Service" oluşturun.
*   Bu GitHub reposunu bağlayın.
*   **Runtime:** `Docker` seçin.
*   **Environment Variables:** Aşağıdaki değişkenleri ekleyin:
    *   `DB_TYPE`: `postgresdb`
    *   `DB_POSTGRESDB_DATABASE`: (Neon DB Adı)
    *   `DB_POSTGRESDB_HOST`: (Neon Host)
    *   `DB_POSTGRESDB_PORT`: `5432`
    *   `DB_POSTGRESDB_USER`: (Neon Kullanıcı)
    *   `DB_POSTGRESDB_PASSWORD`: (Neon Şifre)
    *   `N8N_BASIC_AUTH_ACTIVE`: `true`
    *   `N8N_BASIC_AUTH_USER`: (Sizin Kullanıcı Adınız)
    *   `N8N_BASIC_AUTH_PASSWORD`: (Sizin Şifreniz)

### 3. Google Colab
*   `colab_worker.ipynb` dosyasını Google Colab'da açın.
*   n8n webhook URL'sini güncelleyerek işlemleri başlatın.

### 4. Otomatik Yedekleme (GitHub)
*   GitHub üzerinde bir **Personal Access Token (PAT)** oluşturun.
*   n8n içinde `backup.sh` betiğini çalıştıracak bir workflow kurarak yedeklemeleri GitHub'a otomatik push edebilirsiniz.

---
**Geliştirici:** erSin
