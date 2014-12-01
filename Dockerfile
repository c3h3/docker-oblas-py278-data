
FROM c3h3/oblas-py278-scipy-base:u1404

RUN apt-get update && apt-get -y install libxft-dev
RUN pip install ipython pyzmq jinja2 tornado 

# Analysis Tools
RUN cd /tmp && git clone https://github.com/pydata/pandas.git
RUN cd /tmp/pandas && git checkout v0.15.1 && python setup.py install
RUN rm -rf /tmp/pandas

RUN pip install scikit-learn matplotlib
RUN pip install blz 


# Crawler Tools 
RUN apt-get -y install libxslt1-dev
RUN pip install requests pyquery pymongo
RUN pip install pillow

RUN mkdir ipynbs
RUN mkdir data
VOLUME ["/ipynbs", "/data"]



