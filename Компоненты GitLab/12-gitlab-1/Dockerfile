FROM centos:7

RUN yum update -y && yum install -y python3 python3-pip curl
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt 

ADD python-api.py /python_api/python-api.py

WORKDIR /python_api

CMD python3 python-api.py
