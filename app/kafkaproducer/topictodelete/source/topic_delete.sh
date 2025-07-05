#!/bin/bash
#BOOTSTRAP_SERVER="cluster-a-kafka-bootstrap:9092"

echo "Start deleting topics"
start=$1
end=$2
for ((i=start; i<=end; i++ ))
do
   echo "Processing topic deletion: topic-$i ..."
   /opt/kafka/bin/kafka-topics.sh --bootstrap-server "$BOOTSTRAP_SERVER" --delete --topic topic-$i
done
echo "Finish deleting topics"
