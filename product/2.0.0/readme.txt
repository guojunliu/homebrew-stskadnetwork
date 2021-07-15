tar zcvf stskadnetwork_2.0.0.tar.gz stskadnetwork

shasum -a 256 stskadnetwork_2.0.0.tar.gz | awk '{print $1}' > stskadnetwork_2.0.0.txt