## Create the file "name" and add it in the Database
def generate_file_db(name)
  file = File.new(name, "w")
  if file
    client = Mongo::Client.new(['127.0.0.1:27017'], :database => "gfile")
    coll_dir = client[:directory]
    coll = client[:file]
    id_dir = false
    coll_dir.find().each do |obj|
      if /#{obj["path"]}/.match(File.absolute_path("./#{name}"))
        puts "Occurence find"
        id_dir = obj["_id"].to_s 
      end
    end
    coll.insert_one({name: name, path: File.absolute_path("./#{name}"), dir: id_dir})
    return file
  else
    puts "File #{name} cannot be created"
    return false
  end
end  ## generate_file_db()
