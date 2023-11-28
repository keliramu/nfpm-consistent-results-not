# nfpm-consistent-results-not
Scripts to show nfpm problem with inconsistent builds i.e. trying to package same content produces different size result deb package

Dependencies: install `nfpm` (see https://nfpm.goreleaser.com/install/)

Execute test:

```
$ ./test-deb-size.sh 
```

Example output:
```
~/nfpm-consistent-results-not$ ./test-deb-size.sh 
Create DEB multiple times to check if resulting size stays the same
Create DEB in loop: 1..9
DEB i: 1; now DEB size: 864
DEB i: 2; now DEB size: 864
DEB i: 3; now DEB size: 866 ::: GOT different size!!! prev: [864]
DEB i: 4; now DEB size: 864 ::: GOT different size!!! prev: [866]
DEB i: 5; now DEB size: 864
DEB i: 6; now DEB size: 864
DEB i: 7; now DEB size: 864
DEB i: 8; now DEB size: 864
DEB i: 9; now DEB size: 864
Done. Got diffs: 2
```
