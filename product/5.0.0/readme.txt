tar zcvf stskadnetwork_5.0.0.tar.gz stskadnetwork

shasum -a 256 stskadnetwork_5.0.0.tar.gz | awk '{print $1}' > stskadnetwork_5.0.0.txt