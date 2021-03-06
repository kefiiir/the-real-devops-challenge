FROM alpine:3.8

LABEL maintainer="oleg.blazhyievskyi@gmail.com"

WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN apk --no-cache add python3 &&\
    pip3 install --no-cache-dir -r requirements.txt &&\
    pip3 uninstall -y setuptools pip &&\
    rm /app/requirements.txt &&\
    adduser -S -h /app app daemon

COPY app.py /app/app.py
COPY src /app/src/

EXPOSE 8080
USER app
CMD ["python3", "app.py"]
