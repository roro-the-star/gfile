##Check file's type and return comment's type
def get_type(path)
	com = {"c"  => ["/*", "*/"],
				 "rb" => ["##", "##"]}
	i =  /.([crb]+)$/.match(path)			 
	if i
		return (com[i[1]])
	else
		return (false)
	end
end##get_type()
