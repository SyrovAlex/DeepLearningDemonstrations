FROM python:3.10-slim-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    wget \
    gcc \
    g++ \
    make \
    build-essential \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    torch==2.0.1 \
    torchvision==0.15.2 \
    torchaudio==2.0.2

RUN pip install --no-cache-dir \
    numpy==1.24.3 \
    pandas==2.0.3 \
    matplotlib==3.7.2 \
    seaborn==0.12.2 \
    scikit-learn==1.3.0 \
    scipy==1.11.1 \
    jupyter==1.0.0 \
    notebook==6.5.7 \
    ipywidgets==8.0.7 \
    tqdm==4.65.0 \
    pillow==9.5.0 \
    plotly==5.15.0 \
    opencv-python==4.8.1.78 \
    tensorboard==2.14.0 \
    traitlets==5.9.0

WORKDIR /workspace
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
