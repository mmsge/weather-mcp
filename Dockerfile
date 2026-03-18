FROM ghcr.io/astral-sh/uv:python3.10-bookworm-slim

WORKDIR /app

COPY . /app

RUN (uv venv .venv) && (. .venv/bin/activate) && (uv pip install -e .)

ENV PORT=8080
EXPOSE 8080

CMD ["uv", "run", "python", "-m", "mcp_weather_server", "--mode", "streamable-http", "--host", "0.0.0.0", "--port", "8080"]
