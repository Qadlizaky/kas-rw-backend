# 1. Menggunakan base image Python resmi yang ringan
FROM python:3.10-slim

# 2. Mengatur direktori kerja di dalam container
WORKDIR /app

# 3. Menyalin file requirements terlebih dahulu agar proses build cepat (caching)
COPY requirements.txt .

# 4. Menginstal seluruh library dependencies di dalam container
RUN pip install --no-cache-dir -r requirements.txt

# 5. Menyalin seluruh kode aplikasi dari laptop ke dalam container
COPY . .

# 6. Membuka port 8000 di dalam container
EXPOSE 8000

# 7. Perintah utama untuk menyalakan FastAPI saat container dijalankan
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]