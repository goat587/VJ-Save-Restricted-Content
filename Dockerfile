FROM python:3.10.8-slim-buster
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

# Use PORT environment variable from Render, default to 10000
CMD gunicorn --bind 0.0.0.0:${PORT:-10000} app:app & python3 bot.py &
