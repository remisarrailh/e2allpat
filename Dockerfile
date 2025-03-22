FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/synthsofts/e2allpat.git . && \
    pip install --no-cache-dir -r requirements.txt

ENV FLASK_APP=e2wa.py
ENV FLASK_ENV=production

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app", "--timeout", "90"]
