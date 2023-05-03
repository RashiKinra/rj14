# # Check if eslint.options exists in settings.json
# if [[ -f ./.vscode/settings.json && $(grep -c '"eslint.options"' ./.vscode/settings.json) -eq 1 ]]; then
#   echo "eslint.options exists in settings.json"

#   # Check if overrideConfigFile or configFile exists in eslint.options
#   if grep -q '"overrideConfigFile"' ./.vscode/settings.json || grep -q '"configFile"' ./.vscode/settings.json; then
#     echo "overrideConfigFile or configFile exists in eslint.options"
#   else
#     echo "overrideConfigFile or configFile does not exist in eslint.options"
#   fi

# else
#   echo "eslint.options does not exist or is not properly formatted in settings.json"
# fi

# ............................................................................

# Check if eslint.options exists in settings.json
if [[ -f .vscode/settings.json && $(grep -c '"eslint.options"' ./.vscode/settings.json) -eq 1 ]]; then

  # Check if overrideConfigFile or configFile exists in eslint.options
  if grep -q '"overrideConfigFile"' ./.vscode/settings.json; then
    overrideConfigFile=$(grep -Po '"overrideConfigFile"\s*:\s*"\K[^"]+' ./.vscode/settings.json)
    echo "overrideConfigFile exists in eslint.options and has value: $overrideConfigFile"
  fi

  if grep -q '"configFile"' ./.vscode/settings.json; then
    configFile=$(grep -Po '"configFile"\s*:\s*"\K[^"]+' ./.vscode/settings.json)
    echo "configFile exists in eslint.options and has value: $configFile"
  fi

else
  echo "eslint.options does not exist or is not properly formatted in settings.json"
fi