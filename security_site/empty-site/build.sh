#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
SITE_DIR="${1:-build/site-mkdocs}"
if [[ "${SITE_DIR}" != /* ]]; then
  SITE_DIR="${REPO_DIR}/${SITE_DIR}"
fi

MKDOCS_DIR="${REPO_DIR}/build/empty-mkdocs"
mkdir -p "${MKDOCS_DIR}/docs/css"
cp "${REPO_DIR}/security_site/empty-site/index.md" "${MKDOCS_DIR}/docs/index.md"
cp "${REPO_DIR}/security_site/mkdocs/docs/css/mkdocs.css" "${MKDOCS_DIR}/docs/css/mkdocs.css"

cat > "${MKDOCS_DIR}/mkdocs.yml" <<'EOF'
site_name: Threat Models
docs_dir: docs
use_directory_urls: false
nav:
  - Home: index.md
theme:
  name: readthedocs
markdown_extensions:
  - md_in_html
plugins:
  - search
extra_css:
  - css/mkdocs.css
EOF

mkdocs build --clean --config-file "${MKDOCS_DIR}/mkdocs.yml" --site-dir "${SITE_DIR}"
