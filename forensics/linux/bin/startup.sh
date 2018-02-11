#! /bin/bash
read -p "Netcat host: " NCHOST
read -p "Netcat port: " NCPORT
export NCHOST=${NCHOST}
export NCPORT=${NCPORT}
export PATH=$(pwd)/bin
ash

