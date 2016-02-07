#!/usr/bin/env ruby

##Read info from a .gfile file wich is in current or home directory
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
end## get_info()

##Check if arguments are not wrong
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
end##check_cmd()

##Create a .gfile file in the current directory
def init()
	file_conf = File.new(".gfile", "w")
  file_conf.puts("key:value")	
	file_conf.close
	puts "File ./.gfile created"
end##create_file()

##Check file's type and return comment's type
def get_type(path)
	com = {"c"  => ["/*", "*/"],
				 "rb" => ["##", "##"]}
	i =  /.([crb]+)$/.match(path)			 
	if i
		return (com[i[1]])
	else
		return (false)
	end
end##get_type()

##Puts the creation date in the file
def creation_date(file, com_type)
	if com_type[0] == com_type[1]
		file.puts("#{com_type[0]}Creation date: #{Time.now}")
	else
		file.puts("Creation date: #{Time.now}")
	end
end#creation_date()

##Puts last line in the file
def last_line(file, com_type)
	if com_type[0] == com_type[1]
		file.puts("#{com_type[0]}=========================================")
	else
		file.puts("=========================================#{com_type[1]}")
	end
end#last_line()


if check_cmd()	
	ARGV.each do |arg|
		puts "#{arg}:"
	  file = File.new(arg	, "w")
		tab = get_info()
		com_type = get_type(arg)
		if com_type && tab != false 
			file.puts ("#{com_type[0]}========================================")
			tab.each do |key, value|
				if key != "key"
 					if com_type[0] == com_type[1]
						file.puts("#{com_type[1]}#{key}: #{value}")
					else
						file.puts("#{key}: #{value}")
					end
				end
			end
			creation_date(file, com_type)
			last_line(file, com_type)
			file.close
			puts "File created"
		else
			puts "File type not recognized"
		end
	end
end
