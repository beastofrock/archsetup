#!/bin/bash
echo "enter url: "
read url
openssl s_client -servername $url -showcerts -connect $url:443  | openssl x509 -noout -dates
