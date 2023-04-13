# oci_subnetslist

`````
#!/bin/sh 
rm -f subnetdetails-global.csv
regionslist=$(oci iam region list)
regions=$(echo $regionslist | jq -r '.data[] | ."name"')
for region in $regions; echo "Collecting Subnets Details in" $region && do ./listsubnets.sh $region ; done
`````

