FROM python:3.10

WORKDIR /app

RUN apt-get update -y && \
    apt-get -y --no-install-recommends install \
    software-properties-common curl git
    
RUN curl -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -b /usr/local/bin

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD ["python3", "app.py"]
