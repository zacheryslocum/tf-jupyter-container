FROM tensorflow/tensorflow:1.15.2-gpu-py3-jupyter

# Make Docker aware of future volumes
VOLUME /tf/pycode
VOLUME /tf/tfCheckpoints
VOLUME /tf/jn-config

# Make Docker aware of future ports
EXPOSE 8484
EXPOSE 8686

# Install Git
RUN apt update && apt install git -y && apt autoclean && apt clean

# Update Pip to latest
RUN python3 -m pip install --upgrade --no-cache-dir pip

# Install additional Python packages
RUN python3 -m pip install --no-cache-dir Cython numpy Shapely requests psutil scipy Pillow scikit-image opencv-python h5py imgaug ipynb jupyter_contrib_nbextensions
RUN python3 -m pip install --no-cache-dir git+https://github.com/philferriere/cocoapi.git#subdirectory=PythonAPI

# Add Jupyter Notebook configuration files
ADD jn-config/ /tf/jn-config

# Run Jupyter Notebook server using config
WORKDIR /tf
CMD ["bash","-c","source /etc/bash.bashrc && jupyter notebook --config /tf/jn-config/jupyter_notebook_config.py"]
