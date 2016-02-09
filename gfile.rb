#!/usr/bin/env ruby

require "./check_cmd.rb"
require "./creation_date.rb"
require "./get_info.rb"
require "./get_type.rb"
require "./init.rb"
require "./last_line.rb"

def file_exist(path)
  if File.exists?(path)
		puts "File already exist.\nOverwrite ? [y/n]"
		choice = 'e'
		while choice != 'y' || choice != 'n' 
			choice = $stdin.gets.chomp
			if choice == 'y'
				return true
			elsif choice == 'n'
				return false
			end
		end	
	else
			return true		
	end
end

if check_cmd()	
	ARGV.each do |arg|
		puts "#{arg}:"
		if file_exist(arg)
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
end
