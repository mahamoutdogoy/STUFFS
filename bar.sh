echo "Enter the Student ID to download barcode"
read b
if [ $b -gt 0 ]
then
curl -o mahamat https://kp.christuniversity.in/barbecue?data=$b
fi
