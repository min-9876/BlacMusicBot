FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements first for layer caching
COPY requirements.txt .

# Cache ကို အတင်းဖျက်ပြီး အသစ်ပြန်သွင်းခိုင်းရန် (ဒီစာကြောင်းလေး တိုးလိုက်ပါ)
ARG CACHEBUST=1

RUN pip install --no-cache-dir -r requirements.txt

# Copy all bot files
COPY . .

# Create necessary directories
RUN mkdir -p cache downloads

CMD ["python", "-m", "BlacMusic"]
