#!/bin/bash
# Package existing Linux runtime files; never compile or deploy them here.
set -euo pipefail

if [[ "$OSTYPE" != linux* ]]; then
    printf '%s\n' 'Packaging failed: this entry point requires Linux.' >&2
    exit 1
fi
if (( $# != 0 )); then
    printf '%s\n' 'Packaging failed: this entry point takes no arguments.' >&2
    exit 1
fi

project_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
python="$HOME/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/bin/python3"
if [[ ! -x "$python" ]]; then
    printf 'Required Python is missing: %s\n' "$python" >&2
    exit 1
fi
unset PYTHONHOME PYTHONPATH
export PYTHONDONTWRITEBYTECODE=1
exec "$python" -B -u "$project_root/tools/package-linux.py"
