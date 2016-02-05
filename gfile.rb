#!/usr/bin/env ruby

if ARGV.count < 1
	puts "Usage: ruby ./test.rb file1 [file2[...]]\n"
else
	file_conf = File.new(".gfile", "r")
	tab = {"key"=>"value"}
	while (line = file_conf.gets)
		result = /^([a-z]+):([a-z_@\-\. ]+)$/.match(line)	
		tab[result[1]] = result[2]
	end
	ARGV.each do |arg|
		puts "#{arg}:"
	  file = File.new(arg	, "w")
		if /.c$/.match(arg)#Check if the file has a recognized type
			tab.each do |key, value|
				file.puts("/*#{key}: #{value}*/")
			end
			
			##file.puts("/*File:#{arg}            */")
			##file.puts("/*Author: Name  */")
			##file.puts("/*Email:email@example.net*/")#Will be replace by tab info
			file.puts("/*Creation date: #{Time.now}*/")
			##file.puts
			file.close
			puts "File created\n"
		else
			puts "File type not recognized"
		end
	end
end
