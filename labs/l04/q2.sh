cat non_existent_file.txt 2>> errors.txt
echo "lol error" > /home/write_test.txt 2>> errors.txt
grep --invalid-option 2>> errors.txt