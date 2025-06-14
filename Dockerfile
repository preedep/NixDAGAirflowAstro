# 1. ใช้ Astro Runtime Image ที่รวม Airflow มาให้แล้ว
FROM quay.io/astronomer/astro-runtime:9.2.0

# 2. คัดลอกไฟล์ requirements.txt แล้วติดตั้ง Python packages เพิ่มเติม
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 3. (Optional) ติดตั้ง System Packages เพิ่ม ถ้าจำเป็น
# RUN apt-get update && apt-get install -y curl gcc libpq-dev

# 4. คัดลอกไฟล์ทั้งหมดของโปรเจกต์ (DAGs, plugins, include, ฯลฯ)
COPY . .
# 5. ตั้ง working directory ให้ตรงกับ Airflow path
WORKDIR /usr/local/airflow