FROM ruby:3.4.3-alpine3.21
COPY locale /etc/default/locale
COPY main.sh /main.sh
RUN apk --update add git bash curl-dev && \
    cd /opt && \
    git clone --depth=1 https://github.com/beefproject/beef.git && \
    cd /opt/beef && \
    sed -i 's/ncurses5/ncurses/g' install && \
    sed -i 's/libressl-dev//g' install && \
    printf 'Y\n' | ./install && \
    chmod a+x /main.sh

ENV LANGUAGE=en_US.UTF-
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
EXPOSE 3000
EXPOSE 6789
ENTRYPOINT ["/main.sh"] 
