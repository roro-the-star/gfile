def usage()
  puts "Usage: gfile.rb file1 [file2[...]]\n"
  puts "Or you can init:"
  puts "gfile.rb init name"
end

##Check if arguments are not wrong
def check_cmd()
  if ARGV.count < 1
    usage()
    return false
  elsif ARGV[0] == "init"
    if ARGV.count < 2
      usage()
    else
      init(ARGV[1])
    end
    return false
  else
    return true
  end
end##check_cmd()
