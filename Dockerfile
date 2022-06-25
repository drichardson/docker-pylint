FROM python:3.9.13-slim

ARG pylint_version=NOTSET

RUN pip install pylint==$pylint_version

ENTRYPOINT ["pylint"]
