def file_exist(path)
  if File.exists?(path)
    puts "File already exist.\nOverwrite the header ? [y/n]"
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
