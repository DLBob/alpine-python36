FROM alpine:3.7

RUN apk add --no-cache --purge -uU python3 python3-dev gcc musl-dev
RUN if [[ ! -e /usr/bin/python ]];        then ln -sf /usr/bin/python3.6 /usr/bin/python; fi
RUN if [[ ! -e /usr/bin/python-config ]]; then ln -sf /usr/bin/python3.6-config /usr/bin/python-config; fi
RUN if [[ ! -e /usr/bin/easy_install ]];  then ln -sf /usr/bin/easy_install-3.6 /usr/bin/easy_install; fi
RUN easy_install pip
RUN pip install --upgrade pip setuptools -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
RUN if [[ ! -e /usr/bin/pip ]]; then ln -sf /usr/bin/pip3.6 /usr/bin/pip; fi;
RUN rm -rf /var/cache/apk/* /tmp/*
