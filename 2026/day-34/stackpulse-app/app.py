from flask import Flask, render_template
import os
import time

import psycopg2
import redis

app = Flask(__name__)


def database_connection():
    return psycopg2.connect(
        host=os.getenv("DB_HOST", "db"),
        port=os.getenv("DB_PORT", "5432"),
        dbname=os.getenv("POSTGRES_DB", "appdb"),
        user=os.getenv("POSTGRES_USER", "appuser"),
        password=os.getenv("POSTGRES_PASSWORD", "apppassword"),
    )


def initialize_database():
    for attempt in range(10):
        try:
            with database_connection() as connection:
                with connection.cursor() as cursor:
                    cursor.execute(
                        "CREATE TABLE IF NOT EXISTS visits "
                        "(id SERIAL PRIMARY KEY, message TEXT NOT NULL)"
                    )
                    cursor.execute(
                        "INSERT INTO visits (message) VALUES (%s) RETURNING id",
                        ("Hello from Flask",),
                    )
                    return cursor.fetchone()[0]
        except psycopg2.OperationalError:
            if attempt == 9:
                raise
            time.sleep(2)


@app.get("/")
def index():
    visit_id = initialize_database()
    cache = redis.Redis(
        host=os.getenv("REDIS_HOST", "cache"),
        port=int(os.getenv("REDIS_PORT", "6379")),
        decode_responses=True,
    )
    cache.set("last_visit", str(visit_id), ex=60)
    return render_template(
        "index.html",
        database="Connected",
        cache="Connected",
        visit_id=visit_id,
        cached_visit=cache.get("last_visit"),
    )


@app.get("/health")
def health():
    return {"status": "ok"}


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

