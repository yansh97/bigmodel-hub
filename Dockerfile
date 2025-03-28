FROM python:3.12.9-slim

WORKDIR /code

ENV PYTHONPATH=/code
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN python3.12 -m pip install --no-cache-dir --upgrade bigmodel-hub

ENTRYPOINT ["bmhub"]
CMD ["--help"]
