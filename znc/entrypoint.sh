#! /usr/bin/env bash

DATADIR="/znc-data"

# Build modules from source.
if [ -d "${DATADIR}/modules" ]; then
  cwd="$(pwd)"

  modules=$(find "${DATADIR}/modules" -name "*.cpp")

  for module in $modules; do
    cd "$(dirname "$module")"
    /usr/local/bin/znc-buildmod "$module"
  done

  cd "$cwd"
fi

chown -R fluder:fluder "$DATADIR"

/usr/local/bin/znc -f --datadir="$DATADIR" $@
