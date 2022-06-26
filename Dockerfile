# https://snyk.io/blog/best-practices-containerizing-python-docker/
FROM python:alpine3.16 as base

FROM base as builder

WORKDIR /usr/app
RUN python -m venv /usr/app/venv
ENV PATH="/usr/app/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt
RUN find /usr/app/venv -name '*.pyc' -exec rm "{}" \;

FROM base as app
WORKDIR /data

COPY --from=builder /usr/app/venv /usr/app/venv

ENV PATH="/usr/app/venv/bin:$PATH"
ENTRYPOINT ["pylint"]
CMD ["--help"]
