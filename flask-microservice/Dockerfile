###Build the Flask application
FROM python:3.9-slim AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

###Creating the final lightweight image
FROM python:3.9-slim
WORKDIR /app

###Copying the built Flask application from the builder stage
COPY --from=builder /app .

###Flask port will run on 2727
EXPOSE 2727

#####Running the Flask app
CMD ["python", "app.py"]

