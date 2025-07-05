#!/bin/bash
BOOTSTRAP_SERVER="cluster-a-kafka-bootstrap:9092"

echo "Start delete topic"
for i in {1..100}
do
   /opt/kafka/bin/kafka-topics.sh --bootstrap-server $BOOTSTRAP_SERVER --delete --topic topic-$i
done
echo "Finish delete topic"
