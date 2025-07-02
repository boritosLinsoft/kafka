#!/bin/bash
BOOTSTRAP_SERVER="cluster-b-kafka-bootstrap:9092"

total_minutes=0
for i in {1..50}
do
	before=$(date +%s)
	print=0
	/opt/kafka/bin/kafka-console-consumer.sh --bootstrap-server $BOOTSTRAP_SERVER --topic .topic-$i --from-beginning --max-messages 20 | while read -r line
        do   
	       if [ $print -eq 0 ]; then
	           date_str=$(echo "$line" | awk '{print $5, $6, $7, $8, $9, $10}')
		   echo "The time when the first message was produced to the topic on the source cluster : $date_str"
		   print=1
               fi
	       
	       echo "$line"
	done
	after=$(date +%s)
	diff=$((after - before))
        diff_minutes=$((diff / 60))
	echo "Reading messages from topic-$i takes $diff_minutes minutes."
        total_minutes=$((total_minutes + diff_minutes))
done
echo "Reading all messages from all topics takes : $total_minutes"
