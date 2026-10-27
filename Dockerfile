
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    IN_CONTAINER=1
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py mail.py oauth.py ./

EXPOSE 5180

ENV HOST=0.0.0.0 \
    PORT=5180

CMD ["python", "app.py"]
