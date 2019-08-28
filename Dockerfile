# Docker image based on python stretch official image
# Jupyter server runs as tutorial user
# Install Jupyter extensions
# Install node
FROM python:3.7.3-stretch
ARG TUT_USER=tutorial
ARG TUT_USER__DIR=/home/$TUT_USER
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - 
RUN apt-get install -y nodejs
RUN groupadd -g 999 $TUT_USER && \
    useradd -m -u 999 -g $TUT_USER $TUT_USER
EXPOSE 8888
USER $TUT_USER
WORKDIR $TUT_USER__DIR
COPY initenv.sh .
COPY requirements.txt .
COPY run.sh .
USER root
RUN chown -R  $TUT_USER:$TUT_USER $TUT_USER__DIR
USER $TUT_USER
WORKDIR $TUT_USER__DIR
RUN /bin/bash ./initenv.sh
ENV APP_DIR $TUT_USER__DIR/app
ENV TUT_USER__DIR $TUT_USER__DIR

ENTRYPOINT ["/bin/bash", "-c", "$TUT_USER__DIR/run.sh $APP_DIR"] 