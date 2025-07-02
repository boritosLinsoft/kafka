#before=$(date  +%s)
#after=$(date -d "+ 1 hour" +%s)
#diff=$((after - before))
#diff_minutes=$((diff / 60))
#
#before1=$(date  +%s)
#after1=$(date -d "+ 1 hour" +%s)
#diff1=$((after1 - before1))
#diff_minutes1=$((diff1/ 60))
#
#echo "Reading messages from topic 1 takes $diff_minutes minutes"
#echo "Reading messages from topic 2 takes $diff_minutes1 minutes"
#
#total_minutes=0
#total_minutes=$((total_minutes + diff_minutes+ diff_minutes1))
#echo "Reading all messages from all topics takes : $total_minutes"

#!/bin/bash

# Exemple de message
message="Message-1 for topic-1 at Tue Jul 1 22:58:04 UTC 2025"

# Extraire la date (tout ce qui suit "at ")
date_str=$(echo "$message" | awk '{print $5, $6, $7, $8, $9, $10}')

# Afficher la date extraite
echo "Date extraite : $date_str"

# Si tu veux convertir la date en timestamp (secondes depuis l'époque Unix)
timestamp=$(date -d "$date_str" +%s 2>/dev/null)
if [ $? -eq 0 ]; then
     echo "Timestamp : $timestamp"
else
     echo "Erreur : format de date invalide"
fi
