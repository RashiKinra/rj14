# jsons=$(cat force-app/main/default/lwc/.eslintrc.json)
# echo $jsons | node -e "console.log(JSON.parse(require('fs').readFileSync(0, 'utf-8')).overrides[0].rules)"

JSON=$(cat force-app/main/default/lwc/.eslintrc.json)
rules_to_update='[{ "key": "rule1", "value": "error" },{ "key": "rule3", "value": "warn" }]'

new_json=$(echo $JSON | node -e "
  const fs = require('fs');
  const json = JSON.parse(fs.readFileSync(0, 'utf-8'));
  const rules = json.overrides[0].rules;
  const rulesToUpdate = ${rules_to_update};
  for (const rule of rulesToUpdate) {
    if (rules.hasOwnProperty(rule.key)) {
      rules[rule.key] = rule.value;
    } else {
      rules[rule.key] = rule.value;
    }
  }
  console.log(JSON.stringify(json));
")

echo "$new_json" > force-app/main/default/lwc/.eslintrc.json