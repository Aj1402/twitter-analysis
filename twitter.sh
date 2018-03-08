#!/bin/bash

SPARK_PATH=/usr/local/spark/
cd $SPARK_PATH
sudo service elasticsearch start
sudo service kibana start
./sbin/start-master.sh
./bin/spark-submit --class com.minor.twitteranalysis.TwitterSentimentAnalysis \
                      --master spark://spar-master address \
                      --num-executors 2 \
                      --driver-memory 2g \
                      --executor-memory 2g \
                      --executor-cores 1 \
		      --jars ./jars/spark-core_2.11-1.5.2.logging.jar file:"Your Jar File" \
"Twitter API credentials" \ keywords



