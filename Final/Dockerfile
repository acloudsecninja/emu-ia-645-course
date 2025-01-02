# Use a lightweight Python base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Expose port 8001
EXPOSE 8001

# Set environment variables (API key is passed at runtime)
ENV PYTHONUNBUFFERED=1

# Run the application
CMD ["python", "app.py"]
