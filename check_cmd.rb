##Check if arguments are not wrong
def check_cmd()
  if ARGV.count < 1
    puts "Usage: ruby ./test.rb file1 [file2[...]]\n"
    return false
  elsif ARGV[0] == "init"
    init(ARGV[1])
    return false
  else
    return true
  end
end##check_cmd()
