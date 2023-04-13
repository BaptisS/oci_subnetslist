# oci_subnetslist

`````
#!/bin/sh 
rm -f subnetdetails-global.csv
regionslist=$(oci iam region list)
regions=$(echo $regionslist | jq -r '.data[] | ."name"')
for region in $regions; do echo "Collecting Subnets Details in" $region && ./listsubnets.sh $region ; done
cat subnetdetails-global.csv

`````

