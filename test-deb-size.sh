#!/bin/bash

loop_start=1
loop_count=9

echo "Create DEB multiple times to check if resulting size stays the same" 

echo "Create DEB in loop: 1..$loop_count"

target_dir="./build-deb"
target_file="foo_1.0.0_amd64.deb"
diff_count=0

log_file="./buld-deb.log"

for i in $(seq $loop_start $loop_count)
do
   rm -rf $target_dir
   echo -n "DEB i: $i"
   ./build-deb.sh $target_dir 2>&1 >> $log_file
   #ls -l $target_dir
   target_size=$(stat --printf="%s" $target_dir"/"$target_file)
   echo -n "; now DEB size: $target_size"
   if [ -z "$prev_target_size" ]; then
        prev_target_size=$target_size
   fi
   if [ "$prev_target_size" != "$target_size" ]; then
        echo -n " ::: GOT different size!!! prev: [$prev_target_size]"
        ((diff_count++))
   fi
   prev_target_size=$target_size
   echo ""
   sleep 1
done

echo "Done. Got diffs: $diff_count"
