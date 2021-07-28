FROM python:3.9.6-slim-buster
RUN pip install --upgrade pip
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
RUN mkdir /saral_translation
WORKDIR /saral_translation
COPY . /saral_translation
# create directory...
RUN mkdir -p /vol/web/
RUN adduser --disabled-password --gecos '' user
RUN chown -R user:user /vol/
RUN chmod -R 755 /vol/web
USER user
COPY ./entrypoint.sh /
ENTRYPOINT ["sh", "/entrypoint.sh"]
