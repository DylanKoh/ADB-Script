#! /bin/bash
echo "Please enter a directory to pull:"
read directory
echo "Please enter a directory to pull into:"
read directoryIn
echo "Please enter a hash to find:"
read hashOfFile
echo "Please enter hash format:"
read hashFormat
echo "Please enter device to connect:"
read device
adb connect $device:5555
adb -s $device:5555 pull $directory $directoryIn
find $directoryIn -type f -exec "$hashFormat"sum '{}' \; > "$hashFormat"_hashes.txt
tree $directoryIn > pulled_directory.txt
grep $hashOfFile "$hashFormat"_hashes.txt
