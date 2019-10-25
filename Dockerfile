FROM hashicorp/terraform:0.12.12
MAINTAINER "AltoStack <info@altostack.io>"

RUN apk add --update --no-cache \
        make \
        bash \
        python3 \
        jq && \
    pip3 install --upgrade pip && \
    pip3 install \
        awscli

COPY --from=gosu/assets /opt/gosu /opt/gosu
RUN /opt/gosu/gosu.install.sh && rm -fr /opt/gosu

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENV HOME /home/terraform

VOLUME ["/opt/app"]
WORKDIR /opt/app

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["--version"]
