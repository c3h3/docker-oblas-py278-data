
FROM c3h3/oblas-py278-data

RUN apt-get update
RUN apt-get -y install libopencv-dev
RUN apt-get -y install python-opencv

RUN cd /usr/lib/python2.7/dist-packages/ && cp cv* /root/.pyenv/versions/2.7.8/lib/python2.7/site-packages/
RUN cd /root/.pyenv/versions/2.7.8/lib/python2.7/site-packages/ && cp cv2.x86_64-linux-gnu.so cv2.so


VOLUME ["/ipynbs", "/data"]



