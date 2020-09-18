#! /bin/bash

#this script is assuming the BTS_data.txt file is in the working directory

#create the child script with the bash script header
echo "#! /bin/bash" > Lewis_cs.sh

#append the code to the child script:
#create a head.txt file for the headers
echo "grep ID BTS_data.txt > head.txt" >> Lewis_cs.sh

#cut wanted columns from the head.txt file to the Lewis_Final.txt file
echo "cut -f 1,2,4 head.txt > Lewis_Final.txt" >> Lewis_cs.sh

#remove head file
echo "rm head.txt" >> Lewis_cs.sh

#modify the child script to cut the ID, Year and Trappability columns to a new file
echo "cut -f 1,2,4 BTS_data.txt > text2.txt" >> Lewis_cs.sh

#modify child script to extract the snakes 10-89 from text.txt, reverse sort by trappability, and add to Lewis_Final.txt file
#in order for the child script to work on my computer, I had to put the  quotes around Num
echo "for Num in {10..89};do grep 13BTS0$"Num" text2.txt;done | sort -k3gr >> Lewis_Final.txt" >> Lewis_cs.sh 

#remove the text.txt file
echo "rm text2.txt" >> Lewis_cs.sh

#compress the final file
echo "tar -czvf Lewis_Final.txt.gz Lewis_Final.txt" >> Lewis_cs.sh

#make the child script executable
chmod u+x Lewis_cs.sh

#execute child script
./Lewis_cs.sh

#print the first 10 lines of Lewis_Final.txt to the screen
echo " "
echo "The first 10 lines of Lewis_Final.txt are:"
echo " "
column -t Lewis_Final.txt | head

#remove child script and uncompressed files after executing
rm Lewis_cs.sh Lewis_Final.txt

#list the Lewis_Final file
echo " "
echo "This is the final assignment 2 project file for Lewis, Cari:";
echo " "
ls -lth Lewis_Final.txt.gz
