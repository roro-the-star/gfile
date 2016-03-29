
#Generate file but don't add it in Database
def generate_file(name)
  file = File.new(name, "w")
  if file
    return file
  else
    puts "File #{name} cannot be created"
    return false
  end
end## generate_file()
