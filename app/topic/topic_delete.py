import os
for i in range(1, 101): 
    os.system(f"oc delete kafkatopics.kafka.strimzi.io topic-{i}")
