# oci_subnetslist

`````
#!/bin/sh 
rm -f listsubnets.sh
wget https://raw.githubusercontent.com/BaptisS/oci_subnetslist/main/listsubnets.sh
chmod +x listsubnets.sh
rm -f subnetdetails-global.csv
regionslist=$(oci iam region list)
regions=$(echo $regionslist | jq -r '.data[] | ."name"')
for region in $regions; do echo "Collecting Subnets Details in" $region && ./listsubnets.sh $region ; done
rm -f listsubnets.sh
cat subnetdetails-global.csv


`````

