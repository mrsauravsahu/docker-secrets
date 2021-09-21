for i in `ls -1 services`; do
  echo "generating secrets for '$i' service"
  SERVICE="$(echo $i | tr 'a-z' 'A-Z')_SERVICE_"
  cat .envrc | grep "^export $SERVICE" > services/$i/.env
  
  REPLACE_STR="s/export $SERVICE//g"
  echo "removing env prefixes - $REPLACE_STR"
  sed -i '' -e "$REPLACE_STR" services/$i/.env
done