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

CMD ["gunicorn", "main:app", "-b", "0.0.0.0:8000", "-k", "uvicorn.workers.UvicornWorker"]