#!/usr/bin/env bash
# Helper script to run Jac programs inside freshvenv
if [ -z "$1" ]; then
  echo "Usage: $0 <file.jac>"
  exit 1
fi
PY="/home/peter/jac_project/freshvenv/bin/python"
"$PY" -m jaclang.cli.cli run "$1"
