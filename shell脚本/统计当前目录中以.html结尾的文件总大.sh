for size in $(ls -l *.html |awk '{print $5}'); do
    sum=$(($sum+$size))
done
echo $sum