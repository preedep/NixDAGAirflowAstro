# ใช้ Astro Runtime Image ที่มี Airflow + Python อยู่แล้ว
FROM quay.io/astronomer/astro-runtime:9.2.0

# ติดตั้ง Python packages จากไฟล์ requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# คัดลอก DAGs และไฟล์ที่เกี่ยวข้องเข้าไปใน image
COPY . .

# ตั้ง working directory (ถ้าจำเป็น)
WORKDIR /usr/local/airflow