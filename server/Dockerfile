FROM alpine:latest

RUN apk add --no-cache python3-dev \
    && apk add --no-cache py-pip \
    && pip install --upgrade pip

WORKDIR /server

COPY . /server

RUN pip --no-cache-dir install -r requirements.txt                                                                            

EXPOSE 5000

# ENTRYPOINT  ["flask", "run", "-p", "5000", "-h", "0.0.0.0"]
# ENTRYPOINT  ["flask", "run", "-p", "5000", "-h", "mathuapi.azurewebsites.net"]
# ENTRYPOINT  ["flask", "run", "-p", "5000", "-h", "102.133.250.161"]
# ENTRYPOINT  ["flask", "run", "-p", "5000", "-h", "https://mathu-similarity-index.herokuapp.com/"]
ENTRYPOINT  ["flask", "run"]