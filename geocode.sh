#!/bin/bash
addresses=(
"37 Aberdeen Street, Brooklyn, NY"
"67 Stanhope Street, Brooklyn, NY"
"386 Stockholm Street, Brooklyn, NY"
"828 Hart Street, Brooklyn, NY"
"271 Bleecker Street, Brooklyn, NY"
"368 Evergreen Avenue, Brooklyn, NY"
"17 Jefferson Street, Brooklyn, NY"
"673 Knickerbocker Avenue, Brooklyn, NY"
"99 Grattan Street, Brooklyn, NY"
"75 Beadel Street, Brooklyn, NY"
"96 Moore Street, Brooklyn, NY"
"1327 Halsey Street, Brooklyn, NY"
"1157 Myrtle Avenue, Brooklyn, NY"
)

for addr in "${addresses[@]}"; do
  q=$(echo "$addr" | sed 's/ /+/g; s/,/,/g')
  result=$(curl -s -A "ApartmentSearchTool/1.0 (personal use)" "https://nominatim.openstreetmap.org/search?q=${q}&format=json&limit=1")
  lat=$(echo "$result" | grep -oE '"lat":"[^"]*"' | head -1 | cut -d'"' -f4)
  lon=$(echo "$result" | grep -oE '"lon":"[^"]*"' | head -1 | cut -d'"' -f4)
  echo "$addr | $lat | $lon"
  sleep 1.1
done
