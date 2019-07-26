#!/bin/bash

set -eu
source $(dirname $0)/deploy_config.sh

NEW_RELEASE=$APP_ROOT/releases/$(date +%Y%m%d%H%M%S)
cp -r $APP_ROOT/codedeploy $NEW_RELEASE

# lnで既存ディレクトリを上書きすることができないため明示的に消す
rm -r $NEW_RELEASE/log

for dir in $LINKED_PATHS; do
  mkdir -p $(dirname $NEW_RELEASE/$dir)
  ln -sfn $APP_ROOT/shared/$dir $NEW_RELEASE/$dir
done

# ----------

cd $NEW_RELEASE
bundle install --path .bundle --without test development --deployment

# ----------

ln -sfn $NEW_RELEASE $APP_ROOT/current

sudo systemctl restart app

echo -n "$(basename $NEW_RELEASE) " >> $APP_ROOT/revisions.log
cat $NEW_RELEASE/REVISION >> $APP_ROOT/revisions.log
