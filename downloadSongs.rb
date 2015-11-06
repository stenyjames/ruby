#!/usr/bin/ruby

for i in 1..20
   puts "Download songs list from page : #{i}"
   mp3url = "http://freetamilmp3.in/index.php?dir=Ilayaraja%20Evergreen%20Hits&p=1&page=#{i}" + "&sort=0" 
   puts "The url is " + mp3url
   mystr = "C:\\Program Files\\GnuWin32\\bin\\wget" + " -U firefox -O mp3songlist.html " +  "'" + mp3url + "'"
   puts mystr
   result = `"C:\\Progra~1\\GnuWin32\\bin\\wget"  ' -U firefox -O mp3songlist.html #{mp3url}' `
   
   file = File.open("mp3songlist.html", 'r')
   while !file.eof?
		line = file.readline
		#puts "The content of the file is " + line	
	    if line.include? ".mp3"
		    #puts line
			mp3_songnames = []
			split_output = line.split("file=load/Ilayaraja Evergreen Hits/")
			split_output.each do |value|
				mp3_songnames = value.split("&amp;sort=0").first
				puts "Song name : " +  mp3_songnames
				if !mp3_songnames.include? "<" 
				
				
				if mp3_songnames.include? " " 
				mp3_songnames1 = mp3_songnames.gsub(/[[:space:]]/,'%20')
				puts mp3_songnames1
				songurl = "http://freetamilmp3.in/load/Ilayaraja%20Evergreen%20Hits/" +mp3_songnames1
				puts "Song url is " + songurl
				result1 = `"C:\\Progra~1\\GnuWin32\\bin\\wget"  '  -U firefox  #{songurl} ' `
				end
			 end
			end
	 end
	end
	
	file.close
	
end
