##Puts last line in the file
def last_line(file, com_type)
  if com_type[0] == com_type[1]
    file.puts("#{com_type[0]}=========================================")
  else
    file.puts("=========================================#{com_type[1]}")
  end
end#last_line()
