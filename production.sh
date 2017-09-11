#!/bin/sh
RAILS_ENV=production bundle exec rake assets:precompile
RAILS_ENV=production RAILS_SERVE_STATIC_FILES=1 bundle exec rails server -b 0.0.0.0
