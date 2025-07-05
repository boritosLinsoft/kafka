#!/bin/bash
BOOTSTRAP_SERVER="cluster-a-kafka-bootstrap:9092"

for i in {1..50}
do
   echo "Start writing to topic-$i at $(date)"
   for j in {1..20}
   do
      echo "Message-$j for topic-$i"
      echo "Message-$j for topic-$i at $(date)" | /opt/kafka/bin/kafka-console-producer.sh --bootstrap-server $BOOTSTRAP_SERVER --topic topic-$i
   done
   echo "Finish writing to topic-$i at $(date)"
done
