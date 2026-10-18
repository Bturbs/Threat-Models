FROM mcr.microsoft.com/devcontainers/python:3.12

# Layer 1: System deps (rarely changes — cached long-term)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    make \
    curl \
    graphviz \
    default-jre-headless \
    plantuml \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install uv
RUN pip install uv

# Layer 2: Python development tools
RUN uv pip install --system --no-cache \
        pytest>=7.0.0 pytest-cov black flake8 mypy pre-commit \
        sphinx sphinx-rtd-theme \
        build twine wheel debugpy \
    && rm -rf /tmp/*.txt

# Layer 3: Editable installs (run after workspace is mounted)
# These must be postCreateCommand because they need the source code
