FROM ubuntu:latest
RUN apt update && apt install -y sudo

RUN apt install python3 -y
RUN apt install python3-pip -y
RUN pip install flask --break-system-packages

COPY main.py ./
RUN mkdir ./html/
COPY html/index.html ./html/
RUN mkdir ./html/static
COPY html/static/general.css ./html/static/

EXPOSE 80

CMD ["flask", "--app", "main", "run", "-h", "0.0.0.0", "-p", "80"]