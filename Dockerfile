# Argruments from FROM
FROM nvidia/cuda:9.0-base-ubuntu16.04

RUN echo "/usr/local/cuda-9.0/extras/CUPTI/lib64" > /etc/ld.so.conf.d/cupti.conf

ARG ADDITIONAL_PACKAGE
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        wget \
        tar \
        libgomp1 \
        libcudnn7 \
        cuda-command-line-tools-9-0 \
        cuda-cudart-9-0 \
        cuda-cufft-9-0 \
        cuda-cublas-9-0 \
        cuda-cusparse-9-0 \
        cuda-curand-9-0 \
        cuda-cusolver-9-0 \
        python3-pip \
        ca-certificates\
        gcc \
        git \
        libpq-dev \
        make \
        mercurial \
        cmake \
        unzip \
        yasm \
        pkg-config \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libavformat-dev \
        python \
        python3 \
        python3-dev \
        python3-numpy \
        python-numpy \
        libgtk2.0-dev \
        python-pip \
        python3-pip \
        python-setuptools \
        python3-setuptools \
        vim \
        ${ADDITIONAL_PACKAGE} \
        && rm -rf /var/lib/apt/lists/*

# pip & pip3 upgrade
RUN pip3 install --upgrade pip
RUN pip install --upgrade pip

# installing OpenCV 3.4.2
ENV OPENCV_VERSION="3.4.2"
RUN wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip \
&& unzip ${OPENCV_VERSION}.zip \
&& mkdir /opencv-${OPENCV_VERSION}/cmake_binary \
&& cd /opencv-${OPENCV_VERSION}/cmake_binary \
&& cmake -DBUILD_TIFF=ON \
  -DBUILD_opencv_java=OFF \
  -DWITH_CUDA=OFF \
  -DWITH_OPENGL=ON \
  -DWITH_OPENCL=ON \
  -DWITH_IPP=ON \
  -DWITH_TBB=ON \
  -DWITH_EIGEN=ON \
  -DWITH_V4L=ON \
  -DBUILD_TESTS=OFF \
  -DBUILD_PERF_TESTS=OFF \
  -DCMAKE_BUILD_TYPE=RELEASE \
  -DCMAKE_INSTALL_PREFIX=$(python3 -c "import sys; print(sys.prefix)") \
  -DPYTHON_EXECUTABLE=$(which python3) \
  -DPYTHON_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
  -DPYTHON_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
  .. \
&& make install \
&& rm /${OPENCV_VERSION}.zip \
&& rm -r /opencv-${OPENCV_VERSION}

ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# Install0 Torch preview version
RUN pip3 install torch_nightly -f https://download.pytorch.org/whl/nightly/cu90/torch_nightly.html

RUN git clone https://github.com/DeepBaksuVision/You_Only_Look_Once.git

# add enviroments setting for utf-8 encoding in python
RUN echo export PYTHONIOENCODING=utf-8 >> ~/.bashrc
RUN export PYTHONIOENCODING=utf-8
#RUN sh enviroments_setting.sh

RUN cd You_Only_Look_Once
RUN pip3 install setuptools numpy gitpython torchvision_nightly wandb imgaug pillow matplotlib visdom

# issue was not updated
#RUN pip3 install -r requirements.txt

