#! /usr/bin/env sh

. /etc/profile

set -eu

SOURCE="$HOME/.var/jekyll-envs/{{ website_domain }}/"
DESTINATION="/var/www/{{ website_user }}/domains/{{ website_domain }}/"

cd "$SOURCE"

git fetch --quiet origin
git reset --quiet --hard origin/master
git submodule --quiet update --init

bundle install --path .bundle --quiet

exec bundle exec jekyll build --quiet --destination "$DESTINATION"
