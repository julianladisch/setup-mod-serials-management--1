#!/bin/sh

set -e

# readyness check
curl -w"\n" -sS -D - --retry-connrefused --retry-delay 1 --retry 100 http://serials:8080/admin/health

N=20

# enable tenants
for t in `seq $N`
do
  curl -w"\n" -sS -D - -d '{"module_to": "mod-serials-management:1.0.3"}' -HX-Okapi-Tenant:t$t http://serials:8080/_/tenant > /tmp/t$t &
done

# wait 2 minutes
sleep 120

# print response from enable API
for t in `seq $N`
do
  echo t$t
  cat /tmp/t$t
done
