#!/usr/bin/env ruby

if ARGV.count < 1
	puts "Usage: ruby ./test.rb file1 [file2[...]]\n"
else
	file_conf = File.new(".gfile", "r")
	tab = {"key"=>"value"}
	while (line = file_conf.gets)
		result = /^([a-z]+):([a-z]+)$/.match(line)	
		#TODO: make each tab's case for each line
	end
	ARGV.each do |arg|
		puts "#{arg}:"
		if /.c$/.match(arg)#Check if the file has a recognized type
			file = File.new(arg	, "w")
			file.puts("/*File:#{arg}            */")
			file.puts("/*Author: Name  */")
			file.puts("/*Email:email@example.net*/")#Will be replace by tab info
			file.puts("/*Creation date: #{Time.now}*/")
			file.puts
			file.close
			puts "File created\n"
		else
			puts "File type not recognized"
		end
	end
end
