FROM ubuntu

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    build-essential \
    ffmpeg \
    libgl1 \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN uv venv --python 3.11 ./ilab && \
    . ./ilab/bin/activate && \
    uv pip install --upgrade pip && \
    pip install torch==2.7.0 torchvision==0.22.0 --index-url https://download.pytorch.org/whl/cu128 && \
    pip install isaaclab[isaacsim,all]==2.2.0 --extra-index-url https://pypi.nvidia.com

# TODO: changeme
ENTRYPOINT ["/bin/bash"]
