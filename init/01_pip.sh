#!/bin/bash

if ! python3 -m pip show pynvim >/dev/null; then
  python3 -m pip install --user pynvim
fi
