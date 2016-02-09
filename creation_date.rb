##Puts the creation date in the file
def creation_date(file, com_type)
  if com_type[0] == com_type[1]
    file.puts("#{com_type[0]}Creation date: #{Time.now}")
  else
    file.puts("Creation date: #{Time.now}")
  end
end#creation_date()
