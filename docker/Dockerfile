FROM python:3.13-alpine

WORKDIR /app

RUN apk add --no-cache curl

COPY app/requirements.txt .

RUN pip install --no-cache-dir  -r requirements.txt

COPY app/ .

EXPOSE 5000

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:5000/health || exit 1

CMD ["gunicorn", "app:myapp"]
