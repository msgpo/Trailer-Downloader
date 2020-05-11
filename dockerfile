FROM alpine:edge
COPY settings.ini download_all.py requirements.txt /
RUN apk update && apk upgrade && apk add python3 py3-pip && python3 -m pip install -r requirements.txt && echo '* 8 * * * python3 download_all.py --directory /movies' | crontab -
CMD crond -f