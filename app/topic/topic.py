import yaml

for i in range(1,51):
    topic = {
        "apiVersion": "kafka.strimzi.io/v1beta2",
        "kind": "KafkaTopic",
        "metadata": {
          "name": f"topic-{i}",
          "namespace": "source",
          "labels": {
            "strimzi.io/cluster": "cluster-a"
          }
        },
        "spec": {
          "topicName": f"topic-{i}",
          "partitions": 3,
          "replicas": 3,
          "config": {
            "retention.ms": 7200000,
            "segment.bytes": 1073741824
          }
        }
    }
    with open(f"topic-{i}.yaml", "w") as f:
        yaml.dump(topic, f)

import os
for i in range(1, 51):
    os.system(f"oc apply -f topic-{i}.yaml")
