FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    gstreamer1.0-plugins-base \
    libgstreamer1.0-0 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

# COMANDO ATUALIZADO EXCLUSIVO PARA O FLET:
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]