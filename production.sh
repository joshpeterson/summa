#!/bin/sh
RAILS_ENV=production rake assets:precompile
RAILS_ENV=production SECRET_KEY_BASE=test OPENSHIFT_APP_NAME=database_development RAILS_SERVE_STATIC_FILES=1 rails server -b 0.0.0.0
