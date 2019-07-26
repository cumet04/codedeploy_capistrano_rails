#!/bin/bash

set -eu

source $(dirname $0)/deploy_config.sh

targets=$(
find $APP_ROOT/releases -maxdepth 1 -mindepth 1 | \
  sort | \
  # 安全のためcurrent releaseを除外する
  grep -v $(readlink -f $APP_ROOT/current) | \
  # これでKEEP_RELEASES-1行残る（のでcurrentと合わせてKEEP_RELEASES行残る）
  tail -n +$KEEP_RELEASES
)

if [ -n "$targets" ];then
  echo "$targets" | xargs rm -r
fi

