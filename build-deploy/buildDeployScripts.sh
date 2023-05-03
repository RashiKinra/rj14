if sfdx force:org:list --clean --json | grep -w "isDefaultDevHubUsername.*true"; then 
echo "Dev Hub is authorized and connected"; 
else 
echo "Dev Hub is not authorized. Authorising Your dev hub."; 
sfdx force:auth:web:login -d -a DevHubOrg -r https://login.salesforce.com 
echo "Dev hub is now authorized and connected." 
fi
read -p "Enter scratch org name(alias): " scratchOrgName
if sfdx force:org:list --all | grep -q "$scratchOrgName"; then  
echo "Scratch org already exists with given name. Pushing code."; 
sfdx force:source:push -u "$scratchOrgName";   
else   
echo "Scratch org does not exist. Creating scratch org ! ";  
sfdx force:org:create -a "$scratchOrgName" edition="Developer";  
echo "Scratch org created. Pushing code.";  
sfdx force:source:push -u "$scratchOrgName"; 
fi

