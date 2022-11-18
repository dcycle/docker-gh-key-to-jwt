#!/bin/sh
#
# See
# https://docs.github.com/en/developers/apps/building-github-apps/authenticating-with-github-apps#authenticating-as-a-github-app.
# See https://stackoverflow.com/a/64492227/1207752
#
set -e

echo ""
# See http://patorjk.com/software/taag/#p=display&f=Ivrit&t=GH%20App%20PEM2JWT
cat ./scripts/lib/my-ascii-art.txt
echo ""
echo "(JS)"
echo ""

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  >&2 echo "./scripts/generate-jwt.sh takes exactly three (3) arguments. For example, if your .pem file is at /path/to/private-key.pem and your app id is 12345, then you would run: ./scripts/generate-jwt.sh /path/to private-key.pem 12345"
  exit 1
fi

PATH_TO_PEM="$1"
PEM_FILE="$2"
APP_ID="$3"

FULL_PATH_TO_PEM="$PATH_TO_PEM/$PEM_FILE"

echo "Pem file directory is $PATH_TO_PEM"
echo "Pem file name is $PEM_FILE"
echo "Full path to PEM file is $FULL_PATH_TO_PEM"
echo "APP id is $APP_ID"

echo ""
echo "About to check if $FULL_PATH_TO_PEM is a file. If not, abort."
ls -lah "$FULL_PATH_TO_PEM"
echo "Moving on"
echo ""

docker build -f="Dockerfile-js" -t gh-key-to-jwt .
docker run \
  -e PEM_FILE="$PEM_FILE" \
  -e APP_ID="$APP_ID" \
  -v $PATH_TO_PEM:/pem \
  --rm gh-key-to-jwt
