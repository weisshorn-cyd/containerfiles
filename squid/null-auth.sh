#!/bin/bash

while IFS=" " read -r user pass kv; do
    echo "null-auth.sh got: user=$user pass=$pass" >&2
    echo "OK";
done
