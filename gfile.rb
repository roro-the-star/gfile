#!/usr/bin/env ruby

if ARGV.count < 1
	puts "Usage: ruby ./test.rb file1 [file2[...]]\n"
else
	ARGV.each do |arg|
		puts "#{arg}:"
		if /.c$/.match(arg)
			file = File.new(arg	, "w")
			file.puts("/*File:#{arg}            */")
			file.puts("/*Author: Romain  */")
			file.puts("/*Email:riehli_r@etna-alternance.net*/")
			file.puts("/*Creation date: #{Time.now}*/")
			file.puts
			file.close
			puts "File created\n"
		else
			puts "File type not recognized"
		end
	end
end
