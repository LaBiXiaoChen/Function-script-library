#示例：
# touch article_{1..3}.html
# ls
#article_1.html  article_2.html  article_3.html
#目的：把article改为bbs

#方法一

for file in $(ls *html); do
    mv $file bbs_${file#*_}
    # mv $file $(echo $file |sed -r 's/.*(_.*)/bbs\1/')
    # mv $file $(echo $file |echo bbs_$(cut -d_ -f2)
done

#方法二
for file in $(find . -maxdepth 1 -name "*html"); do
     mv $file bbs_${file#*_}
done