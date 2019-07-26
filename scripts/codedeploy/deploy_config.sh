APP_ROOT=/opt/www/application.com

LINKED_PATHS=$(cat << EOF
  log
  tmp/pids
  tmp/cache
  tmp/sockets
  .bundle
EOF
)
KEEP_RELEASES=5
