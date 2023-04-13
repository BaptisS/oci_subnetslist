# oci_subnetslist

`````
#!/bin/sh 
rm -f subnetdetails-global.csv
regionslist=$(oci iam region list)
regions=$(echo $regionslist | jq -r '.data[] | ."name"')
for region in $regions; do ./listsubnets.sh $region && echo "Collecting IP addresses assigned in" $region ; done
`````

