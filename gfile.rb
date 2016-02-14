#!/usr/bin/env ruby

require "./include/check_cmd.rb"
require "./include/creation_date.rb"
require "./include/get_info.rb"
require "./include/get_type.rb"
require "./include/init.rb"
require "./include/last_line.rb"
require "./include/file_exist.rb"

def generate_file(name)
  file = File.new(name, "w")
  if file
    client = Mongo::Client.new(['127.0.0.1:27017'], :database => "gfile")
    coll_dir = client[:directory]
    coll = client[:file]
    id_dir = false
    coll_dir.find().each do |obj|
      if /#{obj["path"]}/.match(File.absolute_path("./#{name}"))
        puts "Occurence find"
        id_dir = obj["_id"] 
      end
    end
    coll.insert_one({name: name, path: File.absolute_path("./#{name}"), dir: id_dir})
  else
    puts "File #{name} cannot be created"
  end
  return file
end

if check_cmd()  
  ARGV.each do |arg|
    puts "#{arg}:"
    if file_exist(arg)
      tab = get_info()
      com_type = get_type(arg)
      if com_type && tab != false 
        file = generate_file(arg)
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
