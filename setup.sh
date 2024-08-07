#!/bin/sh

set -e

# readyness check
curl -w"\n" -sS -D - --retry-connrefused --retry-delay 1 --retry 100 http://serials:8080/admin/health

# enable tenant
curl -w"\n" -sS -D - -d '{"module_to": "mod-serials-management:1.0.3"}' -HX-Okapi-Tenant:t http://serials:8080/_/tenant

