codedeploy_capistrano_rails
----------

AWS codebuild / codedeployにてcapistrano-rails風のファイル配置・デプロイをする設定群です。

railsのasset compileはやらず、独立したnpm run buildによって静的ファイルを生成する想定になっています。
