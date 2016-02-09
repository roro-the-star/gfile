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
    result = /^([^:]+):([\S ]+)$/.match(line)	
    tab[result[1]] = result[2]
  end
  file_conf.close
  return tab
end## get_info()
