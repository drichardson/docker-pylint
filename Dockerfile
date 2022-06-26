FROM python:3.9.13-slim
WORKDIR /data

COPY pylint_version.txt /

RUN pip install pylint==$(cat /pylint_version.txt)

ENTRYPOINT ["pylint"]
CMD ["--help"]
