
FROM c3h3/oblas-py278-data

EXPOSE 8888
ENV IPYNB_PROFILE "c3h3-dark"

WORKDIR ipynbs
RUN ipython profile create c3h3-dark
ADD c3h3_custom.css /root/.ipython/profile_c3h3-dark/static/custom/custom.css
CMD ipython notebook --no-browser --ip=0.0.0.0 --port 8888 --profile=$IPYNB_PROFILE



