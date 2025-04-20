#!/bin/bash
#
# Copyright 2018 by Gregory L. Dietsche <gregory.dietsche@cuw.edu>
#
# This script generates a /etc/hosts file that can be used to turn safe search on permanently.
#
# From Google:
# If you’re managing a Google Account for a school or workplace, you can
# prevent most adult content from showing up in search results by turning on
# the SafeSearch setting. To force SafeSearch for your network, you’ll need to
# update your DNS configuration. Set the DNS entry for www.google.com (and any
# other Google ccTLD country subdomains your users may use) to be a CNAME for
# forcesafesearch.google.com.
#
# Forked And Modified since 20-04-2025


# Delete ALL before executing
sed -i d /home/runner/work/safesearch-enforcing-hosts/safesearch-enforcing-hosts/brave/hosts.txt


# Where to download the list of domains that google search uses.
# hostURLs=https://www.google.com/supported_domains


# Files
tempfile='/home/runner/work/safesearch-enforcing-hosts/safesearch-enforcing-hosts/brave/supported-domains'
output='/home/runner/work/safesearch-enforcing-hosts/safesearch-enforcing-hosts/brave/hosts.txt'


# IP Address for Brave strict mode
#IPSix=$(dig strict.bing.com AAAA +short)
IPFour=3.33.205.124
#if [ -z "$IPSix" ] || [ -z "$IPFour" ]; then
#        echo "Getting IP address for forcesafesearch.google.com failed"
#	exit 1
#fi


#Fetch a current list of Google owned domains
#code=$(curl --silent --write-out %{http_code} --output $tempfile $hostURLs)
#if [ "$code" -ne "200" ] ; then
#        rm $tempfile
#        echo Fetching list of google owned domains failed with http status code $code
#        exit $code
#fi


# Function: generate_hosts


function generate_hosts {
	sed "s/^/$1 /" $tempfile >> $output
}


# Generate hosts file that will cause/ Safe Search to be always on
# echo "# Google Safe Search Host List" > $output
# echo "# Generated on $(date)" >> $output
# echo "# From: $hostURLs" >> $output
# echo >> $output
echo "#$IPFour safesearch.brave.com" >> $output
#echo "#$IPSix safesearch.brave.com >> $output
echo >> $output
#generate_hosts $IPSix
generate_hosts $IPFour


#rm $tempfile
