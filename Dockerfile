
FROM c3h3/oblas-py278-scipy-base

RUN apt-get -y install libxft-dev
RUN pip install ipython pyzmq jinja2 tornado 

RUN ipython profile create dark
ADD custom.css /root/.ipython/profile_dark/static/custom/custom.css

# Analysis Tools
RUN cd /tmp && git clone https://github.com/pydata/pandas.git
RUN cd /tmp/pandas && git checkout v0.15.0rc1 && python setup.py install
RUN rm -rf /tmp/pandas

RUN pip install scikit-learn matplotlib
#RUN pip install blz 


# Crawler Tools 
RUN apt-get -y install libxslt1-dev
RUN pip install requests pyquery pymongo

RUN mkdir ipynbs
WORKDIR ipynbs
CMD ipython notebook --no-browser --ip=0.0.0.0 --port 8888 --profile=dark




