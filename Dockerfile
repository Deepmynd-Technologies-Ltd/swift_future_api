FROM python:3.12-slim

# Install necessary system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libsystemd-dev \
    pkg-config \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Set environment variables
ENV PYTHONUNBUFFERED=1
WORKDIR /app

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files and the build script
COPY . .
COPY /build.sh .

# Make the build script executable
RUN chmod +x build.sh

# Set entry point to the build script
ENTRYPOINT [ "sh", "build.sh" ]
