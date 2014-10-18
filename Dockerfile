
FROM c3h3/oblas-py278-data

EXPOSE 8888
ENV IPYNB_PROFILE "dark"

WORKDIR ipynbs
RUN ipython profile create dark
ADD custom.css /root/.ipython/profile_dark/static/custom/custom.css
CMD ipython notebook --no-browser --ip=0.0.0.0 --port 8888 --profile=$IPYNB_PROFILE



