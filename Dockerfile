# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables to ensure that Python output is sent straight to terminal (without buffering)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set a working directory for the app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 3000 for Flask (Render expects this port)
EXPOSE 3000

# Run the Flask app with Gunicorn for production
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:3000"]
