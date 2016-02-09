require 'rubygems'
require 'mongo'

include Mongo

##Create a .gfile file in the current directory
def init(name)
  if !File.exists?("./.gfile")
    file_conf = File.new(".gfile", "w")
    file_conf.puts("key:value")	
    file_conf.close
    puts "File ./.gfile created"
    client = Mongo::Client.new(['127.0.0.1:27017'], :database => "gfile")
    coll = client[:directory]
    coll.insert_one({name: name, path: File.absolute_path("."), creation: Time.now})
  else
    puts "Directory is already init"
  end
end##create_file()
