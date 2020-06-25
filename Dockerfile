FROM ruby:2.7.1-alpine3.12
COPY locale /etc/default/locale
COPY main.sh /main.sh
RUN apk --update add git bash && \
    cd /opt && \
    git clone https://github.com/beefproject/beef.git && \
    cd /opt/beef && \
    printf 'Y\n' | ./install && \
    chmod a+x /main.sh

ENV LANGUAGE en_US.UTF-
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
EXPOSE 3000
EXPOSE 6789
ENTRYPOINT ["/main.sh"] 
