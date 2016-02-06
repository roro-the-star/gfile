#!/usr/bin/env ruby

def get_info()
	if File.exists?("./.gfile")
		file_conf = File.new(".gfile", "r")
	elsif File.exists?("/home/romain/.gfile")
		file_conf = File.new("#{ENV['HOME']}/.gfile", "r")
	else
		puts "There isn't any conf file"
		return false		
	end
	tab = {"key"=>"value"}
	while (line = file_conf.gets)
		result = /^([a-z]+):([a-z_@\-\. ]+)$/.match(line)	
		tab[result[1]] = result[2]
	end
	file_conf.close
	return tab
end

def check_cmd()
	if ARGV.count < 1
		puts "Usage: ruby ./test.rb file1 [file2[...]]\n"
		return false
	elsif ARGV[0] == "init"
		init()
		return false
	else
		return true
	end
end

def init()
	file_conf = File.new(".gfile", "w")
  file_conf.puts("key:value")	
	file_conf.close
	puts "File ./.gfile created"
end

if check_cmd()	
	ARGV.each do |arg|
		puts "#{arg}:"
	  file = File.new(arg	, "w")
		tab = get_info()
		if /.c$/.match(arg) && tab != false 
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
