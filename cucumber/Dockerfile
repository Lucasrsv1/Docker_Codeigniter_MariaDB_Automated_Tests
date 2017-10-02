FROM ruby:2.3
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        bzip2 \
        libfontconfig \
        curl

RUN echo "alias bec='bundle exec cucumber --tags ~@wip'" >> /root/.bashrc
RUN echo "alias bi='bundle install'" >> /root/.bashrc
RUN echo "America/Sao_Paulo" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN bundle install