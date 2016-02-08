##Create a .gfile file in the current directory
def init()
	file_conf = File.new(".gfile", "w")
  file_conf.puts("key:value")	
	file_conf.close
	puts "File ./.gfile created"
end##create_file()
