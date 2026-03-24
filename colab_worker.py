import os
import subprocess

def setup_n8n_on_colab():
    # n8n ve tünel kurulumu
    print("Sistem kuruluyor...")
    os.system('npm install -g n8n localtunnel')
    
    # Arka planda n8n başlat
    print("n8n başlatılıyor...")
    subprocess.Popen(['n8n', 'start', '--port', '5678'])
    
    # Dış dünyaya aç
    print("\n--- DİKKAT ---")
    print("Aşağıdaki URL'yi Render'daki n8n içinde 'HTTP Request' düğümüne yazacaksın:")
    os.system('npx localtunnel --port 5678')

if __name__ == "__main__":
    setup_n8n_on_colab()
