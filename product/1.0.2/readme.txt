tar zcvf stskadnetwork_1.0.2.tar.gz stskadnetwork

shasum -a 256 stskadnetwork_1.0.2.tar.gz | awk '{print $1}' > stskadnetwork_1.0.2.txt