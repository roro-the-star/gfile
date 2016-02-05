#!/usr/bin/env ruby

def get_info()
	if File.exists?("./.gfile")
		file_conf = File.new(".gfile", "r")
	elsif File.exists?("~/.gfile")
		file_conf = File.new("~/.gfile", "r")
	else
		puts "There isn't any conf file"
		return false		
	end
	tab = {"key"=>"value"}
	while (line = file_conf.gets)
		result = /^([a-z]+):([a-z_@\-\. ]+)$/.match(line)	
		tab[result[1]] = result[2]
	end
	return tab
end

def check_cmd()
	if ARGV.count < 1
		puts "Usage: ruby ./test.rb file1 [file2[...]]\n"
		return false
	else
		return true
	end
end

if check_cmd()	
	ARGV.each do |arg|
		puts "#{arg}:"
	  file = File.new(arg	, "w")
		tab = get_info()
		if /.c$/.match(arg) && tab != false #Check if the file has a recognized type
			file.puts ("/*========================================")
			tab.each do |key, value|
				if key != "key"
					file.puts("#{key}: #{value}")
				end
			end
			file.puts("Creation date: #{Time.now}")
			file.puts("=========================================*/")
			file.close
			puts "File created\n"
		else
			puts "File type not recognized"
		end
	end
end
