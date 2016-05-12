FROM alpine:edge

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
 && apk add --update --no-cache kubernetes \
 && ln -s /usr/bin/hyperkube / \
 && ln -s /usr/bin/kubectl / \
 && mv /usr/bin/kubectl /tmp \
 && rm -f /usr/bin/kube* \
 && mv /tmp/kubectl /usr/bin

CMD["/hyperkube"]

RUN rm -rf /var/apk/cache
