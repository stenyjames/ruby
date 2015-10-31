#!/usr/bin/ruby

for i in 1..2
   puts "Download songs list from page : #{i}"
   mp3url = "http://freetamilmp3.in/index.php?dir=Ilayaraja%20Evergreen%20Hits&p=1&page=#{i}" + "&sort=0" 
		    #http://freetamilmp3.in/index.php?dir=Ilayaraja%20Evergreen%20Hits&p=1&page=1&sort=0
   puts "The url is " + mp3url
   #system('"C:\Program Files\GnuWin32\bin\wget" -U firefox -O mp3songlist.html "http://freetamilmp3.in/index.php?dir=Ilayaraja%20Evergreen%20Hits&p=1&page=#{i}" + "&sort=0"  ')
   #system(`"C:\Program Files\GnuWin32\bin\wget" -U firefox -O mp3songlist.html #{mp3url}`)
   fdw = file = File.open("mp3page.txt", 'w')
   fdw.puts mp3url
   fdw.close
   
   fdr = File.open("mp3page.txt", 'r')
   while !fdr.eof?
      line1 = fdr.readline
	  mystr = "C:\\Program Files\\GnuWin32\\bin\\wget" + " -U firefox -O mp3songlist.html " +  "'" + line1 + "'"
	  puts mystr 
	  system(`echo #{mystr}`)
   
   file = File.open("mp3songlist.html", 'r')
   while !file.eof?
		line = file.readline
		puts "The content of the file is " + line	
	    if line.include? ".mp3"
			mp3_songnames = []
			split_output = line.split("Ilayaraja Evergreen Hits/")
			split_output.each do |value|
				mp3_songnames = value.split("&amp;sort=0").first
				puts "Song name : " +  mp3_songnames
				songurl = "http://freetamilmp3.in/load/Ilayaraja%20Evergreen%20Hits/" +mp3_songnames
				puts "Song url is " + songurl
				songurl_execute = '"C:\Program Files\GnuWin32\bin\wget" -U firefox -O mp3list.html ' + " " + songurl + " "
				puts "song to download " + songurl_execute
				#system('#{songurl_execute}')
				#system('"C:\Program Files\GnuWin32\bin\wget" -U firefox 
				system('"C:\Program Files\GnuWin32\bin\wget -U firefox -O mp3songlist.html" '  + "'" +  songurl + "'" )
			end
			
			#mp3_songnames.each do |songname|
			# puts songname
				#songurl = "http://freetamilmp3.in/load/Ilayaraja%20Evergreen%20Hits/" +songname
				#system('"C:\Program Files\GnuWin32\bin\wget" -U firefox -O mp3list.html songurl ')
			#end
				
				

		end
	
		
		
	end
	
	
end
	
	file.close
	fdr.close
	
end