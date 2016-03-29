#!/usr/bin/env ruby

require "./include/check_cmd.rb"
require "./include/creation_date.rb"
require "./include/get_info.rb"
require "./include/get_type.rb"
require "./include/init.rb"
require "./include/last_line.rb"
require "./include/file_exist.rb"
require "./include/generate_file.rb"
require "./include/generate_file_db.rb"

if check_cmd()  ##Check user's cmd
  ARGV.each do |arg|
    puts "#{arg}:"
    exist = file_exist(arg) ##Check if the file already exist in database
    if exist
      tab = get_info()##Get info from conf file
      com_type = get_type(arg) ##Get the comment's type
      if com_type && tab != false ##If the format is enable and configuration file not empty 
        if exist == 1 ##If file already exist
          file = generate_file_db(arg)
        elsif exist == 2 ##Else if user decide to overwrite the header
          file = generate_file(arg)
        end
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
        puts "File #{name} created"
      else
        puts "File type not recognized"
      end
    end
  end
end
