
FROM c3h3/oblas-py278-shogun

EXPOSE 8888
ENV IPYNB_PROFILE "c3h3-dark"
ENV LD_LIBRARY_PATH "/usr/local/lib:/opt/OpenBLAS/lib/"

WORKDIR ipynbs
RUN ipython profile create c3h3-dark
ADD c3h3_custom.css /root/.ipython/profile_c3h3-dark/static/custom/custom.css
CMD ipython notebook --no-browser --ip=0.0.0.0 --port 8888 --profile=$IPYNB_PROFILE



