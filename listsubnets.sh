#!/bin/sh 
export region=$1
rm -f subnets-$region.log
rm -f subnetdetails-$region.log
rm -f subnetdetails-$region.csv

oci search resource structured-search --query-text "query subnet resources" --region $region > subnets-$region.log
subnetsocids=$(cat subnets-$region.log | jq -r '.data.items[] | ."identifier"')
for snid in $subnetsocids; do oci network subnet get --subnet-id $snid --region $region >> subnetdetails-$region.log; done
cat subnetdetails-$region.log | jq -r '.[] | [."freeform-tags"."lm", ."id", ."vcn-id", ."display-name", ."subnet-domain-name", ."prohibit-public-ip-on-vnic", ."cidr-block"]| @csv ' > subnetdetails-$region.csv

echo "[."freeform-tags"."lm", ."id", ."vcn-id", ."display-name", ."subnet-domain-name", ."prohibit-public-ip-on-vnic", ."cidr-block"]" > subnetdetails-global.csv
cat subnetdetails-$region.csv >> subnetdetails-global.csv
