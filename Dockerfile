
FROM c3h3/oblas-py278-scipy-base

RUN apt-get -y install libxft-dev
RUN pip install ipython pyzmq jinja2 tornado 

RUN ipython profile create dark
ADD custom.css /root/.ipython/profile_dark/static/custom/custom.css

RUN cd /tmp && git clone -q --branch=v0.15.0rc1 https://github.com/pydata/pandas.git
RUN cd /tmp/pandas && python setup.py build && python setup.py install
RUN rm -rf /tmp/pandas
 

RUN pip install scikit-learn matplotlib 

RUN apt-get -y install libxslt1-dev
RUN pip install requests pyquery pymongo

RUN mkdir ipynbs
WORKDIR ipynbs

RUN git clone https://github.com/PlaYdata/PyCrawlers.git
WORKDIR PyCrawlers
RUN python setup.py install 
WORKDIR dev_ipynbs

#CMD ipython notebook --no-browser --ip=0.0.0.0 --port 8888 --profile=dark




