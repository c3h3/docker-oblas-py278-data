
FROM c3h3/oblas-py278-scipy-base

RUN apt-get install libxft-dev
RUN pip install ipython pyzmq jinja2 tornado 

RUN ipython profile create dark
ADD custom.css /root/.ipython/profile_dark/static/custom/custom.css

RUN pip install scikit-learn pandas matplotlib 


RUN mkdir ipynbs
WORKDIR ipynbs
CMD ipython notebook --no-browser --ip=0.0.0.0 --port 8888 --profile=dark




