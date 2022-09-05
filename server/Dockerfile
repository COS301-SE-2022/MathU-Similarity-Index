FROM alpine:latest

RUN apk add --no-cache python3-dev \
    && apk add --no-cache py-pip \
    && pip install --upgrade pip

WORKDIR /server

COPY . /server

RUN pip --no-cache-dir install -r requirements.txt                                                                            

EXPOSE 5000

ENTRYPOINT  ["flask","run", "--host=0.0.0.0"]