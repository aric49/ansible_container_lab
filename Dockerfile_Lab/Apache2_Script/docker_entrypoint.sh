#!/bin/bash

apache2ctl -DFOREGROUND $@
exec "$@"
