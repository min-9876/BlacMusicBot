FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Cache ကို လုံးဝ အလုပ်မလုပ်စေဘဲ တစ်ဖိုင်လုံး အသစ်ပြန်ဆောက်ခိုင်းရန် (ထိပ်ဆုံးမှာ ထားရပါမယ်)
ARG CACHEBUST=2

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all bot files
COPY . .

# Create necessary directories
RUN mkdir -p cache downloads

CMD ["python", "-m", "BlacMusic"]
